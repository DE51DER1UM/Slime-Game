extends CanvasLayer

func _process(delta) -> void:
	%CoinsValue.text = "Coins: " + str(Gamemanager.coins)
	%ProgressBar.value = Gamemanager.health
