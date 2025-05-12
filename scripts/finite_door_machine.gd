extends Node2D

@onready var doorlevel = get_parent().find_child("DoorLevel")
@onready var doorlevel2 = get_parent().find_child("DoorLevel2")
@onready var doorlevel3 = get_parent().find_child("DoorLevel3")
@onready var doorlevel4 = get_parent().find_child("DoorLevel4")
@export var victory_text : Label
@export var score_label : Label
@export var mob : CharacterBody2D
@export var player : CharacterBody2D
var current_door = 0
var total_teleport = 0

func _on_door_level_body_entered(body: Node2D) -> void:
	if body.is_in_group("player") && current_door == 0:
		doorlevel2.find_child("Sprite2D").set_visible(true)
		doorlevel.find_child("Sprite2D").set_visible(false)
		current_door = 1
		total_teleport += 1
		score_label.text = str(total_teleport)
		mob.position.y += 340


func _on_door_level_2_body_entered(body: Node2D) -> void:
	if body.is_in_group("player") && current_door == 1:
		doorlevel3.find_child("Sprite2D").set_visible(true)
		doorlevel2.find_child("Sprite2D").set_visible(false)
		current_door = 2
		total_teleport += 1
		score_label.text = str(total_teleport)
		mob.position.y += -340


func _on_door_level_3_body_entered(body: Node2D) -> void:
	if body.is_in_group("player") && current_door == 2:
		doorlevel4.find_child("Sprite2D").set_visible(true)
		doorlevel3.find_child("Sprite2D").set_visible(false)
		current_door = 3
		total_teleport += 1
		score_label.text = str(total_teleport)
		mob.position.y += +340


func _on_door_level_4_body_entered(body: Node2D) -> void:
	if body.is_in_group("player") && current_door == 3:
		doorlevel.find_child("Sprite2D").set_visible(true)
		doorlevel4.find_child("Sprite2D").set_visible(false)
		current_door = 0
		total_teleport += 1
		score_label.text = str(total_teleport)
		mob.position.y += -340
		if total_teleport >= 12:
			victory_text.set_visible(true)
