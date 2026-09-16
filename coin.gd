extends Area2D

func _on_coin_collision_body_entered(body: Node2D) -> void:
	Gamemanager.coins = Gamemanager.coins + 1
	print_debug("Coins: ", Gamemanager.coins)
	queue_free()
