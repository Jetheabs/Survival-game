extends Control

var stash

func _ready():
	$ToStash.pressed.connect(_move_to_stash)
	$ToPlayer.pressed.connect(_move_to_player)
	_refresh()
	

func _refresh():
	$PlayerList.clear()
	for item in PlayerInventory.items:
		$Player.list.add_item("%s (%d)" % [item.name, item.weight])
	
	$StashList.List.clear()
	for item in stash.items:
		$StashList.add_item("%s (%d)" % [item.name, item.weight])
		

func _move_to_stash():
	var index = $PlayerList.get_selected_items()
	if index.size() == 0: return
	var item = PlayerInventory.items[index[0]]
	
	if stash.add_item(item):
		PlayerInventory.remove_item(item)
	_refresh()
	
func _move_to_player():
	var index = $StashList.get_selected_items()
	if index.size() == 0: return
	var item = stash.items[index[0]]
	
	if PlayerInventory.add_item(item):
		stash.remove_item(item)
	_refresh()
	
