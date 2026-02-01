extends Control

@export var container_test: Array[ItemData]
signal item_select()

var position_container = {
	0: Vector2(43.5, 19.5),
	1: Vector2(81.5, 19.5),
	2: Vector2(119.5, 19.5),
	3: Vector2(157.5, 19.5),
	4: Vector2(195.5, 19.5)
}

@onready var select = $MarginContainer/MarginContainer/AnimatedSprite2D
@onready var grid = $MarginContainer/MarginContainer/HBoxContainer
var slot_select: int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in range(container_test.size()):
		add_object(container_test[i])
	
	select.position = position_container.get(slot_select)
	select.play("default")

func _input(event: InputEvent) -> void:
# Detectar teclas del 1 al 9 para seleccionar
	if event is InputEventKey and event.pressed:
		if event.keycode >= KEY_1 and event.keycode <= KEY_5:
		# Convertimos la tecla 1 (código 49) a índice 0
			change_slot(event.keycode - KEY_1)
	if event.is_action_pressed("Item"):
		used_slot()
		
func change_slot(nuevo_indice):
	# Asegurarnos de que el índice no se salga de 0 a 8 (Loop)
	if nuevo_indice > 5: 
		nuevo_indice = 0
	if nuevo_indice < 0: 
		nuevo_indice = 5 
		
	slot_select = nuevo_indice
	select.position = position_container.get(slot_select)

func add_object(item: ItemData) -> bool:
	for i in range(GameManager.container.size()):
		if GameManager.container[i] == null:
			GameManager.container[i] = item
			update_slot(i, item)
			return true
			
	return false
	
func update_slot(i: int, item: ItemData):
	var slot = grid.get_child(i)
	print(slot.get_node("MarginContainer/TextureRect").name)
	var slot_texture = slot.get_child(0).get_node("TextureRect")
	#print(slot_texture.texture.resource_path)
	slot.name = item.nombre
	slot_texture.texture = item.icono
	slot_texture.visible = true
	pass
	
func used_slot():
	var slot = grid.get_child(slot_select)
	GameManager.used_item.emit(slot.name)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
