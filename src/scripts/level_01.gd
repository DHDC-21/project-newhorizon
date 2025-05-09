extends Node


@onready var player_spawn = get_node("PlayerSpawn")
var player_scene = preload("res://src/actors/player.tscn")

@onready var enemy_spawn = get_node("EnemySpawn")
var enemy_scene = preload("res://src/actors/enemy.tscn")

func _ready() -> void:
	var player_instance = player_scene.instantiate()
	player_instance.global_position = player_spawn.global_position
	add_child(player_instance)

	var enemy_instance = enemy_scene.instantiate()
	enemy_instance.global_position = enemy_spawn.global_position
	add_child(enemy_instance)
