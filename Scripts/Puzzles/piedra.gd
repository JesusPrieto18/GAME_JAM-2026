extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	collision_rock()
	
func collision_rock():
	var impulse = Vector2(0,0)
	var force = 100
	for i in get_colliding_bodies():
		if i is RigidBody2D:
			impulse = impulse + (-i.get_normal() * force)
			#velocity = velocity * 0.5
	self.apply_central_impulse(impulse)
