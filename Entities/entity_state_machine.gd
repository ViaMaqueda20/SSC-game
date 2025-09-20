class_name EntityStateMachine extends Node


var states : Array[EntityState]
var current_state : EntityState
var prev_state : EntityState


func _ready() -> void:
	process_mode = Node.PROCESS_MODE_DISABLED


func _process(delta: float) -> void:
	change_state(current_state.process(delta))


func _physics_process(delta: float) -> void:
	change_state(current_state.physics(delta))


func change_state(new_state : EntityState) -> void:
	if new_state == null || current_state == new_state:
		return
	
	if current_state:
		current_state.exit()
	
	prev_state=current_state
	current_state=new_state
	current_state.enter()
