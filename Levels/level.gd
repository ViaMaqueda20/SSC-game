class_name Level extends Node2D


func _ready() -> void:
	y_sort_enabled = true
	PlayerManager.set_player_parent(self)
	LevelManager.level_load_started.connect(free_level)
	

func free_level() -> void:
	PlayerManager.remove_player_parent(self)
	queue_free()
