extends BaseCharacter

var _suffix: String = "_01"

func attack(_type_attack: String) -> void:
		_is_attacking = true
		
		if _type_attack == "normal_attack":
			_normal_attack()
		if _type_attack == "special_attack":
			_special_attack()
		

func _normal_attack() -> void:
	if _suffix == "_01":
		_suffix = "_02"
		return
	
	if _suffix == "_02":
		_suffix = "_01"
		
	_char_animation.play("attack" + _suffix)
	_char_attack_range.get_child(0).set_disabled(false)

	
func _special_attack() -> void:
	pass
