extends Timer

var bullet_scene: PackedScene = load("res://scenes/Bullet.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timeout() -> void:
	var bullet = bullet_scene.instantiate()
	$"../Projectiles".add_child(bullet)
