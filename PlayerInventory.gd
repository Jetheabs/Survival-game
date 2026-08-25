extends Node

var items: Array = []
var max_weight: int = 100

func get_total_weight() -> int:
	var total := 0
	for item in items:
		total += item.weight
	return total
	
func can_add(item) -> bool:
	return get_total_weight() + item.weight <= max_weight

func add_item(item):
	if can_add(item):
		items.append(item)
		return true
	return false
	

func remove_item(item):
	items.erase(item)
