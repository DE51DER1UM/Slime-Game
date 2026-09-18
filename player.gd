extends CharacterBody2D

signal health_depleted

func _physics_process(delta):
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * Gamemanager.speed
	move_and_slide()
	
	if velocity.length() > 0.0:
		$HappyBoo.play_walk_animation()
	else:
		$HappyBoo.play_idle_animation()

	const DAMAGE_RATE = 5.0
	var overlapping_mobs = %HurtBox.get_overlapping_bodies()
	if overlapping_mobs.size() > 0:
		Gamemanager.health -= DAMAGE_RATE * overlapping_mobs.size() * delta
		if Gamemanager.health <= 0.0:
			health_depleted.emit()
			visible = false
