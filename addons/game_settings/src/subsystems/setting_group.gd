class_name SettingGroup extends RefCounted

var group_name: String
var settings: Array[Variant] = []

func _init(name: String) -> void:
    self.group_name = name

func add_setting(setting: Variant) -> SettingGroup:
    if setting is Array:
        settings.append_array(setting)
    else:
        settings.append(setting)
    return self