extends ParallaxBackground

enum SPEED_ALT {NONE, ACCEL, DECEL}
var speed = 100
var speedAltType = SPEED_ALT.NONE

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	match speedAltType:
		SPEED_ALT.ACCEL:
			speed += (5)
		SPEED_ALT.DECEL:
			speed -= (5)
		_:
			pass

	scroll_base_offset -= Vector2(speed, 0) * delta
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("speed_up"):
		speedAltType = SPEED_ALT.ACCEL
	if event.is_action_released("speed_up"):
		speedAltType = SPEED_ALT.NONE
		
	if event.is_action_pressed("speed_down"):
		speedAltType = SPEED_ALT.DECEL
	if event.is_action_released("speed_down"):
		speedAltType = SPEED_ALT.NONE
