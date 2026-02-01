extends CharacterBody2D

@export var SPEED = 300.0
@export var initial_position: Marker2D

var object_potencial : Node2D = null
var see_the_player:bool = false
var is_interacting = false 
var last_position: Vector2

@onready var animation_tree = $AnimationTree
@onready var state_machine = animation_tree.get("parameters/playback")

func _ready() -> void:
	last_position = global_position
	animation_tree.active = true
	
func _physics_process(delta: float) -> void:
	move()

func move():
	var desplazamiento = global_position - last_position
	if desplazamiento.length() > 0.01:
		#velocity = direction * SPEED
		var direction = desplazamiento.normalized()
		
		animation_tree.set("parameters/Idle/blend_position", direction)
		animation_tree.set("parameters/Walk/blend_position", direction)
		state_machine.travel("Walk")
		
	else:
		#velocity = Vector2.ZERO
		state_machine.travel("Idle")
	last_position = global_position
	move_and_slide()



func _on_animation_tree_animation_finished(anim_name: StringName) -> void:
	print(anim_name)
	pass # Replace with function body.


func _on_area_detection_body_exited(body: Node2D) -> void:
	if body.is_in_group("Jugador"):
		object_potencial = null

func _on_area_detection_body_entered(body: Node2D) -> void:
	if body.is_in_group("Jugador"):
		object_potencial = body


func _on_hitbox_body_entered(body: Node2D) -> void:
	if body.is_in_group("Jugador"):
		print("Atrapado")
	pass # Replace with function body.
