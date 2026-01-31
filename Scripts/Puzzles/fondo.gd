extends Area2D

@export var respawn: Marker2D

@onready var sprite = $Sprite2D

var is_empty: bool = true


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if not is_empty:
		return
	if body.name == "Player" or body.is_in_group("Jugador"):
		print("Se cayo")
		player_respawn(body)
	elif body is RigidBody2D or body.is_in_group("Piedras"):
		fill_out(body)
	pass # Replace with function body.

func player_respawn(body):
	if respawn:
		body.global_position = respawn.global_position

func fill_out(body: RigidBody2D):
	is_empty = false
	var piedra_sprite = body.get_node("Sprite2D")
	body.remove_child(piedra_sprite)
	
	add_child(piedra_sprite)
	#sprite.texture
	body.queue_free()
	sprite.queue_free()
	monitoring = false
