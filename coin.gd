extends Area2D

func _on_coin_collision_body_entered(_body: Node2D) -> void:
	Gamemanager.coins = Gamemanager.coins + 1
	Gamemanager.total_coins = Gamemanager.total_coins + 1
	print_debug("Coins: ", Gamemanager.coins)
	print_debug("Total Coins: ", Gamemanager.coins)
	queue_free()
