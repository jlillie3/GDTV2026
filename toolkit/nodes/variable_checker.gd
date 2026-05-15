class_name VariableChecker
extends Timer

func _init(check_time: float, variable_name: String, check_against: Node) -> void:
	wait_time = check_time
	autostart = true
	timeout.connect(func(): print(check_against[variable_name]))
	check_against.add_child(self)
	
