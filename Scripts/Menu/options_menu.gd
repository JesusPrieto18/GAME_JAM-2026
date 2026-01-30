extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_btn_atras_pressed() -> void:
	# Reproduce el sonido
	$BtnSound.play()
	
	# Espera un poco para que se vea la animacion y se escuche el sonido
	await get_tree().create_timer(0.15).timeout
	
	# Cambiar de escena para ver las opciones 
	get_tree().change_scene_to_file("res://Scenes/Menu.tscn")


func _on_btn_full_screen_toggled(toggled_on: bool) -> void:
	if toggled_on:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)


func _on_h_slider_value_changed(value: float) -> void:
	# '0' es el bus maestro de audio en Godot
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), value)
