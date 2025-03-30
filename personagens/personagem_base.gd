extends CharacterBody2D
class_name PersonagemBase

@export_category("Variaveis")
@export var hp: int = 100
@export var move_speed: float = 25
@export var damege: float = 10
@export var def: int = 5

var _is_attacking: bool
var _direction: Vector2

@export_category("Componentes")
@export var animated_sprite: AnimatedSprite2D
@export var collision_body: CollisionShape2D
@export var collision_attack: CollisionShape2D
