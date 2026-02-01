extends Panel


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.hide() 

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

#####################################################################

@onready var label = $RichTextLabel

func show_help(help_msg: String):
	self.show()
	label.text = help_msg

func hide_help():
	self.hide()
