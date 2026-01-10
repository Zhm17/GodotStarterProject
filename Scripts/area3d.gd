extends Area3D


signal area_triggered(signal_color : int)

@export var area_color: int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	body_entered.connect(_on_body_entered) # Replace with function body.
	
func _on_body_entered(body: Node3D) -> void:
	print ("Body entered")
	if body.is_class("CharacterBody3D") :
		var home = get_node("CollisionShape3D")
		home.set_deferred("disabled", true)
		
		print ("Body is Player!")
		area_triggered.emit(area_color)
		
