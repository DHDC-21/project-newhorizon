extends Control


func _on_btn_select_orc_pressed() -> void:
	GameManager.player_character = GameManager.CHARACTERS.orc
	load_level()

func _on_btn_select_soldier_pressed() -> void:
	GameManager.player_character = GameManager.CHARACTERS.soldier
	load_level()
	
func load_level() -> void:
	get_tree().change_scene_to_file("res://src/maps/level_01.tscn")
