extends MeshInstance3D

var up=true
var speed = 1
var pos
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pos = $".".position.y
	if up:
		$".".position.y= pos + speed*delta
	else:
		$".".position.y= pos - speed*delta
	if pos>=2:
		up=false
	if pos<=-3:
		up=true
		
	pass
