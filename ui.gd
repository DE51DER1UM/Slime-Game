extends CanvasLayer

func _process(_delta) -> void:
	%CoinsValue.text = "Coins: " + str(Gamemanager.coins)
	%ProgressBar.value = Gamemanager.health
	%ScoreValue.text = "Score: " + str(Gamemanager.score)
