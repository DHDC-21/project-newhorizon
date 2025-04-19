extends Node2D
class_name BaseCharacter


@export_category("Character Stats")
@export var _level: int = 1

@export var _hp: int = 100
@export var _def: int = 50

@export var _move_speed: float = 25
@export var _jump_force: float = 25

@export_category("Resources")
@export var _char_animation: AnimatedSprite2D
@export var _char_body: CollisionShape2D
@export var _char_base: CollisionShape2D
#@export var _char_area_attack: CollisionShape2D

#func _ready() -> void:
	#_char_animation = $CharAnimation
	#_char_body = $CharBody
	#_char_base = $CharBase
	#_char_area_attack = $CharAreaAttack
	
