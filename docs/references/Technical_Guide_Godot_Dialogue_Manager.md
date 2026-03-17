## Technical Guide: Godot Dialogue Manager 커스텀 UI 구현

**To:** AI Agent (Anti Gravity Development Team)
**From:** Senior Gameplay Programmer
**Subject:** Godot Dialogue Manager 플러그인 커스텀 UI 통합 가이드
**Context:** Godot 4.4 / GDScript

---

### 1. 개요 (Overview)

이 문서는 Nathan Hoad의 **Godot Dialogue Manager** 플러그인을 사용하여, 기본 제공되는 `CanvasLayer` 풍선이 아닌 **우리가 직접 디자인한 Control 노드 기반 UI**를 연동하는 방법을 설명합니다.

핵심은 플러그인의 `DialogueManager` 싱글톤이 제공하는 데이터(`DialogueLine`)를 받아 우리의 UI 컴포넌트(초상화, 텍스트 박스, 선택지 등)에 바인딩하는 것입니다.

---

### 2. Dialogue 스크립트 작성 규칙 (Prerequisite)

초상화 변경 등의 로직을 처리하기 위해 `.dialogue` 파일 작성 시 다음과 같은 문법을 사용합니다.

```swift
# npc_dialogue.dialogue

~ start

# 캐릭터명 (태그): 대사 내용
Nathan (happy): 안녕! 오늘 날씨가 참 좋지?
Nathan (angry): 잠깐, 너 내 푸딩 먹었어?
- 아니, 안 먹었어.
    Nathan (neutral): 흐음... 알겠어. => END
- 응, 맛있더라.
    Nathan (shocked): 뭐라고?! => END
```

---

### 3. 커스텀 UI 씬 구성 (Scene Setup)

Godot 에디터에서 대화창으로 사용할 씬을 생성합니다. (예: `CustomBalloon.tscn`)
루트 노드는 `CanvasLayer` 혹은 `Control`을 권장합니다.

**추천 노드 구조:**
```text
CustomBalloon (CanvasLayer 혹은 Control)
 ├── Background (Panel)
 ├── Content (HBoxContainer)
 │    ├── Portrait (TextureRect)  <-- 초상화 표시
 │    └── TextContainer (VBoxContainer)
 │         ├── NameLabel (Label)  <-- 캐릭터 이름
 │         └── DialogueLabel (RichTextLabel) <-- *중요: 플러그인 제공 클래스 사용 권장
 └── ResponsesMenu (VBoxContainer) <-- 선택지 버튼들이 들어갈 컨테이너
```

> **Tip:** `DialogueLabel` 노드는 일반 `RichTextLabel` 대신 플러그인에서 제공하는 `addons/dialogue_manager/dialogue_label.gd` 스크립트가 부착된 노드를 사용하면 Typewriter 효과 구현이 매우 쉬워집니다.

---

### 4. 스크립트 구현 (Implementation)

커스텀 UI의 루트 노드(`CustomBalloon`)에 부착할 스크립트입니다. 이 스크립트는 `DialogueManager`로부터 대사 데이터를 수신하고 UI를 갱신합니다.

#### 4.1. 기본 구조 및 초기화

```gdscript
extends CanvasLayer

# 대화 리소스와 시작 지점 (외부에서 호출 시 주입됨)
var resource: DialogueResource
var title: String = "start"
var temporary_game_states: Array = []

# UI 노드 참조
@onready var portrait_rect: TextureRect = $Content/Portrait
@onready var name_label: Label = $Content/TextContainer/NameLabel
@onready var dialogue_label: RichTextLabel = $Content/TextContainer/DialogueLabel
@onready var responses_menu: VBoxContainer = $ResponsesMenu

# 현재 대사 라인 데이터
var dialogue_line: DialogueLine:
    set(next_line):
        # 다음 라인이 없으면 대화 종료
        if not next_line:
            queue_free()
            return
        
        dialogue_line = next_line
        _update_ui()

func _ready() -> void:
    # 대화 시작 함수 호출 (필요시)
    pass

# DialogueManager가 이 함수를 호출하여 대화를 시작합니다. (인터페이스 필수)
func start(dialogue_resource: DialogueResource, title: String, extra_game_states: Array = []) -> void:
    self.resource = dialogue_resource
    self.title = title
    self.temporary_game_states = extra_game_states
    
    # 첫 번째 대사 라인을 가져옵니다.
    self.dialogue_line = await DialogueManager.get_next_dialogue_line(resource, title, temporary_game_states)
```

#### 4.2. UI 업데이트 및 초상화 처리 (Portrait Handling)

태그(tag)를 분석하여 이미지를 교체하는 로직입니다.

