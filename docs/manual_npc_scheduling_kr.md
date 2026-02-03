# 📅 NPC 스케줄링 및 행동 설정 매뉴얼 (NPC Scheduling Manual)

이 문서는 NPC에게 하루 일과(스케줄)를 부여하고, 시간에 따라 움직이게 만드는 방법을 설명합니다.

---

## 🏛️ 1. 핵심 개념 (Core Concept)

우리 프로젝트의 NPC 스케줄링은 **"시간(TimeManager) -> 스케줄(Resource) -> 이동(Component)"**의 흐름으로 작동합니다.

1.  **TimeManager**: 게임 시간을 관리하고, 매 시간(Hour)마다 신호를 보냅니다.
2.  **NPCSchedulerComponent**: 신호를 받아 현재 시간에 어떤 **활동(Activity)**을 해야 하는지 확인합니다.
3.  **NPCMovementComponent**: 결정된 활동의 **장소(Destination)**로 NPC를 이동시킵니다.

---

## 🛠️ 2. 새로운 NPC 스케줄 만들기 (Step-by-Step)

새로운 NPC "Chulsoo(철수)"를 만들고 스케줄을 부여해 봅시다.

### STEP 1. 스케줄 리소스 만들기
1.  `resources/npc/` 폴더에 우클릭 -> **Create New...** -> **Resource** 선택.
2.  검색창에 `ScheduleDef` 입력 후 선택.
3.  파일 이름: `schedule_chulsoo.tres`
4.  **Inpector 설정**:
    *   `Default Activity`: 스케줄에 없는 시간에 뭐 할지 (예: `home`)
    *   `Entries`: 딕셔너리 추가 (+ 버튼).
        *   Key `6` (오전 6시) -> Value `farming`
        *   Key `18` (오후 6시) -> Value `home`

### STEP 2. NPC 신원(Identity) 리소스 만들기
1.  `resources/npc/` 폴더에 `NPCIdentity` 리소스 생성.
2.  파일 이름: `identity_chulsoo.tres`
3.  **Inspector 설정**:
    *   `Id`: `chulsoo`
    *   `Display Name`: `철수`
    *   `Schedule`: 방금 만든 `schedule_chulsoo.tres`를 드래그 앤 드롭.

### STEP 3. 씬(Scene)에 배치 및 연결
1.  `Talula.tscn`을 복사하거나 상속해서 `Chulsoo.tscn`을 만듭니다. (CharacterBody2D 기반)
2.  Inspector에서 `Identity` 필드에 `identity_chulsoo.tres`를 넣습니다.
3.  **중요:** NPC가 활동할 씬(예: `Town.tscn`)에는 활동 ID와 일치하는 **도착 지점(Marker)**이 있어야 합니다.
    *   `Town.gd` (혹은 씬 스크립트)에서 이 마커를 NPC에게 알려줘야 합니다.

#### 코드 예시 (Town.gd)
```gdscript
func _setup_npc_scheduling():
    # 씬에 배치된 실제 마커 노드를 찾음
    var farm_marker = $Entities/MarkerFarm 
    var home_marker = $Entities/MarkerHouse

    # NPC에게 "활동 ID"가 "어디 좌표"인지 알려줌
    $Entities/Chulsoo.schedule_destinations["farming"] = farm_marker
    $Entities/Chulsoo.schedule_destinations["home"] = home_marker
```

---

## 💡 3. 고급 팁 (Advanced Tips)

### Q. NPC가 장애물을 피해가게 하고 싶어요. (Pathfinding)
현재 `NPCMovementComponent`는 `move_toward`를 사용하여 **직선 이동**만 합니다.
장애물을 피하게 하려면 Godot의 `NavigationRegion2D`를 씬에 깔고, 컴포넌트를 `NavigationAgent2D`를 사용하는 버전으로 업그레이드해야 합니다. (추후 구현 예정)

