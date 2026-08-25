extends CharacterBody2D
@export var speed: float = 200.0

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed

func _physics_process(delta):
	get_input()
	move_and_slide()

var inventory_ui = null
var inventory_scene := preload("res://inventory_ui.tscn")

func _process(delta):
	if Input.is_action_just_pressed("inventory"):
		_toggle_inventory()

func _toggle_inventory():
	if inventory_ui == null:
		_open_inventory()
	else:
		_close_inventory()

func _open_inventory():
	inventory_ui = inventory_scene.instantiate()
	inventory_ui.stash = null  # no stash, just player inventory
	get_tree().root.add_child(inventory_ui)

func _close_inventory():
	inventory_ui.queue_free()
	inventory_ui = null
