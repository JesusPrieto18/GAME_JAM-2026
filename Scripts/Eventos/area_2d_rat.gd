extends Area2D

var jugador_cerca = false

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
	# Si  está cerca y no le ha pedido la arepa
	if jugador_cerca and not GameManager.rata_te_pide_arepa:
		print("rata_te_pide_arepa")
		te_piden_arepa()
	
	if jugador_cerca and not GameManager.rata_tiene_arepa:
		print("y la arepa??")
		te_piden_arepa_de_nuevo()
		
func te_piden_arepa():
	GameManager.rata_te_pide_arepa = true
	
	# Llamamos a la caja de diálogo
	var caja = get_tree().root.find_child("DialogueBox", true, false)
	
	if caja:
		caja.start_scene_dialogues(3)
		# Esperamos a que termine el diálogo 
		await caja.end_dialogue_signal
	
	GameManager.actualizar_ayuda.emit("Consigue una arepa para la Rata")

func te_piden_arepa_de_nuevo():
		
	# Llamamos a la caja de diálogo
	var caja = get_tree().root.find_child("DialogueBox", true, false)
	
	var dialogo = {"name": "Rata",  "text": ["Aja Ciudadano, y la arepa???"]}
	
	if caja:
		caja.start_dialogue(dialogo["name"], dialogo["text"])
		
		# Esperamos a que termine el diálogo 
		await caja.end_dialogue_signal
		
