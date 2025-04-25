extends CharacterBody2D
class_name BaseCharacter


@export_category("Character Stats:")
@export var level: int = 1
@export var exp_to_level_up: int = 100
var _exp: int = 0

@export var max_hp: int = 100
var _hp: int

@export var atk: int = 15
@export var def: int = 10

@export var max_mp: int = 20
var _mp: int

@export var move_speed: float = 50
@export var jump_force: float = 25

var _is_jumping:= false as bool
var _is_attacking:= false as bool

@export_category("Character Resources:")
@onready var _char_animation: AnimatedSprite2D = $CharAnimation
@onready var _char_base: CollisionShape2D = $CharBase
@onready var _char_hitbox: Area2D = $CharHitbox
@onready var _char_attack_range: Area2D = $CharAttackRange


func _ready() -> void:
	_hp = max_hp
	_mp = max_mp


func move(direction: Vector2) -> void:
	if _is_attacking == true:
		return

	if direction != Vector2.ZERO:
		velocity = direction.normalized() * move_speed
		
		if direction.x < 0:
			_char_animation.flip_h = true
			_char_attack_range.position.x = -15
			
		elif direction.x > 0:
			_char_animation.flip_h = false
			_char_attack_range.position.x = 15

		_char_animation.play("walk")

	else:
		_char_animation.play("idle")
		
	move_and_slide()
	
func does_not_move() -> void:
	_char_animation.play("idle")


var _suffix: String

func _attack() -> void:
	_char_animation.play("attack" + _suffix)
	_is_attacking = true

func normal_attack() -> void:
	if _is_attacking == true:
		return
	
	if _suffix == "_01":
		_suffix = "_02"
		 
	else:
		_suffix = "_01"
	
	_char_attack_range.get_child(0).set_disabled(false)
	_attack()
	
func special_attack() -> void:
	if _is_attacking == true:
		return
	
	
func _on_animation_finished() -> void:
	#print("Uma animação terminou!")
	if  _char_animation.animation.contains("attack"):
		_is_attacking = false
		_char_attack_range.get_child(0).set_disabled(true)
		#print("Terminou a animação de ataque!")