### Q. 다른 씬(집 안)으로 들어가게 하고 싶어요.
현재는 **같은 씬 내에서의 이동**만 지원합니다.
다른 씬으로 이동하려면, 도착 지점(`Marker`)을 **집 문 앞(Portal)**으로 설정하여, 문 앞에 도착하면 NPC를 `visible = false` 처리하거나 삭제하는 "입장 연출"을 스크립트로 짜야 합니다.

### Q. 대화 중에 이동을 멈추고 싶어요.
`Talula.gd`에 이미 구현되어 있습니다. `interact()` 함수가 호출되면 `movement_component.stop()`을 실행합니다. 대화가 끝나면 다시 스케줄 체크가 돌면서 이동을 재개합니다.

---

## 🚨 4. 트러블슈팅

*   **로그에 "No destination found for activity: xxx"가 떠요!**
    *   스케줄에는 `xxx` 활동을 하라고 적혀있는데, 씬 스크립트에서 `schedule_destinations["xxx"]`를 할당해주지 않은 경우입니다. 마커를 만들고 연결해주세요.
---

## 🏛️ 4. 클린 아키텍처 가이드 (Clean Architecture)

### Q. 스케줄만 있으면 되는데 왜 `NPCIdentity`가 필요한가요?
"철수"라는 NPC를 만든다고 가정해 봅시다. 철수는 스케줄뿐만 아니라 이름, 초상화, 대화 데이터, 호감도, 생일 등 수많은 정보가 필요합니다.
*   **Identity가 없다면:** 씬(Scene)마다 이 모든 데이터를 일일이 설정해야 합니다. 실수가 발생하기 쉽습니다.
*   **Identity가 있다면:** "이 NPC는 **철수(Identity)**야"라고 하나의 리소스만 연결하면, 관련된 모든 데이터(스케줄 포함)가 자동으로 따라옵니다. 이것이 **데이터 주도 설계(Data-Driven Design)**의 핵심입니다.

---

## 📈 5. 확장성 패턴 (Scaling Strategy)

NPC가 20명, 50명으로 늘어나면 `Town.gd`에서 일일이 코드로 마커를 연결해주는 것은 불가능합니다.
이때는 **"Location Registration System (마커 자동 수집)"** 패턴을 사용합니다.

### 자동 수집 시스템의 원리
1.  **마커 이름 규칙화:** 씬에 마커를 배치할 때 규칙을 지킵니다. (예: `Loc_<ActiveID>`)
    *   `Loc_plaza`, `Loc_home`, `Loc_farming`
2.  **자동 수집:** 씬 스크립트(`Town.gd`)가 시작될 때, 자식 노드 중 `Loc_`로 시작하는 마커를 찾아 딕셔너리로 만듭니다.
3.  **자동 배포:** 해당 씬에 있는 모든 NPC에게 이 **"지역 지도(Location Map)"**를 전송합니다.
4.  **결과:** 개발자는 코드를 한 줄도 수정하지 않고, **에디터에서 마커와 NPC를 배치하는 것만으로** 스케줄링을 완성할 수 있습니다.

> **💡 Insight: 스마트 씬 만들기 (Scene Scalability)**
> 매번 `Town.gd`, `Dungeon.gd` 등에 똑같은 검색 코드를 짤 필요가 없습니다.
> *   **상속 패턴:** `BaseScene.gd`를 만들어 공통 로직(마커 수집)을 넣고, 모든 씬이 이를 상속받게 합니다.
> *   **컴포넌트 패턴:** `LocationManagerComponent` 노드를 씬에 추가하면, 해당 컴포넌트가 알아서 부모 씬의 마커를 긁어모으게 할 수도 있습니다.
> 
> 이 방식은 프로젝트 규모가 커질수록(씬이 100개가 될 때) 강력한 힘을 발휘합니다.

> **Note:** 이 시스템은 Phase 27에서 구현될 예정입니다. 현재는 수동 연결 방식을 이해하는 것이 우선입니다.

