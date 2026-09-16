extends CanvasLayer

func _process(_delta) -> void:
	%ScoreLabel.text = "Score: " + str(Gamemanager.score)

func _on_button_pressed() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()
	Gamemanager.score = 0
	Gamemanager.coins = 0
	Gamemanager.total_coins = 0
	Gamemanager.health = 100.0
	hide()
