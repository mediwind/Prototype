# Autoloads (싱글턴) 요약

이 문서는 프로젝트에 등록된 주요 오토로드(singleton)들의 역할과 핵심 API를 정리합니다. 수동 리뷰로 보완 권장.

## SaveManager (`scenes/autoload/save_manager.gd`)
- 역할: `user://game_data.tres`로 `GameData` 리소스를 저장/로드. 초기값을 생성.
- 주요 필드: `game_data: GameData`
- 주요 메서드:
  - `load_game_data()` - 파일이 있으면 로드하고, 없으면 기본값 초기화
  - `save_game_data()` - `ResourceSaver.save(game_data, SAVE_FILE_PATH)`
- 초기화: `initialize_default_values()`에서 `GameData`와 하위 데이터(InventoryData, StatData 등) 생성

## InventoryManager (`scenes/autoload/inventory_manager.gd`)
- 역할: 플레이어의 인벤토리/핫바/장비 슬롯 배열을 런타임에서 관리하고 아이템 추가/제거 로직 제공.
- 주요 필드: `player_inventory_slots`, `player_hotbar_slots`, `player_equipment_slots` (모두 `Array[SlotData]`)
- 주요 메서드:
  - `add_item(item_data: ItemData, amount: int) -> int` : 인벤토리에 아이템을 합치거나 새 슬롯에 추가. 반환값은 실제로 추가된 수량.
  - `remove_item_from_slot(item_data, amount, source_slot_type, source_slot_index) -> bool` : 지정 슬롯에서 아이템 제거(장비 슬롯이면 StatManager.recalculate 호출)
  - `get_inventory_slots()`, `get_hotbar_slots()`, `get_equipment_slots()` 등
- 데이터 표면: `SaveManager.game_data.inventory_data`와 연결되어 영속화됨.

## StatManager (`scenes/autoload/stat_manager.gd`)
- 역할: `StatData`를 초기화하고 장착 장비의 스탯을 합산하여 `player_stat`을 갱신.
- 주요 필드: `player_stat: StatData` (SaveManager.game_data.stat_data)
- 주요 메서드:
  - `recalculate_player_stats()` : 기본 StatData에서 시작해 InventoryManager.get_equipment_slots()를 순회하며 `equipment_data.get_effective_stats()`를 합산.
- 호출 포인트: 장비 장착/해제 이벤트(InventoryManager에서 호출), 게임 시작 시 초기 계산

## CurrencyManager (`scenes/autoload/currency_manager.gd`)
- 역할: 게임 내 화폐(예: gold, faith, soul)를 관리. 전투 보상은 `battle_currencies`에 임시 저장 후 `finalize_battle_rewards()`로 정산.
- 주요 시그널: `currency_updated(currency_name: String, new_amount: int)`
- 주요 메서드: `add_currency(type, amount, is_battle=false)`, `spend_currency(type, amount)`, `finalize_battle_rewards()`
- 저장: SaveManager.game_data.currency_data와 연동(초기화 및 set 호출)

## 기타(요약)
- `game_data.gd` (Resource): `GameData` 리소스가 오토로드된 SaveManager에서 저장/로드 대상이며, 내부에 InventoryData, StatData, CurrencyData 등의 필드를 갖습니다.

---

> 다음 단계: `docs/core_loop.md`로 전환하여 '마을 ↔ 전투' 간의 데이터 흐름과 이벤트 시퀀스를 도식화하겠습니다.
