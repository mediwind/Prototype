# 📟 UI Architecture Manual (Neighborvania)

이 문서는 프로젝트의 UI 아키텍처, 특히 **Persistent UI (GameUI)** 와 **UIManager** 의 작동 원리 및 사용법을 설명합니다.

---

## 🏗️ 핵심 컨셉: Persistent UI Layer

과거 우리 프로젝트는 `TownUI`, `WarriorUI` 처럼 각 씬마다 UI 노드를 개별적으로 가지고 있었습니다. 이는 유지보수가 어렵고 중복 코드를 양산하는 원인이었습니다.

Phase 22 리팩토링을 통해 **모든 HUD와 시스템 UI는 `GameUI`라는 하나의 씬으로 통합**되었으며, 씬 전환과 무관하게 항상 유지됩니다.

### 구조도
```
root (SceneTree)
 ├── UIManager (Autoload) -> Holds GameUI Instance
 │    └── GameUI (CanvasLayer, Layer=100)
 │         ├── HUD (Control)
 │         │    ├── ActionBar
 │         │    ├── CurrencyDisplay
 │         │    └── SystemButtons (Skill/Inventory)
 │         └── Windows (Control)
 │              ├── InventoryUI (Instantiated)
 │              └── SkillTreeUI (Instantiated)
 ├── Main Scene (World)
 │    └── Town / PlayerHome / Dungeon ...
```

---

## 🕹️ UIManager 사용법

`UIManager`는 어디서나 접근 가능한 싱글톤(Autoload)입니다. UI 조작이 필요할 때는 반드시 `UIManager`를 통해야 합니다.

### 1. 컨테이너/창 열기 (Interaction)
상호작용 가능한 객체(보관함, NPC 등)에서 UI를 열 때 사용합니다.
```gdscript
# 예시: Chest Interaction
func interact(player):
    var inventory_data = self.inventory_data
    # 직접 UI를 생성하지 말고, UIManager에게 데이터만 전달하세요.
    if UIManager:
        UIManager.open_container_ui(inventory_data)
```

### 2. HUD 표시/숨김 제어
컷신이나 타이틀 화면 등 HUD를 숨겨야 하는 상황에서 사용합니다.
```gdscript
# HUD 숨기기
UIManager.set_hud_visible(false)

# HUD 보이기
UIManager.set_hud_visible(true)
```
*참고: `SceneManager.change_scene`이 자동으로 게임 플레이 씬 진입 시 HUD를 켜줍니다.*

---

## 🆕 새로운 씬 추가 시 UI 작업 가이드

**Q. 새로운 던전이나 방(`Dungeon.tscn`)을 만들었는데, UI는 어떻게 추가하나요?**

**A. 아무것도 하지 않아도 됩니다!** 
`GameUI`는 씬과 분리되어 항상 최상위 레이어에 떠 있습니다.

1.  **새 씬 생성:** 평소처럼 맵과 객체들을 배치하여 씬을 만듭니다.
2.  **UI 추가 금지:** 씬 안에 `CanvasLayer`나 `UI` 관련 노드를 넣지 마세요.
3.  **테스트:** 게임을 실행하고 해당 씬으로 이동하면, 자동으로 체력바, 스킬창, 인벤토리 버튼이 보입니다.

### 예외 상황 (UI 없는 씬)
만약 UI가 **없어야 하는** 특수한 방(예: 꿈속 연출, 엔딩 크레딧)을 만든다면, 해당 씬의 스크립트(`_ready`)에 다음 한 줄만 추가하세요.
```gdscript
func _ready():
    UIManager.set_hud_visible(false)
```

---

## 🎨 스타일링 (Theming)

게임 전체의 UI 룩앤필을 바꾸고 싶다면 `scenes/ui/game_ui.tscn`을 수정하거나 프로젝트 테마를 변경하세요.

*   **배치 수정:** `scenes/ui/game_ui.tscn` 수정 (모든 맵에 일괄 반영됨)
*   **폰트/색상:** `Project Settings > GUI > Theme` 의 `.tres` 수정

---
*작성일: 2026-01-31 (Phase 22 Completed)*
