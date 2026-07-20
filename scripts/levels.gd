extends Node2D
@onready var click: AudioStreamPlayer2D = $"../Click"
@onready var bgmusic: AudioStreamPlayer2D = $Bgmusic

var button_type = null
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	bgmusic.play()
	$Fade_transition.show()
	$Fade_transition/AnimationPlayer.play("fade_in")
	await get_tree().create_timer(1.0).timeout
	$Fade_transition.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass






func _on_level_2_pressed() -> void:
	click.play()
	button_type = "level2"
	$Fade_transition.show()
	$Fade_transition/fade_timer.start()
	$Fade_transition/AnimationPlayer.play("fade_out")


func _on_level_1_pressed() -> void:
	click.play()
	button_type = "level1"
	$Fade_transition.show()
	$Fade_transition/fade_timer.start()
	$Fade_transition/AnimationPlayer.play("fade_out")
	
func _on_level_3_pressed() -> void:
	click.play()
	button_type = "level3"
	$Fade_transition.show()
	$Fade_transition/fade_timer.start()
	$Fade_transition/AnimationPlayer.play("fade_out")
	
	


func _on_fade_timer_timeout() -> void:
	if button_type == "level1" :
		get_tree().change_scene_to_file("res://sprites/level1.tscn")
		
	elif button_type == "level2" :
		get_tree().change_scene_to_file("res://sprites/level2.tscn")
		
	elif button_type == "level3" :
		get_tree().change_scene_to_file("res://sprites/level3.tscn")





func _on_bgmusic_finished() -> void:
	bgmusic.play()
