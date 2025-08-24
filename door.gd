extends Area2D

@export var required_keys: int = 4
@export_file("*.tscn") var next_level


@onready var blocker := $StaticBody2D/CollisionShape2D

func _ready() -> void:
	# At start, door should NOT block so player can enter the trigger
	blocker.disabled = false

func _on_body_entered(body: CharacterBody2D) -> void:
	if GameManager.keys_collected >= required_keys:
		print("Door unlocked!")
		blocker.disabled = true  # keep unblocked
		call_deferred("_change_scene")
		GameManager.reset_keys()
	else:
		print("You need %d keys!" % required_keys)
		blocker.disabled = false  # block player until they leave

func _change_scene() -> void:
	if next_level != "":
		get_tree().change_scene_to_file(next_level)
