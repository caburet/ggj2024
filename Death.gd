extends Area3D
var first= true
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if body.name == "Player":
		$"../../Player".global_position=Vector3(0,1,0)
		$"../../Player".rotation.y = deg_to_rad(0)
		$"../../deathsound".play()
	if body.name == "Player":
		print("body enter")
		if first:
			$"../../HUD/death".show()
			$"../../HUD/AudioStreamPlayer".play()
			$"../../HUD/Timer".start()
			first=false		
		pass # Replace with function body.
