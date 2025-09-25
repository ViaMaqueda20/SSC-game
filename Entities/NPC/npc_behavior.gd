class_name NPCBehavior extends Node2D

var npc : NPC

func _ready() -> void:
	if get_parent() is NPC:
		npc = get_parent() as NPC
		npc.behavior_enabled.connect(start)
		
func start() -> void:  #virtual
	pass
