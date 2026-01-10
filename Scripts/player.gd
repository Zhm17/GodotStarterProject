extends CharacterBody3D

@onready var camera_mount = $camera_mount
@onready var animation_player = $Visuals/Cha_Anims/AnimationPlayer

var SPEED = 3.0
const JUMP_VELOCITY = 4.5

@export var walking_speed = 3.0
@export var running_speed = 5.0

var running = false

@export var sens_horizontal = 0.5
@export var sens_vertical = 0.5

@export var vertical_rotation_min = -80.0 
@export var vertical_rotation_max = 80.0

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	
func _input(event):
	if event is InputEventMouseMotion:
		rotate_y(deg_to_rad(-event.relative.x * sens_horizontal))
		camera_mount.rotate_x(deg_to_rad(-event.relative.y * sens_vertical))
		
		camera_mount.rotation.x = clamp(
			camera_mount.rotation.x,
			deg_to_rad(vertical_rotation_min),  
			deg_to_rad(vertical_rotation_max)   
		)

func _physics_process(delta: float) -> void:
	if(Input.is_action_pressed("run")):
		SPEED = running_speed
		running = true;
	else:
		SPEED = walking_speed
		running = false;
	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("left", "right", "forward", "backward")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		
		if running:
			if animation_player.current_animation != "Run": 
				animation_player.play("Run")
		else :
			if animation_player.current_animation != "Walk": 
				animation_player.play("Walk")
			
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		if animation_player.current_animation != "Idle": 
			animation_player.play("Idle")
		
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
