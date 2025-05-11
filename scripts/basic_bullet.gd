extends Area2D

@export var texture_array : Array[Texture2D]

const SPEED = 100
var direction = Vector2.RIGHT
var bullet_type: int = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func  _physics_process(delta: float) -> void:
	position += direction * SPEED * delta

func _on_body_entered(body):
	body.set_status(bullet_type)


func _on_screen_exited() -> void:
	queue_free()

func set_property(type):
	bullet_type = type
	$Sprite2D.texture = texture_array[type]
