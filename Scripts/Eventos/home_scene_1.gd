extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_escena_sin_internet_body_entered(body: Node2D) -> void:
	
	if !GameManager.escena_0_sin_internet_lista and body.name == "Player": 
		# Accedemos al cuadro de diálogo y llamamos a su función
		$CanvasLayerDialogue/DialogueBox.start_scene_dialogues(0)
		GameManager.escena_0_sin_internet_lista = true
		# Desconectamos o borramos el área para que no se repita el diálogo
		$EscenaSinInternet.queue_free()
		
		

func _on_escena_tukeke_pide_ayuda_body_entered(body: Node2D) -> void:
	
	if !GameManager.escena_1_tukeke_pide_ayuda_lista and body.name == "Player": 
		# Accedemos al cuadro de diálogo y llamamos a su función
		$CanvasLayerDialogue/DialogueBox.start_scene_dialogues(1)
		GameManager.escena_1_tukeke_pide_ayuda_lista = true
		GameManager.puzzle1.init = true
		
		# ni idea
		var caja_dialogo = get_tree().root.find_child("DialogueBox", true, false)
		await caja_dialogo.end_scene_signal

		$CanvasLayerHelp/PanelHelp.show_help(GameManager.puzzle1.help_dialog)
		
		# Desconectamos o borramos el área para que no se repita el diálogo
		$EscenaTukekePideAyuda.queue_free()


func _on_button_exit_pressed() -> void:
		# Reproduce el sonido
	$BtnSound.play()
	
	# Espera un poco para que se vea la animacion y se escuche el sonido
	await get_tree().create_timer(0.15).timeout
	
	# Sale del juego
	get_tree().quit()
