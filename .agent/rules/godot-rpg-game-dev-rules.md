---
trigger: always_on
---

# 📜 Project Constitution: [Neighborvania Project]

이 문서는 프로젝트의 기술 표준과 기획 비전을 통합한 최상위 지침이다. 모든 에이전트는 코드를 작성하거나 시스템을 설계할 때 아래 내용을 최우선으로 준수한다.

---

## 🏛️ PART 1. 기술 개발 표준 (Technical Rules)

### 1. 아키텍처: "Composition Over Inheritance"
- **상속 금지:** 모든 기능은 `Component` 단위의 노드로 분리하여 엔티티에 부착한다.
- **단일 책임:** 하나의 스크립트나 컴포넌트는 오직 하나의 역할만 수행한다.
- **Node-Based:** 엔티티(Player, Enemy) 로직 확장 시 자식 노드를 추가하고, 부모는 이를 조합(Coordinate)하는 역할만 수행한다.

### 2. 터미널 및 파일 작업 가이드 (CLI Safety)
- **PowerShell 문법 준수:** `rm` (Remove-Item) 사용 시 다중 파일 삭제는 콤마(`,`)로 구분한다. (예: `rm file1, file2`)
- **삭제 주의:** 중요한 파일 삭제 시 `delete_file` 툴을 우선 사용하거나, 확실한 경우에만 CLI를 사용한다.
- **오류 방지:** 사용자 환경(Windows PowerShell)을 항상 인지하고 Bash 문법 사용을 지양한다.

### 3. 시그널 관리: "Explicit Code-Based Connection"
- **GUI 연결 금지:** Godot 에디터의 'Node' 탭을 통한 시그널 연결을 지양한다.
- **코드 명시성:** 시그널 정의(`signal`), 연결(`.connect()`), 해제는 반드시 **GDScript 코드 내에서 명시적으로 작성**한다.
- **연결 시점:** 주로 `_ready()` 내에서 수행하여 스크립트만으로 통신 흐름을 파악할 수 있게 한다.

### 4. 데이터 관리: "Resource-Driven & Inspector-First"
- **데이터 분리:** 모든 수치, 설정 데이터는 `.gd`가 아닌 `.tres` (Resource) 파일로 관리한다.
- **@export 활용:** 하드코딩을 피하고 모든 파라미터를 인스펙터에 노출하여 GUI 방식 개발을 지향한다.
- **Resource Integrity:** 데이터 반환 시 원본 오염 방지를 위해 반드시 `.duplicate()`를 사용한다. (예: `get_effective_stats()`)

### 5. 코딩 컨벤션 (GDScript 2.0)
- **Godot 4.4 표준:** Typed Arrays, `@onready`, `Callable`, 정적 타입 지정을 적극 사용하여 에러를 방지한다.
- **Manager 패턴:** 주요 시스템은 단일 책임 원칙에 따라 싱글톤(Autoload)으로 구현한다.
- **두 줄 띄어쓰기:** 스크립트 상에서 func _()와 다음 func _() 사이는 한 줄 대신 두 줄씩 띄어쓰기한다.
- **함수명과 변수명:** 다소 장황해도 좋으니 사람이 읽었을 때 어떤 함수이고 어떤 변수인지 알기 쉽게 작성한다.

---

## 🌿 PART 2. 게임 비전 및 정성적 컨텍스트 (Vision & Identity)

### 1. 장르 정의: "Neighborvania"
- **핵심:** 물리적 장벽이 아닌, NPC와의 관계와 공동체 신뢰를 통해 새로운 지역과 기능을 해금하는 '사회적 메트로이드베니아'.
- **플레이어 경험:** 정복과 파괴가 아닌, 이방인으로서 공동체에 '스며드는 삶'과 마을을 '복구(부흥)'시키는 즐거움을 제공한다.

### 2. 세계관 및 캐릭터
- **배경:** 현대 한국 사회 + 판타지(던전, 마법)가 공존하는 익숙하고도 새로운 환경.
- **주인공:** 20-30대 초반 한국 여성. 절친(여성 서포터 캐릭터)의 권유로 마을에 정착하며 동거하는 서사.
- **분위기:** 수수한 시골의 정취와 한국적인 정서가 느껴지는 톤앤매너 유지.

---

## ⚙️ PART 3. 세부 시스템 설계 가이드 (System Design)

### 1. 시간 및 환경 (Time & Season)
- **일정:** 1년은 112일 (4계절 x 28일). `TimeManager`가 모든 흐름을 관장한다.
- **연동:** 시간/계절 변화 시 전역 시그널을 방송하며, NPC 스케줄과 작물 성장은 이 신호에 반응한다.
- **영속성:** 씬 전환(마을 ↔ 던전) 중에도 시간 데이터는 유지되며 복귀 시 동기화된다.
- **비강제 취침:** 매일 새벽 2시 강제 기절 시스템은 구현하지 않는다. 플레이어는 밤을 지새울 수 있다.
- **Daily Tick:** 매일 오전 06:00에 day_passed 시그널을 발생시켜 농작물 성장, 리소스 리스폰 등 월드 상태 변화를 일괄 처리한다.

