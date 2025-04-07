extends Node2D

var enemy_scene: PackedScene = load("res://scenes/EnemyCarSmall.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$"SpeedDisplay".text = "Speed: %s" % $ParallaxBackground.speed
	pass


func _on_enemy_spawn_timer_timeout() -> void:
	var enemy = enemy_scene.instantiate()
	$Enemies.add_child(enemy)
