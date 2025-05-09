extends CharacterBody2D
class_name BaseCharacter


@export_category("Character Stats:")
@export var level: int = 1
@export var exp_to_level_up: int = 100
var _exp: int = 0

@export var max_hp: int = 100
var _hp: int

@export var max_mp: int = 20
var _mp: int

@export var atk: int = 15
@export var attack_cooldown: float = 0.5
@export var special_attack_cooldown: float = 1.5
@export var def: int = 10

@export var move_speed: float = 50
@export var jump_force: float = 25

# Variáveis de estado:
var _is_jumping: bool = false
var _is_attacking: bool = false
var _is_hurt: bool = false
var _is_death: bool = false
var _suffix: String

@export_category("Character Resources:")
@onready var _char_animation: AnimatedSprite2D = $CharAnimation
@onready var _char_base: CollisionShape2D = $CharBase
@onready var _char_hitbox: Area2D = $CharHitbox
@onready var _char_attack_range: Area2D = $CharAttackRange
@onready var _attack_cooldown_timer: Timer = $CharAttackRange/AttackCooldownTimer
@onready var _special_cooldown_timer: Timer = $CharAttackRange/SpecialCooldownTimer


func _ready() -> void:
	_hp = max_hp
	_mp = max_mp
	_attack_cooldown_timer.wait_time = attack_cooldown

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
		does_not_move()
		
	move_and_slide()
	
func does_not_move() -> void:
	_char_animation.play("idle")



func _attack(_suffix: String) -> void:
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
	_attack(_suffix)
	
func special_attack() -> void:
	return
	
	
func _on_animation_finished() -> void:
	#print("Uma animação terminou!")
	if  _char_animation.animation.contains("attack"):
		_is_attacking = false
		#print("Terminou a animação de ataque!")
		_char_attack_range.get_child(0).set_disabled(true)

	match _char_animation.animation:
		"hurt":
			_is_hurt = false
		"death":
			self.queue_free()

func _on_char_attack_range_body_entered(body: Node2D) -> void:
	if body != self:
		print(self.name, " attack ", body.name, "!")
		body._on_hit(atk)

func _on_hit(damege_received: int) -> void:
	if _hp > damege_received:
		_char_animation.play("hurt")
		#_hp -= damage_received
		_is_hurt = true
		print(self, "hurt is true")
	
	if _hp <= damege_received:
		_char_animation.play("death")
		_is_death = true
