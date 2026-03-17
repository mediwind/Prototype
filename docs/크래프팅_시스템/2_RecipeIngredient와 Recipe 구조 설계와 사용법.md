# RecipeIngredient와 Recipe 구조 설계와 사용법

---

## 1. RecipeIngredient 설계에 대한 상세 설명

### **왜 RecipeIngredient가 필요한가?**

- 앞으로 **재료가 아이템만이 아니라 재화, 특수 데이터 등 다양해질 수 있기 때문**입니다.
- 예를 들어,
    - "철광석 10개" (아이템)
    - "골드 100" (재화)
    - "특정 퀘스트 완료" (특수 조건)
- 이런 다양한 재료를 하나의 배열로 관리하려면 **타입, 데이터, 수량**을 모두 담을 수 있는 구조가 필요합니다.

### **RecipeIngredient 설계 방법**

### **1. 새 리소스(RecipeIngredient.gd)로 설계**

```python
extends Resource
class_name RecipeIngredient

@export var type: String # "item", "currency", "custom" 등
@export var item_data: ItemData
@export var currency_data: CurrencyData
@export var amount: int = 1

```

- **type**: 재료의 종류("item", "currency" 등)
- **item_data**: 아이템일 경우 참조
- **currency_data**: 재화일 경우 참조
- **amount**: 필요한 수량

### **2. Recipe 리소스에서 사용**

```python
@export var ingredients: Array[RecipeIngredient] = []
@export var output_items: Array[RecipeIngredient] = []

```

- 이제 재료와 결과물 모두 다양한 타입을 지원할 수 있습니다.

### **3. 기존 리소스 파일 수정**

- 기존의 `Recipe` 리소스 파일에서`ingredients`와 `crafted_items`를`Array[ItemData]`에서 `Array[RecipeIngredient]`로 변경해야 합니다.
- 기존 아이템 데이터(`ItemData`)는 그대로 사용하고,
재화 등 새로운 타입이 필요하면 해당 데이터 리소스를 추가로 만듭니다.

---

### **정리**

- **RecipeIngredient는 새로 만드는 리소스**입니다.
- 기존의 `Recipe` 리소스 파일에서`ingredients`와 `crafted_items`를`Array[ItemData]` → `Array[RecipeIngredient]`로 변경해야 합니다.
- 기존의 `ItemData` 등은 그대로 사용하고,
필요에 따라 `CurrencyData` 등 다른 데이터 리소스를 추가로 만듭니다.

---

## 결론

- **여러 슬롯에 나뉜 재료/결과물 합산 및 합치기 모두 구현 가능합니다.**
- **RecipeIngredient는 새로 만드는 리소스이며,
Recipe 리소스의 ingredients/output_items 타입을 이걸로 바꾸면
아이템, 재화, 기타 데이터 등 어떤 재료든 유연하게 지원할 수 있습니다.**

# 질문

1. 만일 재료나 결과물이 아이템이기만한 경우 화폐가 null이 되어 문제가 생기는 경우는 없어?
2. 이미 ItemData로 만들어 둔 #file:health_potion.tres #file:sword.tres 아이템들을 사용해 크래프팅 하는 경우는 어떻게 해야해? 포션 3개로 검 1개를 만드는 레시피를 원한다면 아이템 리소스 파일로 굳이 또 RecipeIngredient 리소스 파일을 만들고 이걸 Recipe 리소스 파일의 재료와 결과물로 등록해야 해?

# 답변

아주 중요한 질문입니다!

아래에 두 고민 모두 실무적으로 답변드릴게요.

---

## 1. 재료나 결과물이 아이템만인 경우 currency_data가 null이어도 문제 없는가?

**문제 없습니다.**

- Godot에서 `@export var currency_data: CurrencyData`는
Inspector에서 값을 지정하지 않으면 기본적으로 `null`입니다.
- 실제 크래프팅 로직에서는 `type == "item"`일 때만 `item_data`를 사용하고,`type == "currency"`일 때만 `currency_data`를 사용하면
나머지는 null이어도 아무런 문제가 발생하지 않습니다.
- 즉, **RecipeIngredient의 type에 따라 필요한 데이터만 사용**하면 됩니다.

**예시:**

```python
if ingredient.type == "item":
    # ingredient.item_data만 사용 (currency_data는 무시)
elif ingredient.type == "currency":
    # ingredient.currency_data만 사용 (item_data는 무시)

```

---

## 2. 이미 만들어둔 ItemData 리소스(포션, 검 등)를 RecipeIngredient로 사용하려면?

### **권장 방식: RecipeIngredient 리소스 파일을 별도로 만들어 연결**

- **RecipeIngredient는 "이 레시피에서 이 아이템을 몇 개 쓸 것인지"를 명확히 지정하는 용도**입니다.
- 따라서,
    - 포션 3개를 재료로 쓴다면
    → `type = "item"`, `item_data = health_potion.tres`, `amount = 3`인 RecipeIngredient 리소스를 만듭니다.
    - 검 1개를 결과물로 준다면
    → `type = "item"`, `item_data = sword.tres`, `amount = 1`인 RecipeIngredient 리소스를 만듭니다.
