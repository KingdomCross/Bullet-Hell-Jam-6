extends CharacterBody2D

const SPEED = 500.0
var character_direction : Vector2
var can_be_damage = true
@onready var debug = $debug
@onready var progress_bar = $ProgressBar
@onready var damage_cooldown = owner.find_child("damage_cooldown")

var health = 100:
	set(value):
		health = value
		progress_bar.value = value

func _ready() -> void:
	damage_cooldown.timeout.connect(_on_duration_timeout)

func _on_duration_timeout():
	print("bnow")
	can_be_damage = true

func _physics_process(_delta: float) -> void:
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	velocity = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down") * SPEED
	character_direction = character_direction.normalized()
	move_and_slide()

func set_status(bullet_type):
	if can_be_damage:
		match bullet_type:
			_:
				can_be_damage = false
				damage_cooldown.start()
				debug.text = "default damage"
				health -= 10
