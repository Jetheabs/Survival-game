extends Control

func _ready() -> void:
	$"/root/Control/Quit Button Label/Quit button".pressed.connect(_quit_button)
	
func _quit_button() -> void:
	get_tree().quit()
