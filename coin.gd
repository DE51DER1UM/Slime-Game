extends Area2D

func _on_coin_collision_body_entered(_body: Node2D) -> void:
	Gamemanager.coins = Gamemanager.coins + 1
	queue_free()
