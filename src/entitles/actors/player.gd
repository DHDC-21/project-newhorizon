extends Node2D


var character_scene
var character_instance

var cam:= Camera2D.new()


func _ready() -> void:
	match GameManager.player_character:
		GameManager.CHARACTERS.orc:
			print("Orcs selecionados como Player!")
			character_scene = preload("res://src/entitles/orc/orc.tscn")
			
		GameManager.CHARACTERS.soldier:
			print("Soldiers selecionados como Player!")
			character_scene = preload("res://src/entitles/soldier/soldier.tscn")
		
		_:
			return print("ERRRO! Nenhum personagem foi selecionado!")
	
	# Instanciando o personagem e a câmera ao player
	character_instance = character_scene.instantiate()
	add_child(character_instance)
	character_instance.add_child(cam)
	
	# Ajustantando as colisões do personagemn
	character_instance.set_collision_layer_value(2, true) #PlayerBase
	character_instance.set_collision_mask_value(1, true) #Terrain
	character_instance.set_collision_mask_value(3, true) #EnemyBase
	
	character_instance._char_hitbox.set_collision_layer_value(6, true) #PlayerHitbox
	character_instance._char_hitbox.set_collision_mask_value(7, true) #EnemyAttack
	character_instance._char_hitbox.set_collision_mask_value(8, true) #projectiles
	
	character_instance._char_attack_range.set_collision_layer_value(6, true) #PlayerAttack
	character_instance._char_attack_range.set_collision_mask_value(5, true) #EnemyHitbox

	
func _physics_process(_delta: float) -> void:
	if character_instance:
		var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
		if direction:
			#print("Player move to ", direction)
			character_instance.move(direction)
		else:
			character_instance.does_not_move()
		
		if Input.is_action_just_pressed("normal_attack"):
			#print("Player use normal attack!")
			character_instance.attack("normal_attack")
			
		if Input.is_action_just_pressed("special_attack"):
			#print("Player use special attack!")
			character_instance.attack("special_attack")
			
		if Input.is_action_just_pressed("jump"):
			print("Player is jumping!")
