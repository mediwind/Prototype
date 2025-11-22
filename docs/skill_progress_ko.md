# 스킬 시스템 진행 요약 (한국어)

마지막 업데이트: 2025-11-22

목적
- 에디터 친화적이고 데이터 중심적인 스킬 트리 시스템을 빠르게 프로토타입하고, 점진적으로 완성한다.
- @export 가능한 Resource로 콘텐츠를 제작할 수 있도록 설계하여 디자이너가 에디터에서 직접 스킬을 편집하게 한다.
- 대규모 리팩토링 없이 기존 플레이어(FSM 등)에 스킬을 연결할 수 있도록 최소한의 런타임 어댑터를 고려한다.

요약된 결정사항
- GraphEdit/GraphNode 방식은 실험용으로 시도했으나 현재는 이해/리팩토링 부담으로 보류합니다. 기존의 씬 기반 `skill_button.tscn` 방식으로 우선 진행합니다.
- Resource 기반 설계는 계속 유지합니다: `SkillNodeResource`, `SkillTreeResource` 등 프로토타입이 추가되어 있습니다.

작업 내역 (중요 파일)
- 추가된 리소스/스크립트(프로토타입):
  - `res://resources/skill/skill_node.gd` (class_name `SkillNodeResource`) — 노드 메타데이터(템플릿 참조, 위치, 선행조건 등)
  - `res://resources/skill/skill_tree.gd` (class_name `SkillTreeResource`) — 트리 메타데이터와 노드 목록
- UI 관련 변경:
  - `res://scenes/ui/skill/skill_button.tscn` — 기존 버튼 기반 스킬 노드 (현재 기본 작업 단위)
  - `res://scenes/ui/skill/skill_button.gd` — 버튼 로직 (사용자 요청으로 GraphEdit 실험 전 상태로 복구됨)
  - `res://scenes/ui/skill/skill_tree_ui.tscn` / `skill_tree_ui.gd` — 스킬 UI 씬과 빌드 로직 (GraphEdit 관련 코드 일부는 제거/비활성화되었음)
- 실험용으로 생성되었으나 현재 보류된 파일(원하면 제거 가능):
  - `res://scenes/ui/skill/graph_skill_node.tscn`
  - `res://scenes/ui/skill/graph_skill_node.gd`

발생했던 이슈 및 해결
- GDScript/Godot 4.x API 차이: `rect_position` → `position` 변경 필요.
- class_name 충돌(스킬 노드 Resource와 씬 스크립트 간) — Resource를 `SkillNodeResource`로 명명하여 충돌 회피.
- GraphEdit 실험에서 미리보기 문제(작은 뷰 등) — 씬 프리셋/앵커 수정으로 일부 해결했으나 UI 복잡도가 높아 보류 결정.

현재 상태
- GraphEdit 실험 보류 완료: 핵심 작업은 원래의 `skill_button` 기반 UI로 되돌렸습니다.
- 리소스 프로토타입(스키마)은 워크스페이스에 남아 있어, 필요 시 다시 활성화할 수 있습니다.

권장 다음 단계
1. 커밋: 현재 상태를 스냅샷으로 커밋해두었습니다 (아래 참조).
2. 리소스 작업 정리: 데이터 모델(`SkillTemplate` 확장 포함)을 한 번에 정리하고, 대표 `.tres` 샘플(액티브/패시브 1개씩)을 만들어 테스트 씬으로 연결하세요.
3. 런타임: `SkillManager`(autoload)를 설계하여 배운 스킬 목록, 쿨다운, 시그널을 관리하는 작은 API를 만듭니다.
4. 점진적 통합: 기존 플레이어와의 연결은 `PlayerActions.request_skill(skill_id)` 같은 얕은 API로 우선 연결해 테스트하세요.

커밋 정보
- 파일: `docs/skill_progress_ko.md` 추가
- 커밋 메시지: "docs(skill): 한글 진행 문서 추가 및 현상 스냅샷 (GraphEdit 보류)"

참고: 실험 파일(`graph_skill_node.*`, `resources/skill/skill_node.gd`, `resources/skill/skill_tree.gd`)을 삭제하려면 알려주세요. 보관(예: `experimental/` 폴더로 이동) 또는 완전 삭제 중 어떤 걸 원하시는지 선택하시면 작업해 드립니다.

작성자 메모
- 우선순위는 "빠르게 작동하는 최소 루프"입니다. 디자인과 정리는 이후 단계에서 차근차근 진행합시다.
- 다음에 제가 바로 해드릴 수 있는 작업: (A) 실험 파일 정리, (B) `SkillManager` 기본 스텁 추가, (C) 샘플 `.tres` 2개 생성 및 테스트 씬 연결. 원하시는 항목을 골라주세요.

**구현 흐름 확인**

다음 문단은 여러분(사용자)께서 제시하신 흐름을 그대로 옮긴 내용입니다. 현재 설계/의도와 일치하면 문서에 포함해 두어 추후 작업에 참고하시기 좋습니다.

흐름 확인 (정리)

`SkillTreeUI` 씬은 연결된 `SkillTreeResource`를 참조하여 그 안의 `nodes` 배열을 순회하고, 각 노드에 대응하는 `SkillButton` 뷰 프리팹을 인스턴스화하여 화면에 배치합니다. 각 `SkillButton`은 기존에 구현된 버튼 로직(예: 버튼 입력 처리, `SkillManager`를 통한 스킬 포인트 사용/학습 처리, `retrieve_skill_point()` 호출 등)을 그대로 활용하여 상호작용합니다. 결과적으로 데이터(리소스)와 뷰(씬/스크립트)는 명확히 분리되며, `SkillTreeUI`는 데이터에서 뷰로의 매핑 책임만을 갖습니다. 이러한 구조는 유지보수성과 확장성 측면에서 권장되는 패턴입니다.

참고: 현재 워크스페이스에는 `SkillTreeResource`/`SkillNodeResource` 프로토타입과 `SkillButton` 씬이 존재합니다. 자동 생성(리소스→뷰) 코드는 실험 과정에서 일부 추가되었다가 보류된 상태이므로, `SkillTreeUI`에 해당 자동 생성 루프를 다시 연결하려면 `_build_from_tree()` 같은 간단한 빌더 함수를 추가하면 됩니다.
