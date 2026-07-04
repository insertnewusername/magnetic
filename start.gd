extends Control

var button_type = null
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	button_type = "start"
	$Fade_transition.show()
	$Fade_transition/fade_timer.start()
	$Fade_transition/AnimationPlayer.play("fade_out")
	
func _on_timer_timeout() -> void:
	if button_type == "start" :
		get_tree().change_scene_to_file("res://sprites/levels.tscn")
		$Fade_transition.hide()
