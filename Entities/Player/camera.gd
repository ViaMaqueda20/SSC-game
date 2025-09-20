class_name Camera extends Camera2D


#func _ready() -> void:
	#LevelManager.tile_map_bounds_changed.connect(update_bounds)
	#update_bounds(LevelManager.current_tilemap_bounds)


func update_bounds(bounds : Array[ Vector2 ]) -> void:
	if bounds.size()>0:
		limit_left = int(bounds[0].x)
		limit_top = int(bounds[0].y)
		limit_right = int(bounds[1].x)
		limit_bottom = int(bounds[1].y)
