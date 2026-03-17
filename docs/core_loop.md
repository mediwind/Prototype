## Core loop: 마을 ↔ 전투 (주요 단계와 데이터 흐름)

이 문서는 게임의 핵심 루프(마을에서 준비 → 전투 입장 → 전투 진행 → 전투 종료 → 마을 복귀)에서 어떤 데이터와 시스템들이 읽히고 쓰이는지를 단계별로 매핑합니다. 개발 복구 시 빠르게 전체 구조와 책임을 이해하기 위한 문서입니다.

### 전체 시퀀스(요약)

1. Town (마을) — 플레이어 준비(장비/인벤토리/제작)
2. Battle Entrance (전투 입장) — 씬 전환, 전투 환경 초기화
3. Battle (전투 중) — 적 스폰, 전투 로직(CombatManager 등)
4. Battle End (전투 종료) — 보상 지급(아이템/화폐/경험), stat/level 업데이트
5. Return to Town (마을 복귀) — UI 재표시, 저장

아래 섹션은 각 단계별로 '읽는 데이터(READ)'와 '쓰는 데이터(WRITE)', 주요 이벤트/호출 지점을 정리합니다.

---

### 1) Town (마을) — 준비 단계
- READ:
  - `SaveManager.game_data.inventory_data` (현재 장비/인벤토리/핫바 상태)
  - `SaveManager.game_data.stat_data` (player_stat 초기값)
  - `resources/*.tres` (아이템/레시피/스킬 데이터로 UI 구성)
- WRITE:
  - `InventoryManager`를 통한 슬롯 변경(장비 장착/해제 → `StatManager.recalculate_player_stats()` 호출)
  - `CurrencyManager`에 의한 화폐 소비/획득
  - (선택) CraftingUI에서 제작 성공 시 `InventoryManager.add_item()` / `remove_item_from_slot()` 호출
- 주요 UI/시스템:
  - InventoryUI / EquipmentUI (Slot drag/drop)
  - CraftingUI (레시피 필터링, 제작 시 Inventory 변경)
  - Shop UI / NPC 인터랙션
- 주의 사항:
  - UI에서 Resource를 직접 수정하지 말고, `duplicate()` 규칙을 지켜야 함(공유 리소스 변조 방지).

---

### 2) Battle Entrance (전투 입장)
- READ:
  - 플레이어 현재 상태: `StatManager.player_stat` (장비로 계산된 최종 스탯)
  - 필요한 씬/레벨 데이터(맵, 몹 스펙)
- WRITE:
  - 씬 전환: `get_tree().change_scene_to_file(...)` 또는 `call_deferred()` 활용
  - 필요시 `SaveManager.save_game_data()` (autosave 정책에 따름)
- 주요 이벤트:
  - Area2D/Trigger에서 전투 씬 로드 호출
- 주의 사항:
  - Physics callback 내부에서 씬 제거/전환 시 `call_deferred()` 사용 (이미 코드에서 적용됨)

---

### 3) Battle (전투 중)
- READ:
  - `StatManager.player_stat` (공격력, 방어력 등 실시간 참조)
  - 무기/탄환 설정: `BulletData`(duplicate 후 인스턴스별 damage 조정)
- WRITE:
  - Combat 결과로 임시 보상 기록(예: `CurrencyManager.add_currency(..., is_battle=true)`)
  - 적 처치 시 드랍: `InventoryManager.add_item()` 또는 `CurrencyManager`에 버퍼 추가
- 주요 시스템:
  - CombatManager / EntityManager / Enemy AI
  - ShooterComponent: `bullet_data.duplicate()` → bullet 인스턴스에 player_stat 적용
- 주의 사항:
  - 전투 중에는 UI가 pause 모드와 독립적으로 동작해야 하는 경우가 있음(특히 네트워크/동일 프레임 연산 고려)

---

### 4) Battle End (전투 종료)
- READ:
  - `battle_currencies`(CurrencyManager 내부 버퍼)
  - 전투 결과(획득 아이템 목록)
- WRITE:
  - `CurrencyManager.finalize_battle_rewards()` 호출 → 영구 화폐로 정산
  - `InventoryManager.add_item()`로 실제 아이템 추가
  - `LevelAndExpManager`에 경험치 반영 → 레벨업 처리
  - (선택) `SaveManager.save_game_data()` 호출
- 주요 UI/시스템:
  - 보상 화면(획득 아이템/화폐 표시)
  - 레벨업/스킬 포인트 적용 UI

---

### 5) Return to Town (마을 복귀)
- READ:
  - `SaveManager.game_data` (업데이트된 inventory/stat/currency 상태 반영)
- WRITE:
  - UI 재구성(InventoryUI, EquipmentUI 등) — 슬롯 바인딩 재실행
- 주요 작업:
  - 장비 변경 시 StatManager 재계산 보장
  - 플레이어가 마을에서 추가 행동(제작, 판매 등)을 진행할 수 있음

---

## 데이터 책임(짧은 요약)
- InventoryData / SlotData: 인벤토리/장비/핫바의 영속 상태(저장 대상)
- StatData + StatManager: 장비 합산/계산된 최종 스탯 보관 및 제공(읽기 전용으로 다루면 안전)
- CurrencyData + CurrencyManager: 화폐 로직 + 전투 보상 버퍼링
- Recipe / RecipeIngredient: 제작 가능 항목과 필요 재료(테이블 타입에 따라 필터링)

## 권장 체크포인트 (복구/검증 시)
1. 마을에서 장비를 바꾼 뒤 `StatManager.player_stat`이 즉시(또는 다음 프레임 내) 올바르게 갱신되는지 확인
2. 전투 시작 시 `player_stat`이 전투 내 데미지 계산에 반영되는지 스모크 테스트
3. 전투 보상(임시 버퍼 → finalize)이 정상적으로 정산되는지 확인
4. 씬 전환 시 `call_deferred()` 규칙 준수로 콜백 에러 없음

---

문서 내용 수정이나 추가할 항목(예: 구체적인 화면/씬 이름, 더 많은 매핑)이 있으면 알려주세요. 원하시면 이 문서를 기반으로 간단한 스모크 테스트 씬을 하나 생성해 바로 동작을 확인하는 작업으로 넘어가겠습니다.