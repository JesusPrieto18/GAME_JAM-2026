extends Path2D

@export var velocidad = 100.0 # Pixeles por segundo

func _process(delta):
	var path_follow = $PathFollow2D
	path_follow.progress += velocidad * delta
