# 🧪 QA Test Plan: NPC Persistence (Phase 25)

이 문서는 **Phase 25: Save/Load Integration**의 검증 절차를 다룹니다.
새롭게 도입된 `NPCManager`와 `Talula`의 상태(호감도 등)가 게임 종료 후에도 안전하게 유지되는지 확인하는 것이 핵심입니다.

## 🎯 테스트 목표
1.  **Session Persistence:** 게임을 끄고 다시 켰을 때, NPC와의 호감도(Affection)가 유지되는지 확인합니다.
2.  **New Game Reset:** '새 게임(New Game)'을 시작했을 때, 이전 플레이 기록(높은 호감도)이 초기화되는지 확인합니다.
3.  **Phantom Data Check:** 저장하지 않고 나갔을 때, 데이터가 롤백되는지 확인합니다.

---

## 📋 테스트 시나리오

### 1. 세션 유지 테스트 (Session Persistence)
- **준비:**
    1.  타이틀 화면에서 'New Game'으로 시작합니다.
    2.  `System Menu (ESC)` -> `Main Menu` 등 이전에 저장된 데이터가 있다면 `New Game`으로 깨끗한 상태에서 시작합니다.
- **절차:**
    1.  **[Interaction]** Talula에게 말을 겁니다. (초기 상태 확인: "안녕! 이사 왔니?")
    2.  **[Gift]** 대화 선택지에서 "나무 1개 선물"을 선택합니다. (나무가 없다면 디버그로 추가하거나 수집 후 진행)
    3.  **[Check Log]** Output 창에 `NPCManager: Talula affection changed by 10` 로그가 뜨는지 확인합니다.
    4.  **[Save]** `ESC` 키를 눌러 시스템 메뉴를 열고 **`Save` 버튼**을 누릅니다.
    5.  **[Restart]** `F6` 또는 `F5` 디버그 창을 완전히 닫고(종료), 다시 실행합니다.
    6.  **[Load]** 타이틀 화면에서 **`Continue` 버튼**을 누릅니다.
    7.  **[Verify]** 다시 Talula에게 말을 겁니다.
- **기대 결과:**
    - [ ] (구현에 따라 다르지만) "나무 1개 선물" 선택지가 다시 뜨더라도, 내부적으로 **호감도는 유지**되어야 합니다.
    - [ ] 만약 대화 조건(Conditional Dialogue)을 추가했다면, "선물 고마웠어!" 같은 다른 대사가 나와야 합니다.
    - [ ] (가장 확실한 방법) `Load` 직후 Output 로그나 브레이크포인트로 `NPCManager.get_affection("talula")` 값이 `10`인지 확인합니다.

### 2. 새 게임 초기화 테스트 (Clean New Game)
- **준비:**
    1.  위의 '세션 유지 테스트'를 완료하여, 이미 저장 파일에 호감도 `10`이 기록된 상태여야 합니다.
- **절차:**
    1.  게임을 실행하고 타이틀 화면에서 **`New Game` 버튼**을 누릅니다.
    2.  Talula에게 말을 겁니다.
- **기대 결과:**
    - [ ] 호감도가 `0`으로 초기화되어 있어야 합니다.
    - [ ] 이전 세이브 데이터의 영향을 받지 않고 완전히 새로운 상태여야 합니다.

### 3. 저장하지 않고 나가기 (Phantom Data Check)
- **절차:**
    1.  게임을 로드합니다. (현재 호감도: 유지됨)
    2.  Talula에게 선물을 또 줍니다. (호감도 증가: `10` -> `20`)
    3.  **저장하지 않고(Do NOT Save)** 게임을 끕니다.
    4.  다시 게임을 켜고 `Continue`를 누릅니다.
- **기대 결과:**
    - [ ] 호감도가 `20`이 아닌 **`10`**으로 돌아와 있어야 합니다.

---

## 📝 자동화 체크리스트 (Self-Check)
- [ ] `SaveManager.gd`: `save_game_data()` 함수에 `npc_save_data` 저장 로직이 있는가?
- [ ] `SaveManager.gd`: `load_game_data()` 함수에 `npc_save_data` 로드 로직이 있는가?
- [ ] `SaveManager.gd`: `reset_game_data()` 함수에서 `NPCManager`를 초기화하는가?
