extends CharacterBody2D

const SPEED := 130.0
const JUMP_VELOCITY := -350.0

var keys_collected: int = 0
var health: int = 3
var is_attacking: bool = false

@onready var anim: AnimatedSprite2D = $AnimatedSprite2D
@onready var attackbox: Area2D = $AttackBox

func _ready() -> void:
	attackbox.monitoring = false
	if not is_in_group("player"):
		add_to_group("player")

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

	if Input.is_action_just_pressed("attack") and not is_attacking:
		attack()

	move_and_slide()

	if is_attacking:
		pass
	elif not is_on_floor():
		if velocity.y < 0:
			anim.play("jump")
		else:
			anim.play("fall")
	else:
		anim.play("idle")

func attack() -> void:
	is_attacking = true
	attackbox.monitoring = true
	anim.play("attack")
	await anim.animation_finished
	attackbox.monitoring = false
	is_attacking = false

func take_damage() -> void:
	health -= 1
	anim.play("hit")
	if health <= 0:
		die()

func die() -> void:
	anim.play("death")
	set_physics_process(false)
	await anim.animation_finished
	GameManager.reset_keys()
	get_tree().change_scene_to_file("res://level1.tscn")
	health = 3

func _on_attack_box_body_entered(body: CharacterBody2D) -> void:
	if is_attacking and body.is_in_group("enemy"):
		body.take_damage()
