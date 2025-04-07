extends RigidBody2D

@onready var train: Node2D = get_node("../../Train")
@onready var view_size: Vector2 = get_viewport().get_visible_rect().size
var rng := RandomNumberGenerator.new()
var phys_override := PhysicsMaterial.new()
var speed: int = 100

func _integrate_forces(state: PhysicsDirectBodyState2D) -> void:
	#Update the linear velocity to always aim at the train
	linear_velocity = position.direction_to(train.position) * speed

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var rotation_to_train: float = 0.0
	
	#Randomly set start pos of enemy
	position = Vector2(rng.randi_range(((view_size[0] / 3) * 4), view_size[0]), rng.randi_range(0, view_size[1]))
	
	#Set the angle of the enemy towards the train
	rotation_to_train = get_angle_to(train.position) + deg_to_rad(180)
	rotation = rotation_to_train
	
	#Disable friction
	phys_override.friction = 0
	physics_material_override = phys_override
	linear_damp = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
