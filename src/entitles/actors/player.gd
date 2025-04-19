extends CharacterBody2D

var character_scene
var character_instance

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
			
	character_instance = character_scene.instantiate()
	add_child(character_instance)
	
func _physics_process(delta: float) -> void:
	var _direction = Vector2.ZERO
	
	if Input.is_action_pressed("ui_up") or Input.is_action_pressed("move_up"):
		_direction.y -= 1
	
	if Input.is_action_pressed("ui_left") or Input.is_action_pressed("move_left"):
		_direction.x -= 1
		character_instance._char_animation.set_flip_h(true)

	if Input.is_action_pressed("ui_down") or Input.is_action_pressed("move_down"):
		_direction.y += 1
		
	if Input.is_action_pressed("ui_right") or Input.is_action_pressed("move_right"):
		_direction.x += 1
		character_instance._char_animation.set_flip_h(false)
	
	if _direction != Vector2.ZERO:
		_direction = _direction.normalized() * character_instance._move_speed
		character_instance._char_animation.play("walk")
	else:
		character_instance._char_animation.play("idle")
	
	velocity = _direction
	move_and_slide()
	
