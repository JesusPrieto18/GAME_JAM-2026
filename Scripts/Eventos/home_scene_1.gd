extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


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
		# Desconectamos o borramos el área para que no se repita el diálogo
		$EscenaTukekePideAyuda.queue_free()
