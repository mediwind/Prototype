# Quick Reference — 프로젝트 한눈에 보기

목적: 몇 달 손을 놓은 뒤 빠르게 프로젝트 구조와 핵심 데이터를 복구하기 위한 1페이지 치트시트입니다.
사용법: 아래 항목을 한 번 훑고, 가장 기억이 안 나는 2~3개 파일을 골라 상세 분석으로 넘어가세요.

---

## 핵심 오토로드(싱글턴)
- `scenes/autoload/save_manager.gd` — GameData(저장된 모든 데이터) 로드/저장; 초기화 책임
- `scenes/autoload/inventory_manager.gd` — player_inventory/hotbar/equipment 슬롯 배열 관리, 아이템 add/remove API
- `scenes/autoload/stat_manager.gd` — 장착 장비를 합산하여 `player_stat: StatData` 재계산
- `scenes/autoload/currency_manager.gd` — 화폐 관리(전투 중 버퍼링 → `finalize_battle_rewards()`로 정산)

> 빠른 확인 포인트: `SaveManager.game_data` 안에 `inventory_data`, `stat_data`, `currency_data` 등이 들어있습니다.

---

## 주요 데이터 리소스(경로 / class_name / 역할)
- `resources/item/item_data.gd` — ItemData: 아이템 메타(이름, 아이콘, equipment_data, consumable_data)
- `resources/item/equipment_data.gd` — EquipmentData: 장비 슬롯 타입, stats 딕셔너리
- `resources/item/consumable_data.gd` — ConsumableData: 소모품 효과 정의
- `resources/item/slot_data.gd` — SlotData: `item_data` + `amount` (인벤토리/핫바/장비의 단위)
- `saved_data/inventory_data.gd` — InventoryData: inventory_slots, hotbar_slots, equipment_slots (영속화)
- `saved_data/stat_data.gd` — StatData: `stats` 딕셔너리(최종/영구 스탯 저장)
- `scenes/autoload/game_data.gd` — GameData: 최상위 저장 리소스(InventoryData, StatData 등 포함)
- `resources/bullet/bullet_data.gd` — BulletData: speed, damage, bullet_scene(발사 전 duplicate 권장)
- `resources/recipe/recipe.gd` 및 `recipe_ingredient.gd` — 제작 레시피와 재료
- `resources/skill/skill_template.gd` — SkillTemplate: 스킬 메타
- `resources/currency/currency_drop_info.gd` — CurrencyDropInfo: 드랍 확률/양

---

## 중요 씬 / UI / 컴포넌트 (핵심 파일 경로)
- `scenes/ui/inventory/slot.gd` — 슬롯 UI: 드래그/드롭 검증(장비 슬롯 타입 검사), 슬롯 UI ↔ SlotData sync
- `scenes/ui/inventory/inventory_ui.gd` — 인벤토리/핫바/장비 UI 컨트롤러(각 슬롯 컨테이너 초기화 및 신호 연결)
- `scenes/ui/crafting/crafting_ui.gd` — 제작 UI: recipe 로딩 및 table_types 필터링
- `scenes/town/crafting_table.gd` — 월드 상의 제작 테이블(플레이어가 상호작용하여 CraftingUI 오픈)
- `scenes/component/shooter_component.gd` — 발사 로직: `bullet_data.duplicate()` 후 player stat 반영
- `scenes/town/battle_entrance.gd` — Area2D 트리거로 전투 씬 전환(주의: Physics callback -> call_deferred)

---

## 빠른 검사 체크리스트 (기억 복구용, 실행 시점: 에디터에서 확인)
1. 장비 착용 확인: 인벤토리에서 Sword(`resources/item/sword.tres`)를 장비 슬롯에 넣고 콘솔에서 `Recalculated Stats:` 로그가 찍히는지 확인
2. Stat 적용 확인: 위 장비 상태로 전투 씬 진입 → `player_stat.get_stat("attack")`가 전투 내 데미지 계산에 사용되는지 로그로 확인
3. 전투 보상 확인: 전투 중 `CurrencyManager.add_currency("gold", 50, true)` 호출 후 `finalize_battle_rewards()`로 실제 SaveManager.game_data.currency_data.gold가 증가하는지 확인
4. 인벤토리 기본 동작: 같은 아이템을 여러 번 `InventoryManager.add_item()` 했을 때 슬롯 합침/빈 슬롯 추가 동작이 올바른지 확인

---

## 빠르게 복구하는 순서(권장)
1. 이 문서(Quick Reference)를 1분 훑기
2. 위 검사 체크리스트 1~2개를 직접 실행(에디터에서 콘솔/로그 확인) — 성공하면 ‘감’이 빠르게 돌아옵니다
3. 가장 헷갈리는 2~3개 파일을 지목하여 상세 분석(제가 파일별 요약을 해드립니다)

---

필요하시면 지금 바로 (A) 검사 체크리스트 1번(장비 착용 → Stat 재계산)에 맞춘 간단한 테스트 씬을 생성하거나, (B) 당신이 지정한 2~3개 파일을 상세 요약해 드리겠습니다. 어느 쪽으로 진행할까요?