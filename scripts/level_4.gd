extends Node2D
@onready var Fade_transition: ColorRect = $Fade_transition
@onready var bgmusic: AudioStreamPlayer = $bgmusic
@onready var click: AudioStreamPlayer = $Click
@onready var panel: Panel = $home/Panel

var clicktype = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	panel.hide()
	panel.process_mode = Node.PROCESS_MODE_WHEN_PAUSED
	bgmusic.play()
	$Fade_transition.show()
	$Fade_transition/AnimationPlayer.play("fade_in")
	_setup_level()
	$CanvasLayer.hide()
	var player = get_node_or_null("../Player") 
	if player:
		player.player_player_won.connect(_on_player_player_won)

func _setup_level() -> void:
	var enemies = get_node_or_null("Spikes")
	if enemies:
		for enemy in enemies.get_children():
			enemy.player_died.connect(_on_player_died)
			
			
func _on_player_died(body):
	pass

func _on_player_player_won() -> void:
	$CanvasLayer.show()



func _on_home_pressed() -> void:
	clicktype = 1
	click.play()


	


func _on_redo_pressed() -> void:
	click.play()
	clicktype = 2


func _on_bgmusic_finished() -> void:
	bgmusic.play()


func _on_texture_button_pressed() -> void:
	clicktype = 1
	click.play()



func _on_click_finished() -> void:
	if clicktype == 1:
		get_tree().change_scene_to_file("res://sprites/levels.tscn")
	elif clicktype == 2:
		var current_scene = get_tree().current_scene
		get_tree().change_scene_to_file(current_scene.scene_file_path)
	elif clicktype == 0:
		pass

func _on_texture_button_2_pressed() -> void:
	clicktype = 0
	click.play()
	get_tree().paused = true
	panel.show()
	
func _on_resumebutton_pressed() -> void:
	clicktype = 0
	click.play()
	get_tree().paused = false
	panel.hide()


func _on_mute_toggled(toggled_on: bool) -> void:
	var master_bus_index = AudioServer.get_bus_index("Master")
	AudioServer.set_bus_mute(master_bus_index, toggled_on)
	if toggled_on:
		print("muted")
	else:
		print("unmuted")
	
