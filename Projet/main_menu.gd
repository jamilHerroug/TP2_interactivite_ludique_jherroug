extends Control



func _ready():
	pass
	
	
	
func _process(delta):
	pass

func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://world.tscn")


func _on_options_2_pressed() -> void:
	print("Settings pressed")


func _on_exit_3_pressed() -> void:
	get_tree().quit()
