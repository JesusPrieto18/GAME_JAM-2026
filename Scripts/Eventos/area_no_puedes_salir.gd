extends Area2D

var dialogo_mama_bloqueo = {"name": "Mamá", "text": ["A dónde vas??? Hoy no puedes salir."]}


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Jugador"):
		bloquear_salida()

func bloquear_salida():
	# Buscamos la caja de diálogo
	var caja_dialogo = get_tree().root.find_child("DialogueBox", true, false)
	
	if caja_dialogo:
		# Pasamos el diálogo de bloqueo
		caja_dialogo.start_dialogue(dialogo_mama_bloqueo["name"], dialogo_mama_bloqueo["text"])
		print("Salida bloqueada por la mamá")