- 그리고 **Recipe 리소스의 ingredients/output_items 배열에 이 RecipeIngredient 리소스들을 추가**합니다.

### **왜 이렇게 하는가?**

- Inspector에서 배열에 직접 아이템 리소스와 수량을 지정할 수 없기 때문입니다.
- RecipeIngredient 리소스를 만들면
    - 다양한 타입(아이템, 재화, 기타)을 통일된 방식으로 관리할 수 있고,
    - Inspector에서 드래그&드랍으로 쉽게 연결할 수 있습니다.
- **이 방식은 Godot에서 가장 직관적이고 확장성 있는 방법**입니다.

---

### **정리**

- **RecipeIngredient 리소스 파일을 만들어서**
    - `item_data`에 health_potion.tres, `amount = 3`
    - `item_data`에 sword.tres, `amount = 1`
    - 등으로 각각 저장
- **Recipe 리소스의 ingredients/output_items에 이 RecipeIngredient 리소스들을 추가**

---

**추가 팁:**

- RecipeIngredient 리소스 파일 이름을 `ingredient_health_potion_3.tres`, `output_sword_1.tres` 등으로 관리하면
나중에 재사용/검색이 편리합니다.

---

**결론:**

- currency_data가 null이어도 type 분기로 문제 없음
- 이미 만든 ItemData 리소스는 RecipeIngredient 리소스에 연결해서 사용
- Recipe 리소스에는 RecipeIngredient 리소스만 배열로 등록

이 방식이 Godot에서 가장 보편적이고 유지보수에 유리합니다!

# 활용 예시)

#file:currency_data.gd 에서 gold, faith, soul을 각각 10, 20, 30씩 그리고 아이템으로 #file:health_potion.tres 3개를 재료로 삼은 다음, #file:sword.tres 1개를 제작하는 레시피를 설계하고 싶다면 엔진에서 어떻게 설정해야 해?

아래와 같이 Godot 에디터에서 설정하면 됩니다!

---

## 1. **RecipeIngredient 리소스 생성**

### (1) Health Potion 3개 (아이템 재료)

- **res://resources/recipe/ingredient_health_potion_3.tres**
    - type: `"item"`
    - item_data: `res://resources/item/health_potion.tres`
    - currency_data: (비워둠/null)
    - amount: `3`

### (2) Gold 10 (재화 재료)

- **res://resources/recipe/ingredient_gold_10.tres**
    - type: `"currency"`
    - item_data: (비워둠/null)
    - currency_data: `res://saved_data/currency_data.gd` (gold, faith, soul이 모두 0이어도 상관없음, 실제로는 type과 amount만 사용)
    - amount: `10`

### (3) Faith 20 (재화 재료)

- **res://resources/recipe/ingredient_faith_20.tres**
    - type: `"currency"`
    - item_data: (비워둠/null)
    - currency_data: `res://saved_data/currency_data.gd`
    - amount: `20`

### (4) Soul 30 (재화 재료)

- **res://resources/recipe/ingredient_soul_30.tres**
    - type: `"currency"`
    - item_data: (비워둠/null)
    - currency_data: `res://saved_data/currency_data.gd`
    - amount: `30`

### (5) Sword 1개 (결과물)

- **res://resources/recipe/output_sword_1.tres**
    - type: `"item"`
    - item_data: `res://resources/item/sword.tres`
    - currency_data: (비워둠/null)
    - amount: `1`

---

## 2. **Recipe 리소스 생성**

- **res://resources/recipe/recipe_sword_from_potion_and_currency.tres**
    - name: `"Sword Crafting"`
    - ingredients:
        - `ingredient_health_potion_3.tres`
        - `ingredient_gold_10.tres`
        - `ingredient_faith_20.tres`
        - `ingredient_soul_30.tres`
    - output_items:
        - `output_sword_1.tres`

---

## 3. **설정 방법 요약 (Godot 에디터에서)**

1. **FileSystem 패널에서**`res://resources/recipe/` 폴더로 이동
2. **각 RecipeIngredient 리소스 파일 생성**
    - 우클릭 → New Resource... → RecipeIngredient 선택
    - 위 값대로 Inspector에서 설정 후 저장
3. **Recipe 리소스 파일 생성**
    - 우클릭 → New Resource... → Recipe 선택
    - name, ingredients, output_items에 위에서 만든 RecipeIngredient 리소스들을 배열로 추가

---

## 4. **참고**

- currency_data는 실제로 gold/faith/soul 중 어떤 값을 사용할지는 RecipeIngredient의 type과 amount로 분기해서 코드에서 처리하면 됩니다(예: type이 "currency"이고 currency_data가 gold라면 gold 차감).
- amount는 각각의 필요 수량/제작 수량을 의미합니다.

---

**이렇게 하면 엔진에서 원하는 레시피 구성이 완성됩니다!**