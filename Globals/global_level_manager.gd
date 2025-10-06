extends Node

signal level_loaded()
signal level_load_started()
signal tile_map_bounds_changed(bounds : Array[Vector2])


var tile_map_bounds : Array[Vector2]

var target_transition : String

func _ready() -> void:
	await get_tree().process_frame
	level_loaded.emit()
	
	
func load_new_level(_level_path : String, _target_transition : String) -> void:
	
	target_transition = _target_transition
	get_tree().paused = true
	
	await SceneTransition.fade_in()
	
	level_load_started.emit()
	
	await get_tree().process_frame
	
	get_tree().change_scene_to_file(_level_path)
	
	await get_tree().process_frame
	
	get_tree().paused = false
	
	await SceneTransition.fade_out()
	
	level_loaded.emit()
	
	
	

	
func change_tile_map_bounds(_bounds : Array[Vector2]) -> void:
	tile_map_bounds = _bounds
	tile_map_bounds_changed.emit(tile_map_bounds)
