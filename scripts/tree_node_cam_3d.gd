class_name TreeNodeCam3D extends Camera3D

@onready var tree_root: VisualTreeNode3D = $"../TreeRoot"

var curr: VisualTreeNode3D = null
var curr_parent: VisualTreeNode3D = null

func _ready() -> void:
	curr = tree_root
	toggleRim(curr)
	updatePosition()

func _unhandled_input(event: InputEvent) -> void:
	if (Input.is_action_just_pressed(&"ui_up")):
		if (!curr_parent):
			return
		toggleRim(curr)
		curr = curr_parent
		toggleRim(curr)
		if (curr_parent.get_parent() is VisualTreeNode3D):
			curr_parent = curr.get_parent()
		else:
			curr_parent = null
		updatePosition()
	elif (Input.is_action_just_pressed(&"ui_left")):
		if (!curr.left):
			return
		curr_parent = curr
		curr = curr.left
		toggleRim(curr_parent)
		toggleRim(curr)
		updatePosition()
	elif (Input.is_action_just_pressed(&"ui_right")):
		if (!curr.right):
			return
		curr_parent = curr
		curr = curr.right
		toggleRim(curr_parent)
		toggleRim(curr)
		updatePosition()

func updatePosition() -> void:
	global_position.x = curr.global_position.x
	global_position.y = curr.global_position.y
	global_position.z = curr.global_position.z + 7.5

func toggleRim(node: VisualTreeNode3D) -> void:
	node.mesh.material.rim_enabled = !node.mesh.material.rim_enabled
