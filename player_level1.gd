extends CharacterBody2D

const SPEED = 130.0
const JUMP_VELOCITY = -350.0

@export var required_keys := 3
@export var next_level := "res://level_2.tscn"

var keys_collected: int = 0
@onready var anim: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	var direction_x := Input.get_axis("move_left", "move_right")
	if direction_x != 0:
		velocity.x = direction_x * SPEED
		anim.flip_h = direction_x < 0
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	if Input.is_action_pressed("move_down") and is_on_floor():
		velocity.y += 20

	move_and_slide()

	if not is_on_floor():
		if velocity.y < 0:
			anim.play("jump")
		else:
			anim.play("fall")
	else:
		anim.play("idle")

func add_key() -> void:
	GameManager.add_key()
	keys_collected += 1

func die() -> void:
	anim.play("death")
	set_physics_process(false)
	await get_tree().create_timer(2.0).timeout
	get_tree().change_scene_to_file("res://level1.tscn")
	GameManager.reset_keys()
