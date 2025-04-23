extends BaseCharacter

var _suffix: String = "_01"

func attack(_type_attack: String) -> void:
	_is_attacking = true
	
	if _type_attack == "normal_attack":
	
		if _suffix == "_02":
			_suffix = "_01"
		
		else:
			_suffix = "_02"
			#return
			
		_char_animation.play("attack" + _suffix)
		_char_attack_range.get_child(0).set_disabled(false)
		
