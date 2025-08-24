extends Node

var keys_collected: int = 0
var total_keys: int = 4
var keys_label: Label = null

var prisoner = null  # فقط عرف المتغير، لا تستخدم get_node هنا مباشرة

func _ready():
	# استدعاء get_node_or_null عندما يكون المشهد جاهز
	prisoner = get_node_or_null("/root/Level2/Node2D")
	
func add_key() -> void:
	keys_collected += 1
	_update_label()
	if prisoner:
		prisoner.update_hint(keys_collected, total_keys)

func reset_keys() -> void:
	keys_collected = 0
	_update_label()
	if prisoner:
		prisoner.update_hint(keys_collected, total_keys)

func register_label(label: Label) -> void:
	keys_label = label
	_update_label()

func _update_label() -> void:
	if keys_label:
		keys_label.text = "Keys: %d / %d" % [keys_collected, total_keys]
