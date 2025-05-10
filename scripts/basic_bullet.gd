extends Area2D

const SPEED = 100
var direction = Vector2.RIGHT


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func  _physics_process(delta: float) -> void:
	position += direction * SPEED * delta


func _on_body_entered(body):
	print("Test")
	if body.in_group("Player"):
		body._damaged()


func _on_screen_exited() -> void:
	queue_free()
