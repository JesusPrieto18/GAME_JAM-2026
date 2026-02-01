extends TextureRect

var tween : Tween
var color_resaltado = Color(0.863, 0.281, 0.852, 1.0) # Valores > 1 hacen que brille más
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameManager.highlight_item_on.connect(_on_highlight)
	GameManager.highlight_item_off.connect(_off_highlight)
	pass # Replace with function body.

func _on_highlight():
	if get_parent().get_parent().name == GameManager.last_hability:
		var color_original = modulate
		tween = create_tween()
		tween.set_loops()
			
		tween.set_trans(Tween.TRANS_ELASTIC)
		tween.set_ease(Tween.EASE_OUT)
			
		tween.tween_property(self, "modulate", color_resaltado, 1)
		tween.tween_property(self, "modulate", color_original, 1)
	
func _off_highlight():
	if tween: 
		tween.kill()
	modulate = Color(1, 1, 1, 1)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
