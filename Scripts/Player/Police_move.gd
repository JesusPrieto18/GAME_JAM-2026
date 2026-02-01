extends CharacterBody2D

@export var SPEED = 400.0
@export var initial_position: Marker2D
@onready var raycast = $RayCast2D

var object_potencial : Node2D = null
var see_the_player:bool = false
var is_interacting = false 

@onready var animation_tree = $AnimationTree
@onready var state_machine = animation_tree.get("parameters/playback")

func _ready() -> void:
	animation_tree.active = true
	
func _physics_process(delta: float) -> void:
	check_vision()
	move()

func check_vision():
	see_the_player = false
	
	if object_potencial:
		raycast.target_position = raycast.to_local(object_potencial.global_position)
		raycast.force_raycast_update()
		
		if raycast.is_colliding():
			var object_collider = raycast.get_collider()
			
			if object_collider.is_in_group("Jugador"):
				see_the_player = true
			else:
				see_the_player = false

func move():
	if see_the_player and object_potencial:
		var direction = (object_potencial.global_position - global_position).normalized()
		velocity = direction * SPEED
		
		animation_tree.set("parameters/Idle/blend_position", direction)
		animation_tree.set("parameters/Walk/blend_position", direction)
		state_machine.travel("Walk")
		
	else:
		velocity = Vector2.ZERO
		state_machine.travel("Idle")
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
