extends CanvasLayer

var health_cost = 1
var gunup_cost = 1
var speedup_cost = 1
var healthup_cost = 1

var health_add = 20
var gunup_add = 1
var speedup_add = 50
var healthup_add = 20

var heals_track = 0
var gun_track = 0
var speed_track = 0
var health_track = 0

func _ready() -> void:
	%HealthBuy.disabled = true
	%GunUpgradeBuy.disabled = true
	%SpeedUpgradeBuy.disabled = true
	%HealthUpgradeBuy.disabled = true


func _process(_delta: float) -> void:
	if Gamemanager.coins >= health_cost and Gamemanager.health < Gamemanager.maxhealth and heals_track <= 10:
		%HealthBuy.disabled = false
	else:
		%HealthBuy.disabled = true

	if Gamemanager.coins >= gunup_cost and gun_track <= 2:
		%GunUpgradeBuy.disabled = false
	else:
		%GunUpgradeBuy.disabled = true

	if Gamemanager.coins >= speedup_cost and speed_track <= 3:
		%SpeedUpgradeBuy.disabled = false
	else:
		%SpeedUpgradeBuy.disabled = true

	if Gamemanager.coins >= healthup_cost and health_track <= 3:
		%HealthUpgradeBuy.disabled = false
	else:
		%HealthUpgradeBuy.disabled = true

	if heals_track >= 10:
		%HealthBuy.text = "SOLD OUT"
	if gun_track >= 2:
		%GunUpgradeBuy.text = "SOLD OUT"
	if speed_track >= 3:
		%SpeedUpgradeBuy.text = "SOLD OUT"
	if health_track >= 3:
		%HealthUpgradeBuy.text = "SOLD OUT"


func _on_health_buy_pressed() -> void:
	Gamemanager.coins = Gamemanager.coins - health_cost
	Gamemanager.health = Gamemanager.health + health_add
	heals_track = heals_track + 1


func _on_gun_upgrade_buy_pressed() -> void:
	Gamemanager.coins = Gamemanager.coins - gunup_cost
	Gamemanager.gun_damage = Gamemanager.gun_damage + gunup_add
	gun_track = gun_track + 1


func _on_speed_upgrade_buy_pressed() -> void:
	Gamemanager.coins = Gamemanager.coins - speedup_cost
	Gamemanager.speed = Gamemanager.speed + speedup_add
	speed_track = speed_track + 1


func _on_health_upgrade_buy_pressed() -> void:
	Gamemanager.coins = Gamemanager.coins - healthup_cost
	Gamemanager.maxhealth = Gamemanager.maxhealth + healthup_add
	health_track = health_track + 1
