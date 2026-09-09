extends Area2D


func _physics_process(delta):
	look_at(get_global_mouse_position())
		
		
func shoot():
	const BULLET = preload("res://bullet.tscn")
	var new_bullet = BULLET.instantiate()
	new_bullet.global_position = %ShootingPoint.global_position
	new_bullet.global_rotation = %ShootingPoint.global_rotation
	%ShootingPoint.add_child(new_bullet)
	
	
	const FLASH_SCENE = preload("res://pistol/muzzle_flash/muzzle_flash.tscn")
	var flash = FLASH_SCENE.instantiate()
	get_parent().add_child(flash)
	flash.global_position = new_bullet.global_position
	flash.global_rotation = new_bullet.global_rotation


func _on_timer_timeout() -> void:
	shoot()
