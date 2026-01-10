extends CanvasLayer

@export var time: float = 45.0
var seconds: int = 0
var msec: int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _process(delta) -> void:
	if time <= 0 :
		stop()
		return
	
	time -= delta
	msec = fmod(time,1) * 100
	seconds = fmod(time, 60)
	
	$Sec_Label.text = "%02d" %seconds
	$MSec_Label3.text = "%02d" %msec
	
func stop() -> void:
	time = 0.0
	msec = 0
	seconds = 0
	
	$Sec_Label.text = "%02d" %seconds
	$MSec_Label3.text = "%02d" %msec
	
	set_process(false)
	
