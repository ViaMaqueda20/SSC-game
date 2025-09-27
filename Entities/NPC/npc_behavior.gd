class_name NPCBehavior extends Node2D

var npc : NPC

func _ready() -> void:
	if get_parent() is NPC:
		npc = get_parent() as NPC
		npc.behavior_enabled.connect(enable_behavior)
		npc.behavior_disabled.connect(disable_behavior)
		
func enable_behavior() -> void:
	pass
	
func disable_behavior() -> void:
	pass
