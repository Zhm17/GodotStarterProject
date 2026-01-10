extends Node3D

@onready var open_door_sfx = "res://Assets/SFX/SFX_MetalDoor.wav"
var audio_player
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	audio_player = AudioStreamPlayer.new()
	add_child(audio_player)
	audio_player.stream = load(open_door_sfx)
	
	open()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func open() -> void:
	audio_player.play()
	
	var tween = create_tween()
	tween.tween_property(self, "position", Vector3(position.x, position.y - 5.0, position.z), 7.0)
	
	# Clean after play
	await audio_player.finished
	audio_player.queue_free()
