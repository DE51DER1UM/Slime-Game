extends CharacterBody2D

var health = 3

@onready var player = get_node("/root/Game/Player")

func _ready():
	%Slime.play_walk()

func _physics_process(_delta):
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * 300.0
	move_and_slide()

func take_damage():
	health = health - Gamemanager.gun_damage
	%Slime.play_hurt()
	const IMPACT_SCENE = preload("res://pistol/impact/impact.tscn")
	var impact = IMPACT_SCENE.instantiate()
	get_parent().add_child(impact)
	impact.global_position = global_position
	
	if health <= 0:
		%Slime.play_hurt()
		
		queue_free()
		
		smoke_effect()
		
		item_drop()
		
		Gamemanager.score = Gamemanager.score + 1

func smoke_effect():
	const SMOKE_SCENE = preload("res://smoke_explosion/smoke_explosion.tscn")
	var smoke = SMOKE_SCENE.instantiate()
	get_parent().add_child(smoke)
	smoke.global_position = global_position

func item_drop():
	randomize()
	var prob : int = 4
	if (randi() % prob) == (prob - 1):
		const COIN_SCENE = preload("res://coin.tscn")
		var coin = COIN_SCENE.instantiate()
		get_parent().add_child(coin)
		coin.global_position = global_position
	
