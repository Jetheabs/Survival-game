extends StaticBody2D

@export var weight_limit: int = 25
var player_near: bool = false

func _ready() -> void:
	$Area2D.body_entered.connect(_on_body_entered)
	$Area2D.body_exited.connect(_on_body_exited)
	
func _on_body_entered(body):
	if body.name == "Player":
		player_near = true
		
func _on_body_exited(body):
	if body.name == "Player":
		player_near = false
		
func can_add(item):
	return get_total_weight() + item.weight <= weight_limit

func add_item(item):
	if can_add(item):
		items.append(item)
		return true
	return false

func remove_item(item):
	item.erase(item)

func _process(delta):
	if player_near and Input.is_action_just_pressed("interact"):
		_open_ui()

#The preload is temporary and needs to be changed later
func _open_ui():
	if ui: return
	ui = preload("res://inventory_ui.tscn").instantiate()
	ui.stash = self
	get_tree().root.add_child(ui)

	
