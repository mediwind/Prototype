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
