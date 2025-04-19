extends Node


@onready var player_spawn = get_node("PlayerSpawn")
var player_scene = preload("res://src/entitles/actors/player.tscn")


func _ready() -> void:
	var player_intance = player_scene.instantiate()
	player_intance.global_position = player_spawn.global_position
	add_child(player_intance)
