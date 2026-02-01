extends Area2D

###########################################################

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#pass
###########################################################

var jugador_cerca = false
signal llave_cerrada 

var cerrar_llave_dialogo = {
								"name": GameManager.name_player, 
								"text": ["Si cierro la llave de paso...",
										 "Esto deberia bastar para que mamá salga de la cocina..."]
							}

func _input(event):
	# Si presionamos E y el jugador está dentro del área
	if event.is_action_pressed("Action") and jugador_cerca:
		cerrarLlave()

func cerrarLlave():
	# Cambiamos la variable en el GameManager (Global)
	GameManager.puzzle1.llaveCerrada = true
	GameManager.puzzle1.help_dialog = "Ve a hablar con el tuqueque!"
	
	print("El niñe logró cerra la llave!!!")
	emit_signal("llave_cerrada")
	
	# 2. Buscamos el cuadro de diálogo y le pasamos nuestra escena de diálogo
	# (Ajusta la ruta según donde tengas tu DialogueBox)
	var caja_dialogo = get_tree().root.find_child("DialogueBox", true, false)
	
	if caja_dialogo:
		caja_dialogo.start_dialogue(cerrar_llave_dialogo["name"], cerrar_llave_dialogo["text"])
	
	# Opcional: Desactivar este objeto para que no se pueda repetir
	# queue_free() # Si quieres que el objeto desaparezca
	# set_process_input(false) # Si solo quieres que no se pueda volver a tocar


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Jugador"):
		jugador_cerca = true


func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("Jugador"):
		jugador_cerca = false
