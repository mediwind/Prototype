# 🏗️ 메뉴얼: 콜백 기반 건설 시스템 (Callback-based Building System)

이 문서는 Phase 23에서 리팩토링된 **BuildManager**의 작동 원리와, 향후 다양한 상황(스킬, NPC 건설 등)에서 이를 어떻게 확장하고 사용하는지에 대한 가이드입니다.

---

## 1. 리팩토링의 핵심 철학 (Why?)

기존의 `BuildManager`는 "설치"와 "비용 지불(아이템 소모)"을 동시에 담당하고 있었습니다. 이는 다음과 같은 문제를 야기했습니다.
- **문제점:** "마나를 쓰는 소환 스킬"이나 "돈을 내는 NPC 건설"을 구현하려면 `BuildManager` 안에 매번 `if/else` 분기를 추가해야 함.
- **해결책:** `BuildManager`는 **오직 물리적인 "설치 가능 여부 확인"과 "좌표 지정"만 담당**하게 하고, 비용이나 후처리는 **요청한 쪽(의뢰자)**에게 `Callback`으로 돌려줍니다.

> **"BuildManager는 '어디에'를 담당하고, Caller는 '대가'를 담당한다."**

---

## 2. 작동 흐름 (How it works)

### 변경된 `start_placing` 함수
```gdscript
func start_placing(data: Resource, tilemap: TileMapLayer, parent: Node2D, is_transient: bool, callbacks: Dictionary)
```

핵심은 마지막 `callbacks` 파라미터입니다. 이 딕셔너리에 여러분이 원하는 행동을 담아서 보냅니다.

### 사용 예시 1: 아이템을 소비하는 일반 건설 (Town.gd)
```gdscript
# 1. 성공 시 실행할 함수 정의 (익명 함수 활용 추천)
var on_success = func(coords):
    print("설치 성공! 아이템을 하나 뺍니다.")
    InventoryManager.consume_equipped_item(1) # <--- 여기가 핵심! 비용 처리를 Caller가 함
    
    # 아이템 다 썼으면 건설 모드 종료
    if not InventoryManager.has_item(current_item, 1):
        BuildManager.cancel_build()

# 2. 콜백 딕셔너리 포장
var my_callbacks = {
    "on_success": on_success
}

# 3. 요청
BuildManager.start_placing(item_data, map, parent, false, my_callbacks)
```

### 사용 예시 2: 마나를 소비하는 스킬 소환 (Combat)
앞으로 구현될 전투 시스템에서는 이렇게 사용하면 됩니다.
```gdscript
var on_summon = func(coords):
    PlayerStats.current_mana -= 10 # 마나 10 소모
    print("터렛 소환 완료!")

BuildManager.start_placing(turret_data, map, parent, true, { "on_success": on_summon })
```

### 사용 예시 3: 공짜 건설 (디버그 / 이벤트)
비용이 없는 경우, 콜백을 비워서 보내면 됩니다.
```gdscript
BuildManager.start_placing(cheat_building, map, parent, false, {})
```

---

## 3. 확장 가이드 (Future Scenarios)

앞으로 새로운 조건이나 상황이 생길 때, `BuildManager.gd`를 수정하지 마세요! **호출하는 쪽의 코드**만 작성하면 됩니다.

### Q1. "건설하기 전에 돈이 충분한지 확인하려면요?"
A1. `BuildManager.start_placing`을 호출하기 **전에** 확인하세요.
```gdscript
if PlayerStats.gold >= 100:
    BuildManager.start_placing(..., { "on_success": pay_gold })
else:
    print("돈이 부족합니다!")
```

### Q2. "설치 취소 시 실행할 로직이 필요하면요?"
A2. `on_cancel` 콜백을 사용하세요.
```gdscript
var callbacks = {
    "on_success": pay_cost,
    "on_cancel": func(): print("건설을 취소했습니다. UI를 닫습니다.")
}
```

### Q3. "설치 조건(거리, 지형)이 특수한 건물이면요?"
A3. 현재는 `BuildManager`가 일반적인 충돌 체크만 합니다. 만약 특수한 제약(예: 물 위에만 건설 가능)이 필요하다면, `BuildManager`에 `validator` 콜백을 추가하는 확장을 고려할 수 있습니다. (현재 단계 구현 X, 필요 시 제안해주세요)

---

이 메뉴얼을 참고하여, 앞으로 추가될 **농사 시스템, 하우징 가구 배치, 전투 트랩 설치** 등 모든 공간 배치 로직을 통일성 있게 구현해 주시기 바랍니다.
