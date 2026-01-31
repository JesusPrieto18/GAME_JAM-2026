extends Panel


######################### VARIABLES ######################### 	
# En dialogues guardamos los dialogos que vamos a reproducir (Los que vienen de Global)	
var dialogues = [] 
# Los dialogos estan divididos, por lo que necesitamos saber en cual vamos      
var index = 0      
# Un booleano para saber si el dialogo aun se esta escribiendo
var writing = false 

@onready var label = $RichTextLabel
@onready var timer = $Timer
@onready var audio = $SpeakSound
@onready var name_label = $ContainerName/Name

######################### FUNCIONES X ######################### 	

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.hide()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

################### FUNCIONES DE DIALOGOS ######################### 	

func start_dialogue(name: String, array_dialogues: Array):
	GameManager.are_dialogues_on = true
	name_label.text = name
	dialogues = array_dialogues
	index = 0
	
	# Mostramos el cuadro
	self.show()
	show_dialogues()

func _input(event):
	# Si presionamos la tecla enter y el cuadro está visible
	if event.is_action_pressed("AdvanceDialogue") and self.visible:
		# Avanzamos al siguiente dialogo
		if index < dialogues.size() - 1:
			index += 1
			show_dialogues()
		else:
			end_dialogue()

func show_dialogues():
	
	#  Lógica de "máquina de escribir" 
	print("Mostrando frase: ", index)
	
	# Seteamos el texto del label            
	label.text = dialogues[index]     
	label.visible_characters = 0
	
	audio.play()
	
	# Animación de máquina de escribir
	for i in dialogues[index].length():
		label.visible_characters += 1
		# Velocidad de la letra
		timer.start(0.05)   
		await timer.timeout

	audio.stop()

func end_dialogue():
	self.hide()
	index = 0
	# Avisamos al GameManager que el diálogo terminó
	GameManager.are_dialogues_on = false



	
	
