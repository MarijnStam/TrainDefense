extends Area2D

var direction_vector: Vector2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#Get the direction vector towards the mouse cursor to fire the projectile to 
	var global_pos = $"../../Nozzle".global_position
	position = $"../../Nozzle".position
	direction_vector = global_pos.direction_to(get_viewport().get_mouse_position())    

	rotation = direction_vector.angle()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += direction_vector * delta * 600 
