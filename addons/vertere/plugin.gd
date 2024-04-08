tool
extends EditorPlugin

func _enter_tree():
	add_autoload_singleton("Utils", "res://addons/Vertere/utils.gd")
	add_autoload_singleton("Vertere", "res://addons/Vertere/vertere.gd")

func _exit_tree():
	remove_autoload_singleton("Utils")
	remove_autoload_singleton("Vertere")
