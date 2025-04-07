extends Area2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if ($"../../Enemies".get_child_count() != 0):
		if $Fire_Timer.time_left == 0:
			$Fire_Timer.start()
