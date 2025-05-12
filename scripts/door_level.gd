extends Node2D

@export var player : CharacterBody2D
@export var door_array : Array[Area2D]
var current_collider
var player_collider

func _ready() -> void:
	var num_of_door = door_array.size()
	door_array[0].find_child("Sprite2D").visible = true
	current_collider = door_array[0].find_child("CollisionShape2D")
	player_collider = player.find_child("CollisionShape2D")

func _process(delta: float) -> void:
	if current_collider == player_collider:
		print("test")
