extends Node


signal tile_map_bounds_changed(bounds : Array[Vector2])


var tile_map_bounds : Array[Vector2]


func _ready() -> void:
	pass
	
	
func change_tile_map_bounds(_bounds : Array[Vector2]) -> void:
	tile_map_bounds = _bounds
	tile_map_bounds_changed.emit(tile_map_bounds)
