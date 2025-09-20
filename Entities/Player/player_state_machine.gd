class_name PlayerStateMachine extends EntityStateMachine


func _unhandled_input(event: InputEvent) -> void:
	change_state(current_state.handle_input(event))


func initialize(_player : Player) -> void:
	states = []
	
	for c in get_children():
		if c is PlayerState:
			states.append(c)
	
	if states.size()>0:
		states[0].player = _player
		states[0].player_state_machine = self
		
		for s in states:
			s.init()
			
		change_state(states[0])
		process_mode = Node.PROCESS_MODE_INHERIT
