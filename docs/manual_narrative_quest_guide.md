# 📖 Narrative & Quest Design Guide

이 문서는 **Neighborvania** 프로젝트의 **대화(Dialogue)** 및 **퀘스트(Quest)** 시스템을 통합적으로 설명하는 가이드입니다. 
두 시스템은 긴밀하게 연결되어 있어 ("대화를 통해 퀘스트를 받고, 퀘스트 완료 후 대화가 달라짐"), 함께 이해하고 설계하는 것이 중요합니다.

---

## 🏛️ 1. Conceptual Overview (개념)

### Social Metroidvania
우리의 목표는 **"물리적 장벽이 아닌, 사회적 관계를 통해 세계가 확장되는 경험"**입니다.
*   **NPC와의 신뢰(Affection)**가 곧 장비(Equipment)입니다.
*   **퀘스트(Quest)**는 신뢰를 얻기 위한 수단이자, 스토리텔링의 핵심 단위입니다.

---

## 💬 2. Dialogue System (대화)

우리는 **Nathan Hoad's Dialogue Manager** 플러그인을 사용합니다.
스크립트 언어와 유사한 **DSL (Domain Specific Language)**을 사용하여 대화를 작성합니다.

### 2.1 파일 생성 및 위치
*   **위치:** `resources/dialogue/*.dialogue`
*   **생성:** Godot FileSystem 패널 우클릭 -> `New Resource...` -> `Dialogue`

### 2.2 기본 문법 (Syntax)
```text
~ unique_dialogue_key

CharacterName: 안녕하세요! 오늘 날씨가 좋네요.
Player: 그러게요. 농사짓기 딱 좋은 날이에요.
CharacterName: [[하하, 부지런하시네요.|농사요? 힘들지 않으세요?]] (랜덤 대사)

=> END
```

### 2.3 조건문 (Conditions) & 상태 체크
NPC나 플레이어의 상태에 따라 대화가 분기됩니다.

```text
~ greeting

if QuestManager.is_quest_completed("quest_intro_wood"):
    Talula: 나무 정말 고마웠어! 덕분에 울타리를 다 고쳤지 거야.
elif QuestManager.is_quest_active("quest_intro_wood"):
    Talula: 혹시 나무는 좀 구했니? 10개만 있으면 돼.
else:
    Talula: 안녕? 혹시 시간 있으면 나 좀 도와줄 수 있어?
    - 물론이지. 뭔데?
        => start_quest_logic
    - 지금은 좀 바빠. => END
```

### 2.4 코드 실행 (Mutations)
대화 도중 GDScript 함수를 호출할 수 있습니다. 주로 퀘스트 시작, 보상 지급 등에 사용됩니다.

```text
~ give_gift
Player: 이거 받으세요. (나무를 건넨다)
do InventoryManager.remove_item("wood", 1)
do NPCManager.add_affection("talula", 10)
Talula: 어머, 정말 고마워!
```

---

## 📜 3. Quest System (퀘스트)

퀘스트는 **Inspector-First** 방식의 데이터 기반 시스템입니다. 코드를 수정하지 않고 `.tres` 파일 생성만으로 퀘스트를 만들 수 있습니다.

### 3.1 퀘스트 생성 (Workflow)
1.  **위치:** `resources/quest/definitions/` 폴더로 이동.
2.  **생성:** 우클릭 -> `New Resource...` -> `QuestResource`.
3.  **파일명:** `quest_{category}_{name}.tres` 규칙 준수 (예: `quest_intro_wood.tres`).

### 3.2 주요 속성 (Properties)
*   **ID:** 파일명과 동일하게 작성 (고유 식별자).
*   **Title:** 퀘스트 제목 (UI 표시용).
*   **Description:** 줄거리 및 목표 설명.
*   **Objectives:** `QuestObjectiveResource` 배열. (Fetch, Talk, Visit 등)
*   **Rewards:** `QuestRewardResource` 배열. (Item, Gold, Affection 등)
*   **Is Miscellaneous:** `true` 체크 시 '기타 퀘스트'로 분류되어 UI에서 접혀 보임.

### 3.3 목표 (Objectives) 설정
*   **FetchObjective**: 특정 아이템 수집. `target_item_id`와 `count` 설정.
*   **TalkObjective**: 특정 NPC와 대화. `target_npc_id` 설정.

---

## 🔗 4. Integration: Dialogue ↔ Quest

대화와 퀘스트를 연결하는 패턴(Pattern)입니다.

### 4.1 퀘스트 시작 (Offer Quest)
NPC가 퀘스트를 제안하고, 수락 시 시스템에 등록합니다.

```text
~ offer_quest
Talula: 울타리가 부러졌는데 고칠 나무가 없어... (나무 10개 필요)
- 내가 구해다 줄게.
    do QuestManager.start_quest("quest_intro_wood")
    Talula: 정말? 고마워! 기다리고 있을게.
- 유감이네. (거절)
    Talula: 그렇구나... 어쩔 수 없지.
```

### 4.2 퀘스트 완료 (Complete Quest)
조건을 만족했는지 시스템(`can_complete_quest`)에 물어보고 완료 처리합니다.

```text
~ check_quest_completion
if QuestManager.can_complete_quest("quest_intro_wood"):
    Player: 여기 나무 가져왔어.
    do QuestManager.complete_quest("quest_intro_wood")
    Talula: 와, 정말 빠르네! 보답으로 이걸 줄게. (보상 자동 지급됨)
else:
    Talula: 나무는 아직이니? 천천히 해도 돼.
```

---

## 🖥️ 5. UI/UX Guide

### 5.1 Quest Log (J Key)
*   **Two-Pane Layout:** 왼쪽은 목록, 오른쪽은 상세 내용.
*   **Categorization:** 메인 퀘스트와 기타(Miscellaneous) 퀘스트가 분리되어 있습니다.
*   **Interactive:** 완료된 퀘스트도 기록(History)으로 남아 다시 볼 수 있습니다.

### 5.2 Localization Issues
*   현재 한글 자동 줄바꿈(Word Wrap)이 완벽하지 않습니다 ("고민이/야" 현상).
*   **권장 사항:** 짧은 대사는 괜찮지만, 긴 대사는 `.dialogue` 파일에서 직접 엔터(줄바꿈)를 쳐서 가독성을 높여주세요.

---

## ✅ Checklist for Content Creator
새로운 콘텐츠를 추가할 때 다음을 확인하세요:

1.  [ ] **Quest Resource** 생성 (`quest_new_story.tres`).
2.  [ ] **ID**가 유니크한지 확인.
3.  [ ] **Dialogue** 파일(`npc.dialogue`) 작성 또는 수정.
4.  [ ] 대화 내에서 `QuestManager.start_quest(id)` 호출 추가.
5.  [ ] 대화 내에서 `QuestManager.complete_quest(id)` 로직 추가.
6.  [ ] 인게임 테스트: 제안 -> 수락( UI 확인) -> 수행 -> 완료(보상 확인).
