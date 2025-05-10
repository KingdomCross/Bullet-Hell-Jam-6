extends CharacterBody2D

const SPEED = 500.0
var character_direction : Vector2
var player_health = 3;

func _physics_process(_delta: float) -> void:
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	character_direction.x = Input.get_axis("ui_left", "ui_right")
	character_direction.y = Input.get_axis("ui_up", "ui_down")
	character_direction = character_direction.normalized()
	
	if character_direction:
		velocity = character_direction * SPEED
	else:
		velocity = velocity.move_toward(Vector2.ZERO, SPEED)

	move_and_slide()

func _damaged():
	if player_health > 0:
		player_health - 1
		print(player_health)
	elif player_health == 0:
		queue_free()
