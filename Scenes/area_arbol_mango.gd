extends Area2D

var jugador_cerca = false
var dialogo = {"name": GameManager.name_player, "text": [ "<----- PACK!! ALGO TE CAYÓ EN LA CABEZA ----->",
												"<----- HAS OBTENIDO LA MANGO_MASK ----->",
												"<----- Parece que MANGO_MASK te hace más fuerte ----->",
												"<----- Selecciona MANGO_MASK y usa Q para usarla! ----->",
												]}
												
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Jugador"):
		jugador_cerca = true

func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("Jugador"):
		jugador_cerca = false

func _input(event):
	# Si presiona E, está cerca y no la ha agarrado ya
	if event.is_action_pressed("Action") and jugador_cerca and not GameManager.mascara_mango_obtenida:
		print("Se tocó el arbol")
		obtener_mascara()
	
func obtener_mascara():
	GameManager.mascara_mango_obtenida = true
		
	# Llamamos a la caja de diálogo
	var caja = get_tree().root.find_child("DialogueBox", true, false)
	
	if caja:
		caja.start_dialogue(dialogo["name"], dialogo["text"])
		
		# Esperamos a que termine el diálogo 
		await caja.end_dialogue_signal
	
	GameManager.actualizar_ayuda.emit("¡Tienes la máscara! Busca la forma de ir al Dorum a por la otra.")
	
	## 5. Eliminamos la colisión/interacción
	#desactivar_interaccion()
#
#func desactivar_interaccion():
	## Desactivamos el monitoreo para que no detecte más al jugador
	#monitoring = false
	#monitorable = false
	## Opcional: Si quieres que el objeto desaparezca visualmente
	## queue_free() 
	#print("Evento de máscara completado y colisión eliminada.")


func _on_body_shape_exited(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	pass # Replace with function body.
