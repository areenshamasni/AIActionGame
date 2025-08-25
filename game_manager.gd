extends Node

var keys_collected: int = 0
var total_keys: int = 4
var keys_label: Label = null
var prisoner: Node = null

func _ready() -> void:
	get_tree().node_added.connect(_on_node_added)
	_find_prisoner()

func _on_node_added(node: Node) -> void:
	if node.name == "Node2D" and node.get_parent() and node.get_parent().name == "Level2":
		prisoner = node

func _find_prisoner() -> void:
	prisoner = get_tree().current_scene.find_child("Node2D", true, false)

func add_key() -> void:
	keys_collected += 1
	_update_label()

	if prisoner and prisoner.has_method("ask_for_hint"):
		prisoner.ask_for_hint()

func reset_keys() -> void:
	keys_collected = 0
	_update_label()

	if prisoner and prisoner.has_method("ask_for_hint"):
		prisoner.ask_for_hint()

func register_label(label: Label) -> void:
	keys_label = label
	_update_label()

func _update_label() -> void:
	if keys_label:
		keys_label.text = "Keys: %d / %d" % [keys_collected, total_keys]
