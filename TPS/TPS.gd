extends CharacterBody3D

var speed = 2
const ACCEL_DEFAULT = 10
const ACCEL_AIR = 1
@onready var accel = ACCEL_DEFAULT
var gravity = 9.8
var jump = 5

var cam_accel = 40
var mouse_sense = 0.1
var snap

var angular_velocity = 30

var direction = Vector3()
var gravity_vec = Vector3()
var movement = Vector3()

@onready var head = $Head
@onready var campivot = $Head/CamPivot
@onready var mesh = $player_beta

func _ready():
	$player_beta/Player_anim/Skeleton3D/BoneAttachment3D/TorchPlayer.play("flicker")
	#hides the cursor
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
	#mesh no longer inherits rotation of parent, allowing it to rotate freely
	#mesh.set_as_toplevel(true)
	
func _input(event):
	#get mouse input for camera rotation
	if event is InputEventMouseMotion:
		rotate_y(deg_to_rad(-event.relative.x * mouse_sense))
		head.rotate_x(deg_to_rad(-event.relative.y * mouse_sense))
		head.rotation.x = clamp(head.rotation.x, deg_to_rad(-89), deg_to_rad(89))

func _process(delta):
	#turns body in the direction of movement
	if direction != Vector3.ZERO:
		mesh.rotation.y = lerp_angle(mesh.rotation.y, atan2(-direction.x, -direction.z), angular_velocity * 0.2 * delta)

func _physics_process(delta):
	if Input.is_action_pressed("sprint"):
		$player_beta/AnimationPlayer.speed_scale = 2
		speed = 4
	else:
		$player_beta/AnimationPlayer.speed_scale = 1
		speed = 2
	#get keyboard input
	direction = Vector3.ZERO
	var h_rot = global_transform.basis.get_euler().y
	var f_input = Input.get_action_strength("move_backward") - Input.get_action_strength("move_forward")
	var h_input = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	#$player_beta/AnimationTree.set("parameters/conditions/moving", (f_input != 0) or (h_input != 0))
	#$player_beta/AnimationTree.set("parameters/conditions/idle", (f_input == 0) and (h_input == 0))
	$player_beta/AnimationTree.set("parameters/BlendTree/walking/blend_amount", lerp($player_beta/AnimationTree.get("parameters/BlendTree/walking/blend_amount"), float(clamp(abs(h_input)+abs(f_input), 0, 1)), 5*delta))
	#print_debug($player_beta/AnimationTree.get("parameters/conditions/moving"))
	direction = Vector3(h_input, 0, f_input).rotated(Vector3.UP, h_rot).normalized()
	
	#jumping and gravity
	if is_on_floor():
		snap = -get_floor_normal()
		accel = ACCEL_DEFAULT
		gravity_vec = Vector3.ZERO
	else:
		snap = Vector3.DOWN
		accel = ACCEL_AIR
		gravity_vec += Vector3.DOWN * gravity * delta
		
	if Input.is_action_just_pressed("jump") and is_on_floor():
		snap = Vector3.ZERO
		gravity_vec = Vector3.UP * jump
	
	#make it move
	velocity = velocity.lerp(direction * speed, accel * delta)
	velocity = velocity + gravity_vec
	
	mesh.global_position = global_position
	mesh.global_position.y = mesh.global_position.y - 0.97
	move_and_slide()
	
	
	
