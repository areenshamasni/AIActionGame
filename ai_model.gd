extends Node2D  # أو extends Control حسب هيكل النود عندك

@onready var tooltip: Label = $AiLabel
@onready var nobodywho_chat = $NobodyWhoChat  # مسار النود NobodyWhoChat تحت نفس النود

func _ready():
	tooltip.visible = false
	nobodywho_chat.response_finished.connect(_on_response_finished)
	

	# في البداية أرسل تلميح بناء على عدد المفاتيح الحالي (إذا تريد)
	var game_manager = get_node("/root/GameManager")
	if game_manager:
		update_hint(game_manager.keys_collected, game_manager.total_keys)

# دالة لتحديث التلميح، تستدعى من GameManager
func update_hint(current_keys: int, total_keys: int) -> void:
	tooltip.text = ""  # مسح النص القديم فوراً
	tooltip.visible = false  # اخفاء حتى يظهر النص الجديد

	var prompt = "You are a prisoner NPC. The player has collected %d out of %d keys. Give a short, encouraging hint to help the player escape." % [current_keys, total_keys]
	nobodywho_chat.say(prompt)


func _on_response_finished(response: String) -> void:
	print("Received LLM response: ", response)
	tooltip.text = response
	tooltip.visible = true
