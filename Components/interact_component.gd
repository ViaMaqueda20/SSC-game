class_name InteractComponent extends Area2D


signal begin_interaction()


func _ready() -> void:
	area_entered.connect(_on_talk_box_entered)
	area_exited.connect(_on_talk_box_exited)
	
func _on_talk_box_entered(_a : Area2D) -> void:
	PlayerManager.interaction_pressed.connect(_player_interacted)
	
func _player_interacted() -> void:
	begin_interaction.emit()
	
func _on_talk_box_exited(_a : Area2D) -> void:
	PlayerManager.interaction_pressed.disconnect(_player_interacted)
