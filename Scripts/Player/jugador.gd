extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func recoger_item(item_data):
	print("recogiendo")
	if item_data.nombre == "Pote":
		return false
	var se_pudo_guardar = get_tree().get_first_node_in_group("Inventario")
	print(se_pudo_guardar.name)
	if se_pudo_guardar:
		var guardo = se_pudo_guardar.add_object(item_data)
		if guardo:	
			return true # Elimina este objeto del mundo
		else:
			return false
