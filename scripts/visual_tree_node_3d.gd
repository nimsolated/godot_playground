class_name VisualTreeNode3D extends MeshInstance3D

@export var data: int = 1024
@export var left: VisualTreeNode3D = null
@export var right: VisualTreeNode3D = null

func _ready() -> void:
	var RNG: RandomNumberGenerator = RandomNumberGenerator.new()
	RNG.randomize()
	
	var sphere: SphereMesh = SphereMesh.new()
	sphere.set_material(StandardMaterial3D.new())
	sphere.get_material().set_albedo(Color(RNG.randf(), RNG.randf(), RNG.randf()))
	
	left = VisualTreeNode3D.new()
	right = VisualTreeNode3D.new()
	
	left.data = data * 0.5
	right.data = data * 0.5
	
	left.set_position(Vector3(position.x - 2, position.y - 2, position.z))
	right.set_position(Vector3(position.x + 2, position.y - 2, position.z))
	
