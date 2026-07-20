extends Camera2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.




func change() -> void:
	limit_left = 16383
	limit_top = 391
	limit_right = 18057
	limit_bottom = 915
	
	print("cameraupdated")
	
func backtonormal() -> void:
	limit_left = -96
	limit_top = 0
	limit_right = 21057
	limit_bottom = 513
	
	print("cameraupdateagain")
	
func change2() -> void:
	limit_left = 18245
	limit_top = -561
	limit_right = 20072
	limit_bottom = 113
	
func change3() -> void:
	limit_left = -96
	limit_top = 0
	limit_right = 21057
	limit_bottom = 513
