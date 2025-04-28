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
	mesh = sphere
	
	if (data > 0):
		left = VisualTreeNode3D.new()
		right = VisualTreeNode3D.new()
		
		left.data = data * 0.5
		right.data = data * 0.5
		
		add_child(left)
		add_child(right)
		
		left.set_global_position(Vector3(global_position.x - 1, global_position.y - 1, global_position.z))
		right.set_global_position(Vector3(global_position.x + 1, global_position.y - 1, global_position.z))
