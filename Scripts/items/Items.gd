extends Area2D

# Variable exportada para arrastrar el archivo .tres que creamos en el Paso 1
@export var item_data : ItemData 
@onready var sprite = $Sprite2D
@onready var jugador = $"../Jugador"

var jugador_en_rango: bool = false

func _ready():
	# Al iniciar, que el sprite del mundo sea el mismo que el del inventario
	if item_data:
		sprite.texture = item_data.icono
	#GameManager.
func _on_body_entered(body):
	print(body.name)
	# Verificamos si quien chocó es el jugador
	if body.is_in_group("Jugador"):
		jugador_en_rango = true
		
func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("Jugador"):
		jugador_en_rango = false
		
func _input(event: InputEvent) -> void:
	if jugador_en_rango and event.is_action_pressed("Action"):
		if item_data.nombre == "Pote" and not GameManager.arepa:
			print("usando pote")
			GameManager.give_object.emit()
		if get_node("../Jugador").recoger_item(item_data):
			if item_data.nombre == "Agua":
				GameManager.agua = true
			elif item_data.nombre  == "Harina":
				GameManager.harina = true
			elif item_data.nombre  == "Queso":
				GameManager.queso = true
			queue_free()
