extends Area3D

signal crown_triggered(win : bool)

func _ready() -> void:
	body_entered.connect(_on_body_entered)
	
func _on_body_entered(body: Node3D) -> void:
	print ("Body entered")
	if body.is_class("CharacterBody3D") :
		var home = get_node("CollisionShape3D")
		home.set_deferred("disabled", true)
		
		print ("Body is Player!")
		crown_triggered.emit(true)
