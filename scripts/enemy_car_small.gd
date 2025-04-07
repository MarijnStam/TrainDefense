extends RigidBody2D

@onready var train: Node2D = get_node("../../Train")
@onready var view_size: Vector2 = get_viewport().get_visible_rect().size
var rng := RandomNumberGenerator.new()
var phys_override := PhysicsMaterial.new()
var speed: int = 100

func _integrate_forces(state: PhysicsDirectBodyState2D) -> void:
	var rotation_to_train: float = get_angle_to(train.position) + deg_to_rad(180)
	linear_velocity = Vector2.LEFT.rotated(rotation_to_train) * speed

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var rotation_to_train: float = 0.0
	
	#Randomly set start pos of enemy
	position = Vector2(rng.randi_range(((view_size[0] / 3) * 2), view_size[0]), rng.randi_range(0, view_size[1]))
	
	#Make the enemy move towards the train
	rotation_to_train = get_angle_to(train.position) + deg_to_rad(180)
	rotation = rotation_to_train
	
	#Disable friction
	phys_override.friction = 0
	physics_material_override = phys_override
	linear_damp = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
