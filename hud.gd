extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
	$Intro.hide()
	$axe.hide()
	$death.hide()
	$plat.hide()
	$AudioStreamPlayer.stop()
	
	pass # Replace with function body.
