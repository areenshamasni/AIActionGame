extends Area2D

@onready var animation_player= $AnimationPlayer

func _on_body_entered(body: CharacterBody2D) -> void:
	GameManager.add_key()
	animation_player.play("pickup")
