extends Camera2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.




func change() -> void:
	limit_left = 1500
	limit_top = 108
	limit_right = 5500
	limit_bottom = 1019
	
	print("cameraupdated")
	
func backtonormal() -> void:
	limit_left = -96
	limit_top = 0
	limit_right = 7040
	limit_bottom = 512
	
	print("cameraupdateagain")
	
func change2() -> void:
	limit_left = 4000
	limit_top = -514
	limit_right = 6700
	limit_bottom = -174
