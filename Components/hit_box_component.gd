class_name HitBoxComponent extends Area2D

signal hit_box_damaged(hurt_box_component : HurtBoxComponent)

@export var health_component : HealthComponent

var invulnerable : bool = false

func take_damage(hurt_box_component : HurtBoxComponent) -> void:
	if !invulnerable:
		if health_component:
			health_component.update_health(-hurt_box_component.damage_dealt)
		hit_box_damaged.emit(hurt_box_component)

func set_invulnerable(_duration : float) -> void:
	invulnerable = true
	await get_tree().create_timer(_duration).timeout
	invulnerable = false
