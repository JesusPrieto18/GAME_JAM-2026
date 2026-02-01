extends Area2D


## Called when the node enters the scene tree for the first time.
#func _ready() -> void:
	#pass # Replace with function body.
#
#
## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#pass

var jugador_cerca = false

func _input(event):
	if event.is_action_pressed("Action") and jugador_cerca:
		# Verificamos ambas condiciones usando 'and'
		if !GameManager.tuqueque_free and GameManager.puzzle1["llaveCerrada"] and GameManager.puzzle1["mamaEnElBaño"]:
			GameManager.puzzle1['resolved'] = true
			var sprite_a_borrar = get_tree().current_scene.find_child("Sarten", true, false)
	
			if sprite_a_borrar:
				sprite_a_borrar.queue_free() # Borra el nodo de forma segura al final del frame
			if !GameManager.escena_2_salvaste_al_tukeke:
				GameManager.escena_2_salvaste_al_tukeke = true
				iniciar_dialogo_tuqueque()
				

				
		else:
			# Mensaje opcional si el jugador intenta hablarle antes de tiempo
			print("El Tuqueque parece estar durmiendo...")

func iniciar_dialogo_tuqueque():
	var caja_dialogo = get_tree().root.find_child("DialogueBox", true, false)
	if caja_dialogo:
		caja_dialogo.start_scene_dialogues(2) 
		await caja_dialogo.end_scene_signal
		GameManager.actualizar_ayuda.emit("Busca MangoMask en el patio")
		GameManager.tuqueque_free = true
		GameManager.tuqueque_aun_no_ta_la_mascara = false



func _on_body_entered(body: Node2D) -> void:
	# Verificamos si lo que entró es el jugador
	if body.is_in_group("Jugador"): 
		jugador_cerca = true
		print("El jugador está cerca del Tuqueque")
