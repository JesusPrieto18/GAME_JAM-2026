extends PathFollow2D

@export var velocidad = 100.0
@export var animation_tree : AnimationTree # Arrastra tu AnimationTree aquí

var ultima_posicion : Vector2

func _ready():
	ultima_posicion = global_position

func _process(delta):
	# 1. Movimiento del Path (tu código actual)
	progress += velocidad * delta
	var vector_movimiento = global_position - ultima_posicion
	if vector_movimiento.length() > 0.01:
		var direccion_normalizada = vector_movimiento.normalized()
		actualizar_animation_tree(direccion_normalizada)

	ultima_posicion = global_position
	
func actualizar_animation_tree(direccion : Vector2):
	animation_tree.set("parameters/Caminar/blend_position", direccion)
	animation_tree.set("parameters/Idle/blend_position", direccion)
