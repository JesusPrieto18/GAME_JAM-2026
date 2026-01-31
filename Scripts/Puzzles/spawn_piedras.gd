extends Area2D

@export var piedra: PackedScene
@export var mark: Marker2D
var create = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	print(mark.global_position)
	pass
	

func _on_body_entered(body: Node2D) -> void:
	print("Cuerpo en mas")
	if body is CharacterBody2D and not create:
		call_deferred("create_piedra")
		#create = true

func create_piedra():
	if  piedra:
		var new_piedra = piedra.instantiate()
		
		get_parent().add_child(new_piedra)
		new_piedra.global_position = mark.global_position
		#print(new_piedra.global_position)
		#print("Piedra creada")
		#print("3. ¡Objeto añadido! Se llama: ", new_piedra.name)
		#print("4. Su posición es: ", new_piedra.global_position)
