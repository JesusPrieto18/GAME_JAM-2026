extends Node

################ FUNCIONES INICIALES ###################
# Called when the node enters the scene tree for the first time.
#func _ready() -> void:
	#pass # Replace with function body.
#
## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#pass

#########################################################

### DATOS DEL JUGADOR ###
var name_player = "El niñe"

### INVENTARIO ###

var container = [null, null, null, null, null]

signal used_item(name: String)
signal highlight_item_on()
signal highlight_item_off()
signal give_object()

### SWICTH DE HABILIDAD ###
var hability_on = false
var last_hability = null

### ITEM PARA AREPA ###

var harina = false
var agua = false
var queso = false
var arepa = false

### LOGICA DE LA HISTORIA ####

var escena_0_sin_internet_lista = false
var escena_1_tukeke_pide_ayuda_lista = false
var escena_2_salvaste_al_tukeke = false
var pc_sin_internet = true
var tuqueque_free = false
var tuqueque_te_dio_mascara = false

### CARTEL DE AYUDA ###
signal actualizar_ayuda(nuevo_texto: String)

### LOGICA DE PUZZLES ########

# Puzzle1: Distraer a mamá
var puzzle1 = {
				"Init": false,
				"resolved": false,
				"llaveCerrada": false,
				"mamaEnElBaño": false,
				"help_dialog": "Distrae a tu mamá para salvar al tuqueque en el sarten"
}

# Puzzle2: Arepa
var puzzle2 = {
				"Init": false,
				"resolved": false,
				"help_dialog": "Encuentra los ingredientes de la arepa para la rata"
}

# Puzzle3: Mango
var puzzle3 = {
				"Init": false,
				"resolved": false,
				"help_dialog": "Mueve las piedras",
}

# Puzzle4: Forum
var puzzle4 = {
				"Init": false,
				"resolved": false,
				"help_dialog": "Evita los trabajadores y escapa"
}

########### VARIABLES PARA LA LOGICA DE LOS DIALOGOS ##############

var are_dialogues_on = false
var dialogues = {
	
	##### EL NiÑO PIERDE EL INTERNET Y LA MAMA LO LLAMA
	0: [
			{
				"name": name_player,
				"text": [
					"Al fin logré recolectar un millón de oro en RuneScape!", 
					"Aja, como era la vaina para vender esto...  ",
					"Por qué el internet anda tan lento?",
					"NOOOOOOOOOOOOOOOOOOOOOOOOO",
					"Cant'tv se volvio a ir...",
					"TT_TT"
					
				]
			},
			
			{
				"name": "Mamá",
				"text": [
					"¡" + name_player + "! Ven a ayudarme con el almuerzo", 
				]
			},	
			
			{
				"name": name_player,
				"text": [
					"VOOOOOOOY", 
				]	
			}
	],
	
	##### EL NIÑO ENTRA LA COCINA Y ESCUCHA AL TUQUEQUE ATERRORIZADO
	1: [
			{
				"name": "Tuqueque",
				"text": [
					"AUXILIOOOOOOOOOOOOOOOOOOOOOOOOOOO", 
					"NO SOY COMIDA SEÑORAAAAAAAAA"
				]	
			},
			
			{
				"name": "Mamá",
				"text": [
					"Que buena torta de morrocoy voy a hacer!", 
				]
			},
			
			{
				"name": "Tuqueque",
				"text": [
					"NO SOY UN MORROCOY SEÑORA POR EL AMOR AL SANTO", 
					"EH!! TÚ!! CARAJITO!! AYUDAMEEEEE",
					"TE PROMETO QUE TE COMPENSARE!!"
				]	
			},
			
			{
				"name": name_player,
				"text": [
					"Las cosas que trae el KLAP cada vez son más raras...",
					"Creo que si distraigo a mamá puedo salvar a ese amiguin" 
				]	
			}
		
	],
	
	2: [
		{"name": "Tuqueque", "text": ["DIOS MIO!!! MI SALVADOR!!!"]},
		{"name": name_player, "text": ["Habla claro tuqueque",
													"Me dijiste que me ibas a dar algo si te salvaba"]},
		{"name": "Tuqueque", "text": [  "Claro claro",
										"Es que mira, por si no te diste cuenta",
										"SOY UN TUQUEQUE MÁGICO!!!",
										"Te puedo conceder un deseo"]},
		{"name": name_player, "text": ["Claro... Entonces puedes hacer que el internet vuelva?"]},
		{"name": "Tuqueque", "text": [ "De bolas, claro muchacho",
										"peroooooo.......",
										"peroooooo.......",]},
		
	]
	
}
