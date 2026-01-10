extends Node3D

@onready var open_door_sfx = "res://Assets/SFX/SFX_MetalDoor.wav"
var audio_player

@export var door_color : int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#var area = get_node("AreaTrigger")
	#if  area:
		#area.area_triggered.connect(_open)
		#print("Area and door connected ! ")
	#else : 
		#print("Area not found ! ")
		pass
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _open(signal_color : int):
	if signal_color == door_color : 
	
		audio_player = AudioStreamPlayer.new()
		add_child(audio_player)
		audio_player.stream = load(open_door_sfx)
		audio_player.play()
		
		var tween = create_tween()
		tween.tween_property(self, "position", Vector3(position.x, position.y - 5.0, position.z), 7.0)
		
		# Clean after play
		await audio_player.finished
		audio_player.queue_free()
		
		visible = not visible


func _on_area_trigger_area_triggered(signal_color: int) -> void:
	pass # Replace with function body.
