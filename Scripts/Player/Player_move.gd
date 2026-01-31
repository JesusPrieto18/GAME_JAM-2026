extends CharacterBody2D

@export var SPEED = 300.0
const JUMP_VELOCITY = -400.0

var is_interacting = false 

@onready var animation_tree = $AnimationTree
@onready var state_machine = animation_tree.get("parameters/playback")

func _ready() -> void:
	animation_tree.active = true
	
func _physics_process(delta: float) -> void:
	var input_vector = Input.get_vector("Left", "Right", "Up", "Down")
	
	if is_interacting:
		velocity = Vector2.ZERO
		move_and_slide()
		return
		
	if not input_vector.is_zero_approx():

		velocity = input_vector * SPEED
		
		animation_tree.set("parameters/Idle/blend_position", input_vector)
		animation_tree.set("parameters/Walk/blend_position", input_vector)
		animation_tree.set("parameters/Interact/blend_position", input_vector)
		state_machine.travel("Walk")
	
	else:
		velocity = Vector2.ZERO
		state_machine.travel("Idle")
		
	if Input.is_action_just_pressed("Action"):
		init_interaction()
	move_and_slide()
	
	collision_rock()
	
func collision_rock():
	for i in range(get_slide_collision_count()):
		var collision = get_slide_collision(i)
		var object_colide = collision.get_collider()
		
		if object_colide is RigidBody2D:
			var force = 100
			object_colide.apply_central_impulse(-collision.get_normal() * force)
			velocity = velocity * 0.5
			
func init_interaction():
	is_interacting = true
	state_machine.travel("Interact")
	
func finish_interaction():
	is_interacting = false
	state_machine.travel("Idle")


func _on_animation_tree_animation_finished(anim_name: StringName) -> void:
	print(anim_name)
	pass # Replace with function body.
