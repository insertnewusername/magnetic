extends Node2D
@onready var bgmusic: AudioStreamPlayer = $bgmusic


# Called when the node enters the scene tree for the first time.
func _ready():
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
	get_tree().change_scene_to_file("res://sprites/levels.tscn")
	

func _on_redo_pressed() -> void:
	var current_scene = get_tree().current_scene
	get_tree().change_scene_to_file(current_scene.scene_file_path)


func _on_bgmusic_finished() -> void:
	print("finished")
	bgmusic.play()


func _on_texture_button_pressed() -> void:
	get_tree().change_scene_to_file("res://sprites/levels.tscn")
