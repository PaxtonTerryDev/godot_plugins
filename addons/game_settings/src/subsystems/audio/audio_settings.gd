class_name AudioSettings extends SettingSubsystem

func serialize() -> String:
	printerr("Not Implemented")
	return ""

func get_setting_groups() -> Array[SettingGroup]:
	var volume_settings: SettingGroup = SettingGroup.new("Volume").add_setting([master_volume, music_volume, sfx_volume, dialogue_volume])
	return [volume_settings]

func get_setting_changed_signals() -> Array[Signal]:
	return [master_volume_changed, music_volume_changed, sfx_volume_changed, dialogue_volume_changed, is_muted_changed]

signal master_volume_changed(old_value: int, new_value: int)
@export_range(0, 100) var _master_volume: int = 100
var master_volume: int:
	get: return _master_volume
	set(new_value):
		update_setting("_master_volume", new_value, master_volume_changed, true)

signal music_volume_changed(old_value: int, new_value: int)
@export_range(0, 100) var _music_volume: int = 100
var music_volume: int:
	get: return _music_volume
	set(new_value):
		update_setting("_music_volume", new_value, music_volume_changed, true)

signal sfx_volume_changed(old_value: int, new_value: int)
@export_range(0, 100) var _sfx_volume: int = 100
var sfx_volume: int:
	get: return _sfx_volume
	set(new_value):
		update_setting("_sfx_volume", new_value, sfx_volume_changed, true)

signal dialogue_volume_changed(old_value: int, new_value: int)
@export_range(0, 100) var _dialogue_volume: int = 100
var dialogue_volume: int:
	get: return _dialogue_volume
	set(new_value):
		update_setting("_dialogue_volume", new_value, dialogue_volume_changed, true)

signal is_muted_changed(old_value: bool, new_value: bool)
@export var _is_muted: bool = false
var is_muted: bool:
	get: return _is_muted
	set(new_value):
		update_setting("_is_muted", new_value, is_muted_changed)


func _on_master_volume_changed(old_value: int, new_value: int) -> void:
	pass
 
func _on_music_volume_changed(old_value: int, new_value: int) -> void:
	pass
 
func _on_sfx_volume_changed(old_value: int, new_value: int) -> void:
	pass
 
func _on_dialogue_volume_changed(old_value: int, new_value: int) -> void:
	pass
 
func _on_is_muted_changed(old_value: bool, new_value: bool) -> void:
	pass
