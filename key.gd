extends Area2D

func _ready() -> void:
	connect("body_entered", Callable(self, "_on_body_entered"))

func _on_body_entered(body: CharacterBody2D) -> void:
	GameManager.add_key()

	queue_free()
