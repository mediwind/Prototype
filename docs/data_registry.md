# Data Registry (자동 생성 초안)

이 파일은 프로젝트에 사용되는 주요 Resource 및 데이터 클래스의 경로, class_name, export 필드, 간단한 설명을 모아둔 레지스트리입니다.

> 자동 생성된 초안입니다. 일부 스크립트는 수동 검토로 상세 설명/타입 보완이 필요합니다.

## 요약 (발견된 주요 항목)

- `resources/item/item_data.gd` — `ItemData`
  - exports: `name: String`, `icon: Texture2D`, `description: String`, `max_stack: int = 1`, `equipment_data: EquipmentData`, `consumable_data: ConsumableData`
  - 설명: 아이템의 메타데이터. 장비/소모품 서브리소스 포함 가능.

- `resources/item/equipment_data.gd` — `EquipmentData`
  - exports: `slot_type: EquipmentSlotType` (enum), `stats: Dictionary`
  - methods: `get_effective_stats()`
  - 설명: 장비 전용 데이터(장착 위치, 스탯 딕셔너리).

- `resources/item/consumable_data.gd` — `ConsumableData`
  - exports: `effect_type: ConsumableEffectType`, `effect_value: int`
  - 설명: 소모품 효과 정의.

- `resources/item/slot_data.gd` — `SlotData`
  - exports: `item_data: ItemData`, `amount: int`
  - 설명: 인벤토리/핫바/장비 슬롯을 직렬화하는 단위.

- `saved_data/inventory_data.gd` — `InventoryData`
  - exports: `inventory_slots: Array[SlotData]`, `hotbar_slots: Array[SlotData]`, `equipment_slots: Array[SlotData]`, `equipment_slot_count: int`, `inventory_max_size`, `hotbar_max_size`
  - methods: `ensure_slots()`
  - 설명: 플레이어 인벤토리/장비/핫바 상태를 저장.

- `saved_data/stat_data.gd` — `StatData`
  - exports: `stats: Dictionary` (예: {"attack":0, ...})
  - methods: `set_stat()`, `get_stat()`
  - 설명: 플레이어의 계산된/영구 스탯 보관.

- `resources/bullet/bullet_data.gd` — `BulletData`
  - exports: `speed`, `max_distance`, `damage`, `penetration`, `bullet_scene: PackedScene`
  - 설명: 총알 구성 데이터. 인스턴스 복제(duplicate) 후 사용.

- `resources/recipe/recipe.gd` — `Recipe`
  - exports: `name`, `ingredients: Array[RecipeIngredient]`, `output_items: Array[RecipeIngredient]`, `table_types: Array[String]`
  - 설명: 제작 레시피와 제작 가능 테이블 타입 목록.

- `resources/recipe/recipe_ingredient.gd` — `RecipeIngredient`
  - exports: `type: String`, `item_data: ItemData`, `currency_data: CurrencyData`, `amount: int`
  - 설명: 레시피의 재료/출력 단위.

- `resources/skill/skill_template.gd` — `SkillTemplate`
  - exports: `id`, `max_level`, `skill_point_cost`, `title`, `description`

- `resources/currency/currency_drop_info.gd` — `CurrencyDropInfo`
  - exports: `currency_type`, `drop_percent`, `min_amount`, `max_amount`


---

> 주: 레지스트리는 프로젝트의 추가 리소스/스크립트가 더 존재할 수 있어 계속 확장해야 합니다. `docs/autoloads.md`와 병행해서 보면 전체 흐름 파악에 도움이 됩니다.

## 인스턴스(.tres) 매핑 (자동 스캔)

아래는 프로젝트에 존재하는 주요 `.tres` 파일과 해당 리소스 클래스(또는 타입)입니다. 각 항목은 에디터에 생성된 실제 데이터 인스턴스 확인에 도움됩니다.

- `resources/tileset.tres` — `TileSet` (타일셋 에셋)
- `resources/item/sword.tres` — `ItemData` (장비 하위 `EquipmentData` 포함, stats {"attack":3})
- `resources/item/health_potion.tres` — `ItemData` (consumable_data 포함)
- `resources/item/gold_coin.tres` — `ItemData`
- `resources/recipe/test_recipe_ingredient_2.tres` — `RecipeIngredient` (참조: `health_potion.tres`)
- `resources/recipe/test_recipe_ingredient.tres` — `RecipeIngredient` (참조: `sword.tres`)
- `resources/recipe/test_recipe.tres` — `Recipe` (ingredients/output_items에 위의 RecipeIngredient 사용, `table_types = ["alchemy"]`)
- `resources/skill/test3.tres` — `SkillTemplate` (id: `t3`)
- `resources/skill/test2.tres` — `SkillTemplate` (id: `t2`)
- `resources/skill/test1.tres` — `SkillTemplate` (기본값)
- `resources/skill/fire_rate.tres` — `SkillTemplate` (id: `fire_rate`)
- `resources/skill/bullet_damage.tres` — `SkillTemplate` (id: `bullet_damage`)

> 참고: 더 많은 `.tres` 파일이나 씬 연결을 포함하려면 추가 스캔(옵션 C)을 진행할 수 있습니다.
