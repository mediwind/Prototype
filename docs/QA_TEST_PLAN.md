# 🧪 QA Test Plan: Persistence & System Flow

본 문서는 게임의 저장/불러오기(Persistence) 및 씬 이동 로직의 무결성을 검증하기 위한 QA(Quality Assurance) 절차서입니다. 개발 단계에서 반복적으로 수행하여 데이터 오염 및 UX 결함을 방지합니다.

## 📋 Test Case 1: "Clean" New Game Check (데이터 초기화 검증)
> **목표:** 게임을 새로 시작했을 때, 이전 플레이 기록(Ghost Data)이 완벽하게 제거되었는지 확인.

1.  **사전 준비:** 게임을 실행하고 아이템 획득, 농작물 심기 등을 수행하여 데이터를 "더럽힙니다(Dirty)".
2.  **Step 1:** `Esc` -> [Quit]를 눌러 게임을 종료(바탕화면)하거나 타이틀 화면으로 나갑니다.
3.  **Step 2:** 다시 게임을 실행하거나 [New Game]을 클릭합니다.
4.  **검증 항목:**
    -   [ ] **인벤토리:** `I` 혹은 `Tab`을 눌러 장비창/인벤토리가 비어있는지(초기 지급 아이템 제외) 확인.
    -   [ ] **장비:** 캐릭터 스프라이트 또는 장비창에 이전 장비가 장착되어 있지 않은지 확인.
    -   [ ] **농장:** 밭에 농작물이 없어야 하며, 땅이 갈려있지 않아야 함.
    -   [ ] **시간:** 1년 봄 1일 06:00 (혹은 초기 설정 시간)부터 시작해야 함.

## 💾 Test Case 2: Save & Continue Consistency (저장 무결성)
> **목표:** 저장한 시점의 데이터가 정확하게 로드되는지 확인.

1.  **Step 1:** [New Game]으로 시작.
2.  **Step 2:**
    -   특정 위치로 이동 (예: 집 앞).
    -   특정 행동 수행 (예: 밭 1칸만 갈기, 아이템 1개 줍기).
3.  **Step 3:** `Esc` -> [Save Game] 클릭. "저장됨" 로그 확인(옵션).
4.  **Step 4:** 추가 행동 수행 (예: 밭 1칸 **더** 갈기, 아이템 **버리기**). **(저장하지 않음!)**
5.  **Step 5:** `Esc` -> [Main Menu]로 타이틀 화면 이동.
6.  **Step 6:** [Continue] 클릭.
7.  **검증 항목:**
    -   [ ] **위치:** 저장했던 집 앞에 위치하는가?
    -   [ ] **농장:** 밭이 **1칸만** 갈려 있어야 함. (2칸이면 실패: 종료 시 자동저장 버그 의심)
    -   [ ] **아이템:** 주웠던 아이템 1개가 있어야 하며, 버린 상태가 아니어야 함.

## 🚫 Test Case 3: Quit Without Saving (데이터 롤백)
> **목표:** 저장하지 않고 나갔을 때, 변경 사항이 반영되지 않아야 함.

1.  **Step 1:** 게임 진행 중 (상태 A).
2.  **Step 2:** 아이템을 습득하거나 돈을 씀 (상태 B).
3.  **Step 3:** 저장하지 않고 `Esc` -> [Main Menu] -> [Continue].
4.  **검증 항목:**
    -   [ ] 상태 B가 아닌 **상태 A**여야 함. (돈이 줄어들지 않아야 함)

## ⌨️ Test Case 4: UI UX Conflict (이중 ESC 방지)
> **목표:** UI를 닫을 때 Pause Menu가 같이 뜨지 않아야 함.

1.  **Step 1:** 인벤토리(`I`), 스킬창(`K`?), 제작창 등을 엽니다.
2.  **Step 2:** `Esc` 키를 **한 번** 누릅니다.
3.  **검증 항목:**
    -   [ ] 열려있던 UI만 닫혀야 함.
    -   [ ] 화면 중앙에 "Pause Menu"가 뜨지 않아야 함.
4.  **Step 3:** 아무 UI도 없는 상태에서 `Esc`를 누릅니다.
5.  **검증 항목:**
    -   [ ] "Pause Menu"가 정상적으로 열려야 함.

## 🛠️ Debugging Reference (개발자용)
데이터 오염이 의심될 때 확인할 코드:
*   **InventoryManager / SkillManager / StatManager:** `load_save_data()` 메서드에서 `SaveManager.game_data` 로부터 참조를 갱신하고 있는지 확인. (구버전 `game_data` 참조 유지 버그 주의)
*   **SaveManager:** `reset_game_data()` 및 `load_game_data()` 시 모든 Manager의 `load_save_data()`를 호출하여 리셋을 전파하는지 확인.

---

# 🌍 PART 2. World Expansion & Persistence (Phase 21)

## Test Case 5: Portal Travel & Time Dilation
**Goal:** Verify scene switching controls time flow.
1. Enter 'Player Home'. -> Verify `TimeManager` stops (Clock stops). -> **[PASS]**
2. Exit to 'Town'. -> Verify `TimeManager` resumes. -> **[PASS]**
3. Verify spawn position matches the door. -> **[PASS]**

## Test Case 6: Location Persistence
**Goal:** Verify game loads at correct scene/pos.
1. Save inside 'Player Home'. -> **[PASS]**
2. Return to Title -> Continue.
3. **Expectation:** Load directly into 'Player Home', not Town. -> **[PASS]** (Fixed Issue A)

## Test Case 7: Multi-Scene Build Integrity
**Goal:** Verify objects don't bleed between scenes.
1. Place Chest at (10,10) in Town.
2. Go to Home. Check (10,10).
3. **Expectation:** (10,10) in Home should be empty. -> **[PASS]** (Fixed Ghosting)
4. Place Chest at (10,10) in Home. Save.
5. Exit game. Reload.
6. **Expectation:** Both chests exist in their respective scenes without error. -> **[PASS]** (Fixed Corruption)
