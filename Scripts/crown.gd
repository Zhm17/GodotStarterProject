extends Area3D

signal crown_triggered(win : bool)

var tween

func _ready() -> void:
	tween = get_tree().create_tween()
	body_entered.connect(_on_body_entered)

# Called when the node enters the scene tree for the first time.
func _process(delta) -> void:
	tween.tween_property(self, "rotation", Vector3.ZERO, 1.0)
	
func _on_body_entered(body: Node3D) -> void:
	print ("Body entered")
	if body.is_class("CharacterBody3D") :
		var home = get_node("CollisionShape3D")
		home.set_deferred("disabled", true)
		
		print ("Body is Player!")
		crown_triggered.emit(true)
