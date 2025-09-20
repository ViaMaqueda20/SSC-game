class_name HurtBoxComponent extends Area2D


@export var damage_dealt : int = 1


func _ready() -> void:
	area_entered.connect(_on_area_entered)


func _on_area_entered(area : Area2D) -> void:
	if area is HitBoxComponent:
		area.take_damage(self)
