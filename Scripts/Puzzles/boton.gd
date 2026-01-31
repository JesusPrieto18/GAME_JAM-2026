extends Area2D

signal press_button(state)

var objects_on: int = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if body is RigidBody2D or body is CharacterBody2D:
		objects_on += 1
		if objects_on == 1:
			emit_signal("press_button", true)
		print("presionando")
		print(body.name)


func _on_body_exited(body: Node2D) -> void:
	if body is RigidBody2D or body is CharacterBody2D:
		objects_on -= 1
		if objects_on == 0:
			emit_signal("press_button", false)
		print("Dejar de presionar")
		print(body.name)
