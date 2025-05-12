extends State

@onready var collision = %CollisionShape2D

var player_entered : bool = false:
	set(value):
		player_entered = value
		collision.set_deferred("disabled",value)


func _on_player_entered(_body: Node2D) -> void:
	player_entered = true

func transition():
	get_parent().change_state("5Leaf")
