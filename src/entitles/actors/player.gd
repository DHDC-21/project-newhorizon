extends CharacterBody2D
class_name Player

@export_category("Variables")
@export var _move_speed: float = 64.0
@export var _friction: float = 0.8
@export var _acceleration: float = 0.4

@export_category("Configuration")
@export var animation : AnimatedSprite2D

func _physics_process(_delta: float) -> void:
	_move()
	move_and_slide()
	
func _move() -> void:
	var _direction: Vector2 = Vector2(
		Input.get_axis("move_left","move_right"),
		Input.get_axis("move_up","move_down")
	)
	
	if _direction.normalized().x < 0:
		animation.offset
		
	if _direction != Vector2.ZERO:
			
		velocity.x = lerp(velocity.x, _direction.normalized().x * _move_speed, _acceleration)
		velocity.y = lerp(velocity.y, _direction.normalized().y * _move_speed, _acceleration)
		
		$AnimatedSprite2D.play("walk")
		
		return
	else:	
		velocity.x = lerp(velocity.x, _direction.normalized().x * _move_speed, _friction)
		velocity.y = lerp(velocity.y, _direction.normalized().y * _move_speed, _friction)
		$AnimatedSprite2D.play("idle")
