extends Area2D

@export var teleport: Marker2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:

	if body is CharacterBody2D:
		if name == "TeleportHouse" and GameManager.last_hability == "Tuqueque" and GameManager.hability_on:
			body.global_position = teleport.global_position
		
		if name == "Teleport":
			body.global_position = teleport.global_position
