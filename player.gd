extends CharacterBody3D
#https://github.com/robotnik-dev/character_camera_3d
#https://godotengine.org/asset-library/asset/2120
#https://polyhaven.com/a/excavated_soil_wall
#https://godotengine.org/asset-library/asset/1467
#Sound Effect from <a href="https://pixabay.com/?utm_source=link-attribution&utm_medium=referral&utm_campaign=music&utm_content=41400">Pixabay</a>

const SPEED = 5.0
const JUMP_VELOCITY = 4.5
const ANGULAR_SPEED= 150
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
@onready var player_body= $"."
@onready var camera= $cam_gimbal
@onready var anim= $"anim_gimbal"
@onready var robot= $"anim_gimbal/3DGodotRobot"
@onready var animationplayer = $"anim_gimbal/3DGodotRobot/AnimationPlayer"
func _physics_process(delta):
	
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta
		animationplayer.play("Jump")

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		animationplayer.play("Run")
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	if input_dir != Vector2(0,0):
		if animationplayer.get_assigned_animation()!="Run":
			animationplayer.play("Run")
	else:
		animationplayer.play("Idle")
	#var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	var direction = Vector3(input_dir.x,0,input_dir.y).rotated(Vector3.UP,camera.rotation.y).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
		#player_body.rotation.y= lerp(player_body.rotation.y,atan2(velocity.x,velocity.z), delta * ANGULAR_SPEED)
	else:
		velocity.x = move_toward(velocity.x, 0, ANGULAR_SPEED)
		velocity.z = move_toward(velocity.z, 0, ANGULAR_SPEED)
	#if Input.is_action_pressed("ui_left") or Input.is_action_pressed("ui_right"):
		#player_body.rotation.y= lerp(player_body.rotation.y,atan2(-velocity.x,velocity.z), delta * ANGULAR_SPEED)

	move_and_slide()



func _on_area_3d_body_entered(body):
	$".".global_position=Vector3(0,1,0)
	$".".rotation.y = deg_to_rad(0)
	$"../CPUParticles3D".restart()
	$"../hurtaxe".show()
	$"../hurtaxe/AnimationPlayer".play("Hurt")
	$"../floor/platform2/blood".show()
	$"../deathsound".play()
	pass # Replace with function body.
