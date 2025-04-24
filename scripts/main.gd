extends Node

@export var nodePath: NodePath = "."
@export var nodeTree: TreeNode = null

func _ready() -> void:
	var strname1: StringName = &"Hello"
	var strname2: StringName = &"Poopoo"
	
	print(strname1)
	print(strname2)
	
	initNodeTree()

func initNodeTree() -> void:
	randomize()
	
	if (!nodeTree):
		nodeTree = TreeNode.new()
	
	nodeTree.data = 1000
	
	for i in range(20):
		var newData: int = randi_range(0, 2000)
		var currNode: TreeNode = nodeTree
		var done: bool = false
		
		while(!done):
			if (newData > currNode.data):
				if (currNode.right):
					currNode = currNode.right
				else:
					currNode.right = TreeNode.new()
					currNode.right.data = newData
					done = true
			elif (newData < currNode.data):
				if (currNode.left):
					currNode = currNode.left
				else:
					currNode.left = TreeNode.new()
					currNode.left.data = newData
					done = true
