extends CharacterBody2D

# @onready var animation_player = $AnimationPlayer

# const MAX_SPEED = 100

# func _physics_process(_delta):
#     handle_movement()
#     update_animation()

# # Handle player movement based on input
# func handle_movement():
#     var movement_vector = get_movement_vector()
#     velocity = movement_vector.normalized() * MAX_SPEED
#     move_and_slide()

# # Get the movement vector based on input actions
# func get_movement_vector():
#     var x_movement = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
#     var y_movement = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
#     return Vector2(x_movement, y_movement)

# # Update animation based on movement and input
# func update_animation():
#     var movement_vector = get_movement_vector()

#     # Check for movement direction
#     if movement_vector.x > 0:
#         animation_player.play("KatanaRunRight")  # Move right
#     elif movement_vector.x < 0:
#         animation_player.play("KatanaRunLeft")  # Move left
#     elif movement_vector == Vector2.ZERO:
#         animation_player.play("IdleRight")  # Idle state (default right)

#     # Check for attack input (mouse left click)
#     if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
#         play_attack_animation()

# # Play attack animation based on mouse position
# func play_attack_animation():
#     var mouse_position = get_global_mouse_position()
#     var player_position = global_position

#     if mouse_position.x < player_position.x:
#         animation_player.play("KatanaAttackLeft")  # Attack left
#     else:
#         animation_player.play("KatanaAttackRight")  # Attack right