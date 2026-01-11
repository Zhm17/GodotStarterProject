extends Button

func _on_pressed() -> void:
	_restart() # Replace with function body.

func _restart() -> void:
	get_tree().reload_current_scene()
