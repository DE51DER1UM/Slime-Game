extends CanvasLayer

func _process(_delta) -> void:
	if Gamemanager.score > Gamemanager.highscore:
		Gamemanager.highscore = Gamemanager.score
	%ScoreLabel.text = "Score: " + str(Gamemanager.score)
	%HighScoreLabel.text = "Highscore: " + str(Gamemanager.highscore)

func _on_button_pressed() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()
	Gamemanager.score = 0
	Gamemanager.coins = 0
	Gamemanager.health = 100.0
	Gamemanager.maxhealth = 100.0
	Gamemanager.speed = 600.0
	Gamemanager.gun_damage = 1
	hide()
