extends Node2D

var character_scene
var character_instance

var player_char

@export var detection_range: float =  200.0
@export var attack_range: float
@export var _attack_cooldown:= 1.5
@export var _attack_timer:= 0.0


func _ready() -> void:
	match  GameManager.player_character:
		GameManager.CHARACTERS.orc:
			# Se o Player escolher o Orc então o inimigo serão os Soldiers
			print("Soldier carregado como Enemy!")
			character_scene = preload("res://src/entitles/soldier/soldier.tscn")
			
		GameManager.CHARACTERS.soldier:
			# Se o Player escolher o Soldier então o iniigo serão os Orcs
			print("Orc carregado como Enemy!")
			character_scene = preload("res://src/entitles/orc/orc.tscn")

		_:
			return print("ERRO! Nenhum personagem carregado como Enemy!")
	
	
	# Instanciando o personagem oposto ao Player como Enemy
	character_instance = character_scene.instantiate()
	add_child(character_instance)
	_set_collisions()
	_set_enemy_attack_range()



func _physics_process(delta: float) -> void:
	if not character_instance or not player_char:
		return
	
	var distance = character_instance.global_position.distance_to(player_char.global_position)
		
	if distance <= attack_range:
		character_instance.normal_attack()

	elif distance <= detection_range:
		var direction = (player_char.global_position - character_instance.global_position).normalized()
		character_instance.move(direction)

	else:
		character_instance.does_not_move()



func _set_enemy_attack_range() -> void:
	# Pegando a área de ataque do personagem instanciado
	var shape = character_instance._char_attack_range.get_child(0).shape
	if shape is CircleShape2D:
		attack_range = shape.radius * 2
		
	elif shape is RectangleShape2D:
		attack_range = shape.extents.length()
		
	# Referenciando o persnagem do Player
	var player_node = get_tree().get_first_node_in_group("PlayerCharacter")
	if player_node:
		player_char = player_node
		#print("player_char: ", player_char)

	else:
		return print("Personagem do Player não encontrado!")

func _set_collisions() -> void:
	# Base character  colissions
	character_instance.set_collision_layer_value(5, true)
	character_instance.set_collision_mask_value(2, true)
	character_instance.set_collision_mask_value(4, true)
	# Hitbox collisions
	character_instance._char_hitbox.set_collision_layer_value(5, true)
	# Range attack collisions
	character_instance._char_attack_range.set_collision_layer_value(5, true)
	character_instance._char_attack_range.set_collision_mask_value(4, true)
