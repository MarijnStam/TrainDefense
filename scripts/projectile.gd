extends Area2D

@onready var enemies = get_node("/root/Level/Enemies")
var projectile_angle: float

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var gun = get_parent()
	var train = gun.get_parent()
	var closest_enemy 
	
	position = get_parent().position
	for enemy in enemies.get_children():
		var shortest_distance = 999999
		var distance_to_enemy = enemy.position - position
		

		if distance_to_enemy.length() < shortest_distance:
			shortest_distance = distance_to_enemy.length()
			closest_enemy = enemy
			
		
	projectile_angle = train.get_angle_to(closest_enemy.position)
	rotation = projectile_angle

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += Vector2.RIGHT.rotated(projectile_angle) * delta * 150 
	pass
