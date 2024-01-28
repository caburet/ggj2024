extends Node3D

var first=true
var first_plat=true
var first_win=true
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_axe_area_body_entered(body):
	if body.name == "Player":
		print("body enter")
		if first:
			$"HUD/axe".show()
			$"HUD/AudioStreamPlayer".play()
			$"HUD/Timer".start()
			first=false
		pass # Replace with function body.


func _on_area_3d_body_entered(body):
	if body.name == "Player":
		print("body enter")
		if first_plat:
			$"HUD/plat".show()
			$"HUD/AudioStreamPlayer".play()
			$"HUD/Timer".start()
			first_plat=false



func _on_win_body_entered(body):
	if body.name == "Player":
		print("body enter")
		if first_win:
			$"HUD/win".show()
			$"HUD/AudioStreamPlayer".play()
			$"HUD/AudioStreamPlayerWin".play()
			$"HUD/Timer2".start()
			first_win=false
	pass # Replace with function body.
