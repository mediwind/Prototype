# 총알 시스템을 더욱 Composition에 부합하게

### **문서화: `#file:base_bullet.gd`와 `#file:basic_bullet.gd`의 Composition 방식으로의 전환**

---

### **1. 기존 설계: Inheritance 방식**

### **1.1. 설계 개요**

- 이전에는 `BaseBullet`을 상속받아 `BasicBullet`, `ExplosiveBullet`, `PoisonBullet` 등 다양한 총알 클래스를 각각 정의하는 **Inheritance(상속) 방식**을 사용했습니다.
- 각 총알 클래스는 고유한 동작(예: 폭발, 중독 등)을 구현하기 위해 부모 클래스(`BaseBullet`)의 메서드를 오버라이드하거나 확장했습니다.

### **1.2. 기존 방식의 한계**

1. **확장성 부족**:
    - 새로운 총알 유형을 추가할 때마다 새로운 클래스를 정의해야 했습니다.
    - 예를 들어, "폭발 + 중독" 효과를 가진 총알을 구현하려면 `ExplosivePoisonBullet`이라는 새로운 클래스를 만들어야 했습니다.
    - 총알의 조합이 많아질수록 클래스 수가 기하급수적으로 증가하는 문제가 있었습니다.
2. **유연성 부족**:
    - 특정 동작(예: 폭발, 중독 등)을 재사용하려면 중복 코드가 발생하거나, 상속 계층이 복잡해질 가능성이 있었습니다.
    - 다중 상속이 지원되지 않기 때문에, 여러 동작을 조합하기 어려웠습니다.

---

### **2. 새로운 설계: Composition 방식**

### **2.1. 설계 개요**

- `BaseBullet`은 모든 총알의 공통 동작(이동, 충돌 처리, 관통 처리 등)을 정의하는 **기본 클래스**로 유지합니다.
- `BasicBullet`은 `BaseBullet`을 상속받아 기본 동작을 유지하면서, 필요한 **Component**를 조합하여 동작을 확장합니다.
- 각 Component는 독립적인 동작(예: 폭발, 중독, 얼리기 등)을 정의하며, `BaseBullet`의 `components` 배열에 추가되어 동작을 조합합니다.

### **2.2. Composition 방식의 장점**

1. **확장성**:
    - 새로운 Component를 추가하여 총알의 동작을 확장할 수 있습니다.
    - 예를 들어, "폭발 + 중독" 효과를 가진 총알은 `ExplosiveComponent`와 `PoisonComponent`를 조합하여 구현할 수 있습니다.
2. **유연성**:
    - Component는 독립적으로 동작하며, 여러 총알에서 재사용할 수 있습니다.
    - 특정 총알에만 필요한 동작을 선택적으로 추가할 수 있습니다.
3. **유지보수성**:
    - Component는 독립적인 코드로 작성되므로, 수정이 필요한 경우 해당 Component만 수정하면 됩니다.
    - 기존 총알 클래스나 `BaseBullet`의 코드를 수정할 필요가 없습니다.

---

### **3. 수정된 코드 구조**

### **3.1. `#file:base_bullet.gd`**

- `BaseBullet`은 모든 총알의 공통 동작을 정의합니다.
- `components` 배열을 통해 추가된 Component를 관리하며, 초기화(`initialize`) 및 충돌 처리(`on_hit`)를 위임합니다.

```python
extends Node2D
class_name BaseBullet

@export var components: Array = []  # 추가된 Component 목록

@onready var hitbox_component: HitboxComponent = $HitboxComponent

var bullet_data: BulletData  # BulletData 리소스
var direction: Vector2
var initial_position: Vector2
var penetration_count: int = 0  # 현재 관통한 적의 수

func _ready():
    if hitbox_component:
        hitbox_component.damage = bullet_data.damage

    initial_position = global_position

    # Component 초기화
    for component in components:
        if component.has_method("initialize"):
            component.initialize(self)

func _process(delta):
    # 총알 이동
    position += bullet_data.speed * direction * delta

    # 최대 거리 초과 시 제거
    if position.distance_squared_to(initial_position) > bullet_data.max_distance * bullet_data.max_distance:
        queue_free()

func on_hit(target: Area2D):
    # Component의 on_hit 호출
    for component in components:
        if component.has_method("on_hit"):
            component.on_hit(target)

    # 기본 관통 처리
    if target is HurtboxComponent:
        penetration_count += 1
        if penetration_count >= bullet_data.penetration:
            queue_free()

```

---

### **3.2. `#file:basic_bullet.gd`**

- `BasicBullet`은 `BaseBullet`을 상속받아 기본 동작을 유지하며, 필요한 Component를 추가합니다.
- Component는 `BaseBullet`의 `_ready()`에서 초기화되고, 충돌 시 효과를 적용합니다.

```python
extends BaseBullet
class_name BasicBullet

func _ready():
    # 필요한 Component를 추가
    components.append(ExplosiveComponent.new())  # 폭발 효과를 추가
    components.append(PoisonComponent.new())    # 중독 효과를 추가

    # 부모 클래스의 _ready() 호출
    super._ready()

```

---

### **3.3. `#file:shooter_component.gd`**