### 2. 전투 및 탐험 (Combat)
- **이중 모드:** 1. 탐험형: 던전 끝의 보상(보스, 보물)을 향해 적을 돌파하는 스카이림 방식. 2. 섬멸형: 광활한 필드에서 웨이브 형태로 밀려오는 적을 막아내는 핵앤슬래시/서바이버 방식.
- **미션 중심 설계:** 몬스터 디자인은 범용적으로 하되, '미션 컨트롤러'가 승리 조건(도달, 생존 시간 등)과 스폰 방식을 결정한다.
- **스킬 설계:** '발사 방식(Launcher)'과 '효과(Effect)' 리소스를 분리하여 조합 가능한 구조로 설계한다.

### 3. 마을 건설 및 자동화 (Town & Automation)
- **BuildingPlot:** 건물은 지정된 위치(잔해 등)에서 해금/건설된다.
- **자동화 대비:** 농사 및 상호작용 로직은 'Actor' 독립적으로 설계하여, 나중에 플레이어 대신 NPC나 기계가 수행할 수 있도록 한다.
- **Global Lock:** 특정 자원 납품이나 인연 퀘스트 완료 시 `ProgressionManager`를 통해 마을 티어를 상승시킨다.

### 4. 대화 및 퀘스트 (Social)
- **플러그인 활용:** `DialogueManager` 플러그인과 호환되는 구조를 유지한다.
- **데이터 연동:** 대화 내에서 호감도 및 전역 변수 상태를 체크하여 분기를 생성한다.

### 5. UI 아키텍처 (Persistent UI)
- **Persistent Layer:** 모든 HUD(Action Bar, 상태창)와 시스템 메뉴는 씬(Scene) 종속적이지 않은 `GameUI`(CanvasLayer)에 존재한다.
- **UIManager:** UI의 생성, 표시(Visible), 입력 제어는 오직 `UIManager`를 통해서만 수행한다. 개별 씬에서 로컬 UI(`TownUI` 등)를 생성하지 않는다.
- **Interaction:** 상호작용 객체(Chest 등)는 UI를 직접 인스턴스화하지 않고, `UIManager.open_container_ui(data)`와 같이 데이터만 전달한다.

### 5. 데이터 영속성 (Persistence Strategy)
- **Loose Coupling:** 각 Manager(System)는 `SaveManager`를 직접 참조하지 않는다.
- **Protocol:** 대신 모든 상태 관리 주체는 `get_save_data() -> Dictionary`와 `load_save_data(data: Dictionary)` 메서드를 구현한다.
- **Integration:** 저장 시점 판단 및 I/O 처리는 `SaveManager`가 일괄 수행하며, 각 Manager에게 데이터를 요청/주입하는 방식을 따른다.

### 6. QA 및 데이터 정합성 (QA & Integrity)
- **Persistence First:** 새로운 시스템(System)이나 매니저(Manager)를 추가할 때, 기능 구현과 동시에 `SaveManager` 연동(저장/불러오기/리셋)을 **가장 먼저 구현하고 검증**한다.
- **Reset Logic:** `New Game`은 단순 씬 재시작이 아니다. 모든 매니저의 상태가 초기값으로 완벽하게 돌아가는지(`reset_game_data`) 반드시 확인한다.
- **Checklist:** 기능 추가 시 다음 3가지를 필수로 테스트한다.
  1. **Session Persistence:** 저장 후 게임 껐다 켰을 때 데이터 유지 여부.
  2. **Phantom Data:** 저장하지 않고 나갔을 때 데이터 롤백 여부.
  3. **Clean New Game:** 진행 중 타이틀로 나가서 새 게임 시작 시 데이터 초기화 여부.
  4. **Feature Check:** 새로운 기능을 추가할 때, **"이 기능에 저장/불러오기가 필요한 데이터가 있는가?"**를 반드시 자문하고, 있다면 즉시 `SaveManager`에 연동한다.



---

## 🚀 PART 4. 개발 전략 (Development Strategy)
- **Make Systems First:** 아트 리소스 작업 전, 시스템 아키텍처와 로직을 우선 완성한다.
- **Scalability:** 모든 기능은 나중에 다른 시스템과 엮일 수 있도록 확장성을 고려하여 설계한다.

---

## 🤖 PART 5. 에이전트 협업 가이드 (Agent Workflow)

