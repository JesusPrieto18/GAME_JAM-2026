extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#pass


func _on_btn_play_pressed() -> void:
	
	# Reproduce el sonido
	$BtnSound.play()
	
	# Espera un poco para que se vea la animacion y se escuche el sonido
	await get_tree().create_timer(0.15).timeout
	# Cambiar de escena para jugar 
	get_tree().change_scene_to_file("res://Scenes/HomeScene1.tscn")

func _on_btn_options_pressed() -> void:
	# Reproduce el sonido
	$BtnSound.play()
	
	# Espera un poco para que se vea la animacion y se escuche el sonido
	await get_tree().create_timer(0.15).timeout
	
	# Cambiar de escena para ver las opciones 
	get_tree().change_scene_to_file("res://Scenes/Options.tscn")
	
func _on_btn_exit_pressed() -> void:
	# Reproduce el sonido
	$BtnSound.play()
	
	# Espera un poco para que se vea la animacion y se escuche el sonido
	await get_tree().create_timer(0.15).timeout
	
	# Sale del juego
	get_tree().quit()
