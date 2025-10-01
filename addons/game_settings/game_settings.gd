@tool
extends EditorPlugin

var autoload_name: String = "Settings"
var autoload_path: String = "res://addons/game_settings/src/settings.tscn"

func _enable_plugin() -> void:
	add_autoload_singleton(autoload_name, autoload_path)
	pass


func _disable_plugin() -> void:
	remove_autoload_singleton(autoload_name)
	pass


func _enter_tree() -> void:
	# Initialization of the plugin goes here.
	pass


func _exit_tree() -> void:
	# Clean-up of the plugin goes here.
	pass
