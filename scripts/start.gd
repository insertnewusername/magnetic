extends Control
@onready var click: AudioStreamPlayer2D = $Click
@onready var bgmusic: AudioStreamPlayer2D = $Bgmusic

var button_type = null
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	bgmusic.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	click.play()
	button_type = "start"
	$Fade_transition.show()
	$Fade_transition/fade_timer.start()
	$Fade_transition/AnimationPlayer.play("fade_out")
	
func _on_timer_timeout() -> void:
	if button_type == "start" :
		get_tree().change_scene_to_file("res://sprites/levels.tscn")
		$Fade_transition.hide()
		
		


func _on_bgmusic_finished() -> void:
	bgmusic.play()