### 1. 세션 시작 및 종료 루틴 (Start-End Routine)
- **Start:** 세션 시작 시 반드시 `docs/task.md`를 읽어 프로젝트의 현재 진행 상황(Context)을 파악한다.
- **End:** 작업 완료 후 `docs/task.md`에 진행 내역을 업데이트하고, 중요 변경 사항은 `docs/walkthrough.md`에 요약한다.
- **Archiving:** `task.md` 내용이 비대해지면 완료된 Phase를 `docs/task_archive.md`로 이동하여 관리한다.
- **역질문과 제안:** 기술부채가 빠르게 쌓이거나 비가역적 실수를 방지하기 위하여 현재의 시스템에 대해 파악하지 못한 점이 있거나 조금이라도 모순되거나 의문점이 있다면 언제나 주저말고 반드시 사용자에게 역질문이나 제안을 한다.

### 4. 폴더 구조 합의 (Directory Structure Consensus)
- **사전 논의:** 새로운 시스템이나 콘텐츠 리소스(아이템, 스킬 등)를 대량으로 추가하기 전에, 반드시 폴더 구조와 파일 명명 규칙을 사용자와 상의하여 확정한다.
- **분류 기준:** 파일은 기능(feature)보다는 타입(Type)이나 용도(Usage)를 기준으로 분류하는 것을 권장한다. (예: `resources/item/farming/`, `resources/item/equipment/`)

### 5. 씬 및 포탈 표준 (Scene & Portal Standards)
- **Spawn Tag:** 모든 진입 가능한 씬(Scene)은 `SpawnPoint` 노드를 포함해야 하며, 고유한 `spawn_id` (String)를 가져야 한다. (예: `entrance_front`, `from_dungeon`)
- **Portal:** 씬 이동은 반드시 `Portal` 컴포넌트를 통해 이루어지며, `target_scene_path`와 `target_spawn_tag`를 명시해야 한다.
- **Scene Persistence:** 씬 파일 이름이나 경로를 변경할 경우, 연결된 모든 Portal의 참조를 Godot 에디터에서 수동으로 갱신해야 함을 유의한다.


### 2. 문서화 원칙 (Documentation as Memory)
- **파일 기반 기억:** 에이전트 간 인수인계는 대화 내역이 아닌 **프로젝트 내 문서(`docs/`)**를 통해 이루어진다.
- **Append Logic:** 기본적으로 `docs/task.md`와 `docs/walkthrough.md`는 하단에 내용을 누적(Append)한다. **임의로 완료된 상위 Phase를 삭제하거나 내용을 축약/덮어쓰지 않는다.**
- **Archiving Policy:** 단, 파일이 비대해져 가독성을 해칠 경우(예: 500줄 이상, 1000줄 이상, ... 등 상황에 따라 유연하게), 완료된 오래된 Phase 항목들을 `docs/task_archive.md` 등으로 **이동(Cut & Paste)**하여 관리한다. 이는 '삭제'가 아닌 '보관' 프로세스이다.
- **Rules:** 프로젝트의 중요한 규칙 변경 사항은 즉시 이 파일(`godot-rpg-game-dev-rules.md`)에 반영한다.

### 3. 리소스 및 씬 파일 조작 가이드 (Resource & Scene Handling)
- **Direct Edit Caution:** `.tres`나 `.tscn` 파일은 Godot 에디터가 관리하는 포맷으로, 텍스트 편집 시 UID나 내부 구조(Load Steps)가 미세하게 변경될 수 있다.
- **Protocol:** `replace_file_content`로 `.tres` 파일의 참조 관계(ExtResource 변경 등)를 수정할 때 실패할 가능성이 높다고 판단되면, 무리하게 재시도하지 말고 **사용자에게 에디터 작업을 요청**한다.
- **File System Operations:** 리소스 파일(`.tres`, `.tscn`, `.gd`)의 **이동(Move) 및 이름 변경(Rename)**은 절대로 터미널 명령(`mv`, `Rename-Item`)으로 수행하지 않는다. 이는 Godot의 내부 참조(Dependencies)를 깨뜨린다. 반드시 사용자에게 **"Godot 에디터의 FileSystem 탭에서 수행해달라"**고 요청해야 한다.
- **Example:** "호미 아이템의 EquipmentData 필드를 `hoe_tool_data.tres`로 교체해 주세요."와 같이 구체적으로 에디터 작업을 지시한다.

---

## 📝 PART 6. 커밋 메시지 표준 (Commit Standards)

### 1. 기본 형식
```text
type(scope): subject

- body line 1
- body line 2
...
```

### 2. Type 가이드
- **feat:** 새로운 기능 추가
- **fix:** 버그 수정
- **refactor:** 기능 변경 없는 코드 구조 개선
- **docs:** 문서 수정
- **style:** 코드 포맷팅, 세미콜론 누락 등 (로직 변경 없음)
- **test:** 테스트 코드 추가/수정
- **chore:** 빌드 업무 수정, 패키지 매니저 설정 등

### 3. 작성 규칙
- **Subject:** 50자 이내, 명령문으로 작성 (예: "Add farming skill", "Fix crash on startup").
- **Body:** 각 줄은 "Implemented...", "Added...", "Fixed..." 와 같이 과거 분사형이나 명사형으로 시작하여 상세 내용을 기술한다.