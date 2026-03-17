# 🌍 월드 확장 및 씬 이동 시스템 매뉴얼 (World Expansion Manual)

이 문서는 게임 내에서 새로운 지역(집, 던전, 동굴 등)을 추가하고 `Portal`을 통해 이동하는 방법을 설명합니다. 나중에 던전이나 새로운 마을을 추가할 때 이 가이드를 참고하세요.

---

## 🏗️ 1. 핵심 구성 요소 (Core Components)

이 시스템은 4가지 요소가 맞물려 돌아갑니다.

### 1) SceneManager (관리자)
*   **역할:** "이동 관리 소장님"
*   **기능:** 화면을 검게 페이드 아웃(Fade Out) 시키고, `PackedScene`을 로드한 뒤, 플레이어를 지정된 `SpawnPoint`로 순간이동 시킵니다.
*   **코드 사용:** `SceneManager.change_scene("씬경로", "스폰ID")`

### 2) Portal (입구/출구)
*   **역할:** "여권 심사대"
*   **구성:** `Area2D` + `CollisionShape2D`
*   **작동:** 플레이어(Layer 2)가 부딪히면 지정된 `Target Scene Path`로 씬을 변경하고 `Target Spawn Tag` 위치로 보냅니다.
*   **주의:** `Collision Mask`가 반드시 **Layer 2 (Player)** 를 감지하도록 체크되어 있어야 합니다.

### 3) SpawnPoint (도착점)
*   **역할:** "도착 게이트"
*   **구성:** `Marker2D`
*   **작동:** 씬 로딩 직후 플레이어가 강제로 이동될 좌표입니다.
*   **중요:** **`Spawn Id`** 라는 고유한 이름표를 가집니다. (예: `entry`, `from_home`, `dungeon_start`)

### 4) Exterior & Interior (겉과 속)
*   **Exterior (겉모습):** `Town` 씬에 배치되는 건물의 그림. 물리적 충돌체(벽)와 `Portal`(문)을 포함합니다. (예: `HouseExterior.tscn`)
*   **Interior (실내):** 별도의 `.tscn` 파일로 존재하는 독립된 공간. (예: `PlayerHome.tscn`)

---

## 🛠️ 2. 새로운 지역(예: 던전) 추가하는 법 (Step-by-Step)

새로운 던전 **"GoblinCave"**를 만든다고 가정해 봅시다.

### STEP 1. 실내(Interior) 씬 만들기
1.  새로운 씬 `GoblinCave.tscn`을 만듭니다.
2.  **도착점 만들기:** 입구 근처에 `SpawnPoint.tscn`을 배치하고, 인스펙터에서 `Spawn Id`를 **`entry`** (또는 `start`)로 설정합니다.
3.  **나가는 문 만들기:** 출구에 `Portal.tscn`을 배치하고,
    *   `Target Scene Path`: `res://scenes/town/town.tscn` (마을로 돌아가기)
    *   `Target Spawn Tag`: **`from_cave`** (마을에 도착할 태그)

### STEP 2. 야외(Exterior)에 입구 연결하기
1.  `Town.tscn`을 엽니다.
2.  **건물/입구 배치:** 던전 입구 그림이나 `HouseExterior` 같은 프리팹을 배치합니다.
3.  **들어가는 문 만들기:** 입구 위치에 `Portal.tscn`을 배치하고,
    *   `Target Scene Path`: `res://scenes/dungeon/GoblinCave.tscn` (방금 만든 씬)
    *   `Target Spawn Tag`: **`entry`** (아까 설정한 실내 도착점 ID)
4.  **돌아올 위치 만들기:** 문 바로 앞에 `SpawnPoint.tscn`을 배치하고,
    *   `Spawn Id`: **`from_cave`** (실내 포탈이 가리키던 그 ID)

### STEP 3. 연결 확인 (Checklist)
*   [ ] Portal의 `Target Spawn Tag`와 도착할 씬의 `Spawn Id`가 정확히 일치하는가? (오타 주의)
*   [ ] Portal의 `Target Scene Path`가 올바른 파일 경로인가?

---

## ⏱️ 3. 시간 흐름 제어 (Time Dilation)

실내나 던전에서 시간을 멈추거나 빠르게 하고 싶다면, 해당 씬의 **루트 스크립트(`_ready`)** 에 다음 코드를 넣으세요.

```gdscript
func _ready():
    if TimeManager:
        # 0.0 = 시간 정지 (집, 상점 등)
        # 1.0 = 정상 흐름 (마을, 필드)
        TimeManager.set_calendar_time_multiplier(0.0)
```

> **주의:** 야외(`Town`)로 돌아갈 때는 `TimeManager.set_calendar_time_multiplier(1.0)`을 호출하여 시간을 다시 흐르게 해야 합니다. (보통 Town 스크립트에 넣어둡니다.)

---

## 🚨 4. 트러블슈팅 (자주 겪는 문제)

**Q. 포탈에 비벼도 아무 반응이 없어요!**
*   A. `Portal` 씬의 **Collision Mask** 설정을 확인하세요. **Layer 2 (Player)** 가 체크되어 있어야 플레이어를 감지합니다.

**Q. 씬은 바뀌는데 이상한 좌표(0,0)에 떨어져요!**
*   A. 도착할 씬에 `SpawnPoint`가 없거나, `Spawn Id` 철자가 틀렸을 확률이 99%입니다. 로그창에 `"SpawnPoint with ID 'xxx' not found"`가 뜨는지 확인하세요.

**Q. "Player not found" 에러 로그가 떠요.**
*   A. `SceneManager`가 플레이어를 너무 빨리 찾아서 그렇습니다. `await get_tree().physics_frame` 코드가 있는지 확인하세요. (이미 수정됨)
