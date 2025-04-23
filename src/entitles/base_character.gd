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
	if direction != Vector2.ZERO:
		velocity = direction.normalized() * move_speed
		
		if direction.x < 0:
			_char_animation.flip_h = true
			_char_attack_range.position.x = -15
			
		if direction.x > 0:
			_char_animation.flip_h = false
			_char_attack_range.position.x = 15

		if _is_attacking == true:
			return
			
		_char_animation.play("walk")
		
	move_and_slide()
	
func does_not_move() -> void:
	_char_animation.play("idle")


func attack(_type_attack: String) -> void:
	pass


func _on_animation_finished() -> void:
	print("Uma animação terminou!")
	if  _char_animation.animation.contains("attack"):
		print("Terminou a animação de ataque!")
		_is_attacking = false
		_char_attack_range.get_child(0).set_disabled(true)