- `ShooterComponent`는 총알을 생성하고, 초기 위치와 방향을 설정한 뒤 씬에 추가합니다.
- Component 초기화는 `BaseBullet`의 `_ready()`에서 처리되므로, `ShooterComponent`에서는 Component 초기화를 수행하지 않습니다.

```python
extends Node
class_name ShooterComponent

@export var bullet_data: BulletData  # 발사할 총알의 데이터
@export var muzzle: Node2D  # 총알이 발사될 위치

func shoot(target_position: Vector2):
    var bullet = bullet_data.bullet_scene.instantiate()
    bullet.global_position = muzzle.global_position

    # 방향 설정
    bullet.direction = (target_position - muzzle.global_position).normalized()

    # 회전 설정
    bullet.rotation = atan2(bullet.direction.y, bullet.direction.x)

    # BulletData 리소스를 설정
    bullet.bullet_data = bullet_data

    var foreground = get_tree().get_first_node_in_group("foreground_layer")
    foreground.add_child(bullet)

```

---

### **4. 동작 흐름**

1. **`ShooterComponent`에서 총알 생성**:
    - `shoot()` 메서드에서 `BasicBullet`을 생성하고, 초기 위치와 방향을 설정한 뒤 씬에 추가합니다.
2. **`BasicBullet`에서 Component 추가**:
    - `BasicBullet`의 `_ready()`에서 필요한 Component를 `components` 배열에 추가합니다.
3. **`BaseBullet`에서 Component 초기화**:
    - `BaseBullet`의 `_ready()`에서 `components` 배열을 순회하며 각 Component의 `initialize` 메서드를 호출합니다.
4. **충돌 시 Component 효과 적용**:
    - `BaseBullet`의 `on_hit()`에서 `components` 배열을 순회하며 각 Component의 `on_hit` 메서드를 호출하여 효과를 적용합니다.

---

### **5. 결론**

- 기존의 Inheritance 방식에서 Composition 방식으로 전환함으로써, 총알의 동작을 유연하게 조합할 수 있는 구조를 구현했습니다.
- 이 설계는 특히 **타워 디펜스**나 **RPG** 장르에서 다양한 총알 효과를 구현하는 데 적합합니다.
- 새로운 Component를 추가하거나 조합하여 총알의 동작을 확장할 수 있으므로, 유지보수성과 확장성이 크게 향상되었습니다. 😊

# 흐름도

### **1. `#file:base_bullet.gd`**

### **1.1. `_ready()`에서 `components`별 `initialize`를 호출하는 이유**

- **목적**: `BaseBullet`의 `components` 배열에 추가된 각 Component를 초기화하기 위해.
- **상황**:
    - `components` 배열에는 총알에 부여된 다양한 기능(예: 폭발, 중독, 얼리기 등)을 담당하는 Component들이 포함됩니다.
    - 각 Component는 `initialize(self)` 메서드를 통해 총알(`BaseBullet`)의 데이터를 전달받아 초기화됩니다.
- **예시**:
    - `ExplosiveComponent`는 총알의 위치를 기반으로 폭발 범위를 설정할 수 있습니다.
    - `PoisonComponent`는 총알의 데미지 값을 기반으로 중독 효과를 설정할 수 있습니다.

### **1.2. `on_hit()`에서 `components`별 `on_hit`을 호출하는 이유**

- **목적**: 총알이 적과 충돌했을 때, `components` 배열에 추가된 모든 Component의 효과를 적용하기 위해.
- **상황**:
    - 총알이 적과 충돌하면, `on_hit` 메서드가 호출됩니다.
    - `on_hit` 메서드는 `components` 배열을 순회하며, 각 Component의 `on_hit` 메서드를 호출합니다.
- **예시**:
    - `ExplosiveComponent`는 충돌 시 폭발 효과를 적용합니다.
    - `PoisonComponent`는 충돌 시 적을 중독시킵니다.
    - 여러 Component가 동시에 적용될 수 있도록 설계되었습니다.

---

### **2. `#file:basic_bullet.gd`**

### **2.1. `_ready()`에서 `components`에 `append`를 하는 이유**

- **목적**: `BasicBullet`에 필요한 Component를 추가하기 위해.
- **상황**:
    - `BasicBullet`은 `BaseBullet`을 상속받아 기본 동작을 유지하면서, 특정 Component를 추가하여 동작을 확장합니다.
    - `components.append()`를 통해 `ExplosiveComponent`, `PoisonComponent` 등 필요한 Component를 추가합니다.
- **예시**:
    - `BasicBullet`은 폭발과 중독 효과를 가진 총알이므로, `ExplosiveComponent`와 `PoisonComponent`를 추가합니다.
    - 추가된 Component는 `BaseBullet`의 `_ready()`에서 초기화되고, `on_hit()`에서 효과를 적용합니다.

---

### **정리**

1. **`#file:base_bullet.gd`**:
    - `_ready()`에서 `components`를 초기화(`initialize`)하여 총알의 데이터를 Component에 전달.
    - `on_hit()`에서 `components`의 효과를 적용.
2. **`#file:basic_bullet.gd`**:
    - `components.append()`를 통해 `BasicBullet`에 필요한 Component를 추가.

이 설계는 **Composition 방식**을 활용하여 총알의 동작을 유연하게 확장할 수 있도록 설계되었습니다. 😊