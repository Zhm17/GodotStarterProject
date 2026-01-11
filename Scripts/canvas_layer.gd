extends CanvasLayer

@export var time: float = 45.0
var seconds: int = 0
var msec: int = 0

@onready var win_sfx = "res://Assets/SFX/SFX_Victory.mp3"
var audio_player

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$DefeatPanel.visible = false
	$VictoryPanel.visible = false 

func _process(delta) -> void:
	if time <= 0 :
		stop(false)
		return
	
	time -= delta
	msec = fmod(time,1) * 100
	seconds = fmod(time, 60)
	
	$HUDPanel/Sec_Label.text = "%02d" % seconds
	$HUDPanel/MSec_Label3.text = "%02d" % msec
	
func stop(win : bool) -> void:
	time = 0.0
	msec = 0
	seconds = 0
	
	$HUDPanel/Sec_Label.text = "%02d" % seconds
	$HUDPanel/MSec_Label3.text = "%02d" % msec
	
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	
	if win :
		$VictoryPanel.visible = true;
		audio_player = AudioStreamPlayer.new()
		add_child(audio_player)
		audio_player.stream = load(win_sfx)
		audio_player.play()
	else :
		$DefeatPanel.visible = true;
	
	set_process(false)
	


func _on_crown_area_3d_crown_triggered() -> void:
	pass # Replace with function body.
