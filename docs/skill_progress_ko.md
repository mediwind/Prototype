# 스킬 시스템 진행 요약 (한국어)

마지막 업데이트: 2025-11-23

목적
- 에디터 친화적이고 실무에 바로 적용 가능한 스킬 트리 UI를 빠르게 프로토타이핑하고 점진적으로 완성.
- 디자이너가 에디터에서 직접 스킬을 편집할 수 있도록 Resource 기반의 스킬 템플릿을 우선 유지.
- 기존 코드(플레이어, SaveManager 등)에 최소한의 변경만으로 통합할 수 있게 설계.

주요 결정사항 (변경)
- GraphEdit/GraphNode 방식은 복잡성 때문에 보류하고, 씬 기반 SkillButton 방식으로 진행하기로 결정했음.  
- SkillTreeResource / SkillNodeResource 설계도 현재 단계에서는 모두 제거(포기)하고, 스킬의 논리(요구조건)는 SkillTemplate 리소스에 간단한 메타데이터로 넣는 쪽으로 단순화함.

현재 구현/작업 내역
- UI
  - TabbedSkillTreeUI: 여러 스킬트리 씬을 탭으로 인스턴스화해 보여주는 기능 구현.
  - skill_tree_ui.tscn → skill_trees/basic_skill_tree_ui.tscn으로 복제 및 구조 정리.
  - fire_skill_tree_ui.tscn 추가(테스트용).
- 스킬 버튼/데이터
  - skill_button.tscn / skill_button.gd: 기존 씬 기반 버튼 로직 유지. SkillTemplate(.tres)를 에디터에서 할당하여 각 버튼이 동작함.
  - SkillTemplate 리소스에 prerequisite(간단한 문자열 배열), prerequisite_mode(all/any), required_prerequisites 필드 추가(선결 조건 논리 단순화).
- 런타임
  - SkillManager(autoload)를 통해 스킬 포인트 사용과 현재 학습 스킬 레벨 제공. SkillTreeUI는 이 데이터를 구독해서 UI 갱신함.
  - TabbedSkillTreeUI를 Town 씬에서 instantiate 하도록 변경. 일시정지 상태에서 UI 입력을 받게끔 Process/Pause 설정 확인.

현재 상태 요약
- 빠른 동작 루프(에디터에서 씬 배치 → 게임에서 탭 UI 열기 → 스킬 획득)가 안정적으로 동작함.
- GraphEdit 기반 편집기와 별도의 Resource 기반 노드/트리 구조(복잡한 메타데이터)는 삭제/보류되어 코드가 단순해짐.
- 다만, 지금 구조는 "한 스킬에 단일 선결 스킬(또는 단순 배열 기반 any/all 판정)" 정도만 지원함.

향후 리팩토링(고려 중)
- 복수 부모(다중 선결 스킬)를 시각적으로/논리적으로 깔끔하게 지원하는 리팩토링을 나중에 진행할 예정:
  - 목표: 한 스킬이 여러 부모를 가질 수 있고, "all" / "any (k of n)" 조건을 UI와 데이터 양쪽에서 명확히 표현.
  - 옵션 A (데이터 중심): SkillNodeResource 재도입 — 노드별 prerequisite 리스트와 UI 배치 정보(또는 버튼 id 매핑)를 분리해서 사용.
  - 옵션 B (뷰 중심, 간단): 현재 SkillTemplate에 prerequisites 배열을 유지하되, SkillButton에서 여러 부모에 대한 라인을 동적으로 생성하고 평가 로직을 확장.
  - UI 편의: 탭 내부에서 부모-자식 라인(선)을 자동으로 그려주고, 필요 시 "남은 필요 개수" 표시 및 툴팁으로 상세 설명 표시.
  - 단계적 접근: 먼저 룰(논리)만 서버/런타임에서 지원한 뒤, 필요하면 GraphEdit과 같은 편집 도구를 별도 플러그인으로 개발.

권장 다음 단계 (짧고 실용적으로)
1. 현재 상태 커밋(스냅샷). — 이미 진행한 변경은 커밋해 두는 걸 권장.  
2. SkillTemplate 샘플(.tres) 2개(액티브/패시브)를 만들어 각 트리 씬에 배치해 기능 확인.  
3. (선택) 복수 부모 지원을 하려면 우선 런타임 로직(판정 함수)을 확장하고, UI에서 부모 라인 그리기만 먼저 적용해 시각화 테스트 진행.

메모(작성자 친근 알림)
- 지금은 "빠르게 동작하는 최소 루프"를 우선으로 유지한 상태라 좋아.  
- 복수 부모 기능은 필요하면 단계적으로 도입하자 — 내가 도와줄 준비 되어 있어 :)

**구현 흐름 확인**

다음 문단은 여러분(사용자)께서 제시하신 흐름을 그대로 옮긴 내용입니다. 현재 설계/의도와 일치하면 문서에 포함해 두어 추후 작업에 참고하시기 좋습니다.

흐름 확인 (정리)

`SkillTreeUI` 씬은 연결된 `SkillTreeResource`를 참조하여 그 안의 `nodes` 배열을 순회하고, 각 노드에 대응하는 `SkillButton` 뷰 프리팹을 인스턴스화하여 화면에 배치합니다. 각 `SkillButton`은 기존에 구현된 버튼 로직(예: 버튼 입력 처리, `SkillManager`를 통한 스킬 포인트 사용/학습 처리, `retrieve_skill_point()` 호출 등)을 그대로 활용하여 상호작용합니다. 결과적으로 데이터(리소스)와 뷰(씬/스크립트)는 명확히 분리되며, `SkillTreeUI`는 데이터에서 뷰로의 매핑 책임만을 갖습니다. 이러한 구조는 유지보수성과 확장성 측면에서 권장되는 패턴입니다.

참고: 현재 워크스페이스에는 `SkillTreeResource`/`SkillNodeResource` 프로토타입과 `SkillButton` 씬이 존재합니다. 자동 생성(리소스→뷰) 코드는 실험 과정에서 일부 추가되었다가 보류된 상태이므로, `SkillTreeUI`에 해당 자동 생성 루프를 다시 연결하려면 `_build_from_tree()` 같은 간단한 빌더 함수를 추가하면 됩니다.
