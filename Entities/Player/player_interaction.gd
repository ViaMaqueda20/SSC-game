extends Node2D


@onready var player : Player = $".."


func _ready() -> void:
	player.direction_changed.connect(_update_direction)
	

func _update_direction(_new_direction : Vector2) -> void:
	match _new_direction:
		Vector2.DOWN:
			rotation_degrees = 0
		Vector2.UP:
			rotation_degrees = 180
		Vector2.RIGHT:
			rotation_degrees = 270
		Vector2.LEFT:
			rotation_degrees = 90
	
