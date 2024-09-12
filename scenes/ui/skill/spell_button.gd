extends TextureButton

@onready var cooldown = $Cooldown
@onready var binding_key = $BindingKey
@onready var remaining_time = $RemainingTime
@onready var timer = $Timer

var change_key = "":
    set(value):
        change_key = value
        binding_key.text = value

        shortcut = Shortcut.new()
        var input_key = InputEventKey.new()
        input_key.keycode = value.unicode_at(0)

        shortcut.events = [input_key]


func _ready():
    change_key = "1"
    cooldown.max_value = timer.wait_time
    set_process(false)

    self.pressed.connect(_on_pressed)
    timer.timeout.connect(_on_timer_timeout)


func _process(_delta):
    remaining_time.text = "%3.1f" % timer.time_left
    cooldown.value = timer.time_left


func _on_pressed():
    timer.start()
    disabled = true
    set_process(true)


func _on_timer_timeout():
    disabled = false
    remaining_time.text = ""
    cooldown.value = 0
    set_process(false)


func _get_drag_data(at_position):
    var preview_texture = TextureButton.new()

    preview_texture.texture_normal = texture_normal
    preview_texture.size = Vector2(40, 40)

    var preview = Control.new()
    preview.add_child(preview_texture)

    set_drag_preview(preview)
    texture_normal = null

    return preview_texture.texture_normal


func _can_drop_data(at_position, data):
    return data is Texture2D


func _drop_data(at_position, data):
    texture_normal = data