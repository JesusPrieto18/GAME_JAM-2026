extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_btn_play_pressed() -> void:
	# Cambiar de escena para jugar 
	get_tree().change_scene_to_file("res://Scenes/Game.tscn")

func _on_btn_options_pressed() -> void:
	pass # Replace with function body.
	
func _on_btn_exit_pressed() -> void:
	# Sale del juego
	get_tree().quit()
