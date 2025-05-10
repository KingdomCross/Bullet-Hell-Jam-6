extends Node2D


var current_state: State
var previous_state: State

func change_state(state):
	if state == previous_state.name:
		return
		
	current_state = find_child(state) as State
	current_state.enter()
	
	previous_state.exit()
	previous_state = current_state
