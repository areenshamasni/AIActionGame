extends Node2D

@onready var tooltip: Label = $AiLabel
@onready var nobodywho_chat = $NobodyWhoChat

func _ready():
	tooltip.visible = false
	nobodywho_chat.response_finished.connect(_on_response_finished)
	ask_for_hint()

func ask_for_hint() -> void:
	tooltip.text = ""
	tooltip.visible = false

	var prompt = "You are a prisoner NPC. Give a short, encouraging message to the player. Maximum 12 words."
	nobodywho_chat.say(prompt)

func _on_response_finished(response: String) -> void:
	var short := _truncate_to_words(response, 12)
	tooltip.text = short
	tooltip.visible = true

func _truncate_to_words(text: String, max_words: int) -> String:
	var parts := []
	for w in text.strip_edges().split(" "):
		if w == "":
			continue
		parts.append(w)
		if parts.size() >= max_words:
			break
	var out := " ".join(parts)
	if text.strip_edges().split(" ").size() > max_words:
		out += "…"
	return out
