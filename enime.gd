extends CharacterBody2D

const SPEED := 80.0
@export var move_distance := 30.0
@export var attack_cooldown := 0.6

var left_limit: float
var right_limit: float
var moving_right := true
var health := 2
var is_attacking := false
var can_attack := true
var player_in_range: CharacterBody2D = null

@onready var anim := $AnimatedSprite2D
@onready var hitbox := $HitBox

func _ready() -> void:
	left_limit = global_position.x - move_distance
	right_limit = global_position.x + move_distance
	if not is_in_group("enemy"):
		add_to_group("enemy")

func _physics_process(_delta: float) -> void:
	if is_attacking or health <= 0:
		return

	if moving_right:
		velocity.x = SPEED
		if global_position.x >= right_limit:
			moving_right = false
	else:
		velocity.x = -SPEED
		if global_position.x <= left_limit:
			moving_right = true

	anim.flip_h = velocity.x < 0
	move_and_slide()
	anim.play("idle")

	if player_in_range != null and can_attack and not is_attacking:
		attack(player_in_range)

func take_damage() -> void:
	if health <= 0:
		return
	health -= 1
	anim.play("hit")
	if health <= 0:
		die()

func die() -> void:
	anim.play("death")
	await anim.animation_finished
	queue_free()

func attack(player: Node) -> void:
	if is_attacking or health <= 0:
		return

	is_attacking = true
	can_attack = false
	anim.play("attack")

	if player.has_method("take_damage") and player.health > 0:
		player.take_damage()

	await anim.animation_finished
	is_attacking = false
	await get_tree().create_timer(attack_cooldown).timeout
	can_attack = true

func _on_hit_box_body_entered(body: CharacterBody2D) -> void:
	if body.is_in_group("player"):
		player_in_range = body
		if body.is_attacking:
			take_damage()
		elif can_attack:
			attack(body)

func _on_hit_box_body_exited(body: CharacterBody2D) -> void:
	if body == player_in_range:
		player_in_range = null
