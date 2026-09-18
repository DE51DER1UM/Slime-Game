extends CanvasLayer

var health_upgrade = StyleBoxFlat.new()

func _ready():
	health_upgrade.bg_color = Color("51b5f5ff")

func _process(_delta) -> void:
	%CoinsValue.text = "Coins: " + str(Gamemanager.coins)
	%ProgressBar.value = Gamemanager.health
	%ScoreValue.text = "Score: " + str(Gamemanager.score)
	%ProgressBar.max_value = Gamemanager.maxhealth
	
	if Gamemanager.maxhealth == 120:
		$ProgressBar.add_theme_stylebox_override("fill", health_upgrade)
	if Gamemanager.maxhealth == 140:
		health_upgrade.bg_color = Color("d786edff")
		$ProgressBar.add_theme_stylebox_override("fill", health_upgrade)
	if Gamemanager.maxhealth == 160:
		health_upgrade.bg_color = Color("8f79ffff")
		$ProgressBar.add_theme_stylebox_override("fill", health_upgrade)
