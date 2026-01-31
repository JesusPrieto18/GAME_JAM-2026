extends StaticBody2D

@export var list_of_button : Array[Area2D]

var actual_buttoms_pressed: int = 0
var quantity_needed: int = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	quantity_needed = list_of_button.size()
	
	for buttom in list_of_button:
		if not buttom.press_button.is_connected(update_door):
			buttom.press_button.connect(update_door)

func update_door(state:bool):
	if state:
		actual_buttoms_pressed += 1
	else:
		actual_buttoms_pressed -= 1
	check_door()
	
func check_door():
	if actual_buttoms_pressed >= quantity_needed:
		open_door()
	else:
		pass
		
func open_door():
	queue_free()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
