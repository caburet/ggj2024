extends Control

var lvl1 = preload("res://level_1.tscn").instantiate()

func _on_button_button_down():
	get_tree().root.add_child(lvl1)
	queue_free()

func _on_options_button_down():
	pass # Replace with function body.

func _on_credits_button_down():
	pass # Replace with function body.


func _on_quit_button_down():
	get_tree().quit()