```gdscript
# 캐릭터별 초상화 리소스 딕셔너리 (실제 프로젝트에서는 별도 리소스 관리자 사용 권장)
const PORTRAITS = {
    "Nathan": {
        "default": preload("res://assets/nathan_default.png"),
        "happy": preload("res://assets/nathan_happy.png"),
        "angry": preload("res://assets/nathan_angry.png"),
        "shocked": preload("res://assets/nathan_shocked.png")
    }
}

func _update_ui() -> void:
    # 1. 이름 설정
    name_label.text = dialogue_line.character
    
    # 2. 초상화 설정 (핵심 로직)
    var character_name = dialogue_line.character
    var emotion = "default"
    
    # 태그 확인 (예: Nathan (happy) -> tags에 ["happy"]가 들어있음)
    if dialogue_line.tags.size() > 0:
        emotion = dialogue_line.tags[0] # 첫 번째 태그를 감정으로 사용
    
    if PORTRAITS.has(character_name) and PORTRAITS[character_name].has(emotion):
        portrait_rect.texture = PORTRAITS[character_name][emotion]
    else:
        # 이미지가 없으면 숨기거나 기본 이미지 사용
        portrait_rect.texture = null 

    # 3. 대사 텍스트 설정
    dialogue_label.hide()
    dialogue_label.dialogue_line = dialogue_line
    
    # 4. 선택지 초기화
    for child in responses_menu.get_children():
        child.queue_free()
        
    # 5. 대사 출력 시작 (Typewriter 효과)
    dialogue_label.show()
    dialogue_label.type_out()
    
    # 대사가 모두 출력될 때까지 대기 후 선택지 표시 여부 결정
    if dialogue_line.responses.size() > 0:
        # 타이핑이 끝나면 선택지 표시
        await dialogue_label.finished_typing
        _show_responses()
```

#### 4.3. Typewriter 효과 (Data Binding)

`DialogueLabel` (`addons/dialogue_manager/dialogue_label.gd`)을 사용하면 별도 구현 없이 메서드 호출만으로 제어 가능합니다.

*   **주요 메서드:**
    *   `type_out()`: 텍스트를 한 글자씩 출력 시작. BBCode의 `[wait]`, `[speed]` 등을 자동 처리합니다.
    *   `skip_typing()`: 즉시 전체 텍스트를 표시합니다.
*   **주요 시그널:**
    *   `spoke(letter, index, speed)`: 글자가 나올 때마다 발생 (효과음 재생에 사용).
    *   `finished_typing()`: 출력이 완료되었을 때 발생.

**입력 처리 (스킵/다음 대사):**

```gdscript
func _gui_input(event: InputEvent) -> void:
    # 클릭 또는 특정 키 입력 시
    if event.is_action_pressed("ui_accept") or (event is InputEventMouseButton and event.pressed):
        if dialogue_label.is_typing:
            # 타이핑 중이면 스킵
            dialogue_label.skip_typing()
        else:
            # 타이핑이 끝났고 선택지가 없다면 다음 대사로
            if dialogue_line.responses.size() == 0:
                self.dialogue_line = await DialogueManager.get_next_dialogue_line(resource, dialogue_line.next_id, temporary_game_states)
```

#### 4.4. 선택지 처리 (Response Handling)

`dialogue_line.responses` 배열을 순회하며 버튼을 생성합니다.

```gdscript
func _show_responses() -> void:
    responses_menu.show()
    
    for response in dialogue_line.responses:
        # 조건문(Condition)이 있는 선택지의 경우, is_allowed가 false면 표시하지 않음
        if not response.is_allowed:
            continue
            
        var button = Button.new()
        button.text = response.text
        button.connect("pressed", func(): _on_response_selected(response))
        responses_menu.add_child(button)
    
    # 첫 번째 버튼 포커스 (키보드/패드 조작 지원)
    if responses_menu.get_child_count() > 0:
        responses_menu.get_child(0).grab_focus()

func _on_response_selected(response: DialogueResponse) -> void:
    # 선택지를 누르면 해당 선택지의 next_id로 이동
    self.dialogue_line = await DialogueManager.get_next_dialogue_line(resource, response.next_id, temporary_game_states)
```

---

### 5. 대화 실행 방법 (Entry Point)

NPC나 상호작용 가능한 객체에서 위에서 만든 커스텀 씬(`CustomBalloon.tscn`)을 호출하는 방법입니다.

`DialogueManager.show_dialogue_balloon()`은 기본적으로 프로젝트 설정에 등록된 풍선을 사용하지만, **C# 없이 특정 씬을 강제로 지정**하려면 `show_dialogue_balloon_scene()`을 사용하는 것이 가장 확실합니다.

```gdscript
extends Node3D # NPC 스크립트 예시

@export var dialogue_resource: DialogueResource
@export var dialogue_start: String = "start"

# 커스텀 풍선 씬 프리로드
const CustomBalloonScene = preload("res://ui/dialogue/CustomBalloon.tscn")

func interact() -> void:
    # 1. 커스텀 씬을 직접 파라미터로 넘겨서 호출
    DialogueManager.show_dialogue_balloon_scene(CustomBalloonScene, dialogue_resource, dialogue_start)
    
    # 참고: 만약 CustomBalloon.tscn을 프로젝트 설정(Project Settings -> Dialogue Manager -> Balloon Path)에 
    # 등록했다면 아래와 같이 호출해도 됩니다.
    # DialogueManager.show_dialogue_balloon(dialogue_resource, dialogue_start)
```

### 요약 Checklist

1.  [ ] `CustomBalloon.tscn`을 만들고 스크립트를 연결했는가?
2.  [ ] 스크립트 내에 `start()` 메서드가 정의되어 있는가? (DialogueManager가 이 함수를 찾습니다)
3.  [ ] `dialogue_line` 세터(setter)에서 UI 갱신 로직을 처리했는가?
4.  [ ] `line.tags`를 파싱하여 `TextureRect`를 갱신하는가?
5.  [ ] `DialogueLabel`의 `type_out()`과 `finished_typing` 시그널을 활용했는가?
6.  [ ] 선택지 클릭 시 `DialogueManager.get_next_dialogue_line(..., response.next_id, ...)`를 호출하는가?