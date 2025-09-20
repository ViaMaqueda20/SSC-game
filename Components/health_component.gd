class_name HealthComponent extends Node

signal damaged()
signal destroyed()
signal healed()


@export var max_hp : int = 1
var hp : int


func _ready() -> void:
	hp = max_hp


func update_health(delta : int) -> void:
	hp = clamp(hp+delta,0,max_hp)
	if hp <= 0:
		destroyed.emit()
	elif delta<0:
		damaged.emit()
	elif delta>0:
		healed.emit()


func destroy() -> void:
	get_parent().queue_free()
