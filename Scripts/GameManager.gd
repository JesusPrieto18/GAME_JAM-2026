extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
var name_player = "Simon Bolivar"
var tuqueque_free = false

########### VARIABLES PARA LA LOGICA DE LOS DIALOGOS ##############

var are_dialogues_on = false
var dialogues = {
	"scene1": {
		"boy1": [
			"Al fin logré recolectar un millón de oro en RuneScape!", 
			"Aja, como era la vaina para vender esto...  ",
			"Por qué el internet anda tan lento?",
			"NOOOOOOOOOOOOOOOOOOOOOOOOO",
			"Cant'tv se volvio a ir"
		]
			
			
	},
	
	"scene2": {
		
	},
	
}
