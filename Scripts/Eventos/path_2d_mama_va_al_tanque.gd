extends Path2D

@export var velocidad = 50.0 # Pixeles por segundo
var puede_moverse = false

func _ready():
	# Buscamos la llave y nos conectamos a su señal
	# (Ajusta la ruta según tu escena)
	var llave = get_tree().root.find_child("AreaLLaveDePaso", true, false)
	if llave:
		llave.connect("llave_cerrada", _on_llave_cerrada)

func _on_llave_cerrada():
	puede_moverse = true # Ahora la mamá tiene permiso para caminar
	
func _process(delta):
	var path_follow = $PathFollow2D
	if puede_moverse:
		path_follow.progress += velocidad * delta
		if $PathFollow2D.progress_ratio >= 1.0:
			puede_moverse = false
			GameManager.puzzle1["mamaEnElBaño"] = true
