# 💬 Dialogue System Cheat Sheet (Current Version)

이 문서는 현재(Phase 29) 시점에서 사용 가능한 대화 구문과 헬퍼 함수들을 요약한 **속성 가이드(Cheat Sheet)**입니다.
본격적인 **"통합 매뉴얼"**은 퀘스트 시스템(Phase 30)이 완성된 후, 퀘스트 데이터와 연동하는 방법을 포함하여 작성하는 것을 추천합니다.

---

## 1. 기본 구문 (DSL Syntax)

### 대화 시작 및 기본
```text
~ start

Talula: 안녕! 무슨 일이야?
```
- `~ start`: 대화의 시작점이 되는 **Title**입니다.
- `Speaker: Text`: 화자 이름과 대사입니다.

### 선택지 (Options)
```text
~ start
Talula: 선택해봐!
- 첫 번째 선택지
    Talula: 1번을 골랐구나.
- 두 번째 선택지
    Talula: 2번이네.
- 대화 종료 => END
```
- `-`: 대시로 시작하면 선택지가 됩니다.
- `=>`: 화살표는 이동(Jump)입니다. `=> END`는 대화 종료, `=> start`는 처음으로 돌아가기입니다.

### 조건문 (Conditions)
```text
if NPCManager.has_met("Talula") == false:
    Talula: 처음 뵙네요!
else:
    Talula: 또 왔군요!
```
- `if`, `elif`, `else`를 사용할 수 있습니다.
- 뒤에 오는 조건은 GDScript 코드와 동일합니다.

### 코드 실행 (Effect / Mutations)
```text
do NPCManager.change_affection("Talula", 10)
do InventoryManager.consume_item_by_id("wood", 1)
```
- `do`: 대화 도중 게임 로직을 실행할 때 사용합니다.

---

## 2. 자주 쓰는 헬퍼 함수 (Project Helpers)

우리가 `NPCManager`와 `InventoryManager`에 추가한 대화 전용 함수들입니다.

### 🧠 기억 및 호감도 (NPCManager)
| 함수 | 설명 | 예시 |
| :--- | :--- | :--- |
| `has_met(id)` | 첫 만남 여부 확인 (`bool`) | `if NPCManager.has_met("Talula"):` |
| `set_met(id)` | 만남 처리 (보통 첫 대화 끝에 사용) | `do NPCManager.set_met("Talula")` |
| `get_affection(id)` | 현재 호감도 가져오기 (`int`) | `if NPCManager.get_affection("Talula") >= 50:` |
| `change_affection(id, amount)` | 호감도 변경 | `do NPCManager.change_affection("Talula", 10)` |

### 🎒 인벤토리 (InventoryManager)
| 함수 | 설명 | 예시 |
| :--- | :--- | :--- |
| `has_item_by_id(item_id, count)` | 아이템 보유 확인 (`bool`) | `if InventoryManager.has_item_by_id("wood", 5):` |
| `consume_item_by_id(item_id, count)` | 아이템 소모 (성공 시 `true`) | `do InventoryManager.consume_item_by_id("wood", 5)` |

---

## 3. 실전 패턴 예시

### 🎁 선물 주기 (조건부 선택지)
인벤토리에 'wood'가 있을 때만 선택지가 나타나게 하려면 `[if ...]` 태그를 선택지 뒤에 붙입니다.

```text
Talula: 뭐 줄 거 있어?
- (선물) 나무 1개 주기 [if InventoryManager.has_item_by_id("wood", 1)]
    Talula: 고마워!
    do InventoryManager.consume_item_by_id("wood", 1)
    do NPCManager.change_affection("Talula", 10)
- 딱히 없어.
    Talula: 그렇구나.
```
