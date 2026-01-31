extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Player": 
		# Accedemos al cuadro de diálogo y llamamos a su función
		$CanvasLayer/DialogueBox.start_scene_dialogues(0)
	else:
		print("Print malvada sea")
		print("Ha entrado: ", body.name)
		
		# Desconectamos o borramos el área para que no se repita el diálogo
#w		$Area2D.queue_free()
