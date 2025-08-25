extends Area2D

var touching_player: Node = null
var timer: float = 0.0
const RESET_DELAY := 1.0

func _process(delta: float) -> void:
	if touching_player:
		timer += delta
		if timer >= RESET_DELAY:
			if touching_player.has_method("die"):
				touching_player.die()
			touching_player = null
			timer = 0.0

func _on_body_entered(body: Node) -> void:
	if body.is_in_group("player"):
		touching_player = body
		timer = 0.0

func _on_body_exited(body: Node) -> void:
	if body == touching_player:
		touching_player = null
		timer = 0.0
