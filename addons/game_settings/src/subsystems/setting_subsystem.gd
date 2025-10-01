@abstract
class_name SettingSubsystem extends Resource

var cn: String:
    get: return self.get_script().get_global_name()

func _init() -> void:
    self.initialize()

## Subclasses can override this to run initialization.
## If overriding, it is HIGHLY recommended to call the super() function -> otherwise, call the 'connect_settings_changed_signals_internal' method in initialize
func initialize() -> void:
    connect_settings_changed_signals_internal()

func serialize() -> String:
    push_warning("%s has not implemented the serialize() method" % cn)
    return ""

## Updates a setting property value and emits the associated signal
## The signal is expected to be defined with two parameters, the old value and the new value
func update_setting(backing_field: String, new_value: Variant, event: Signal, should_clamp: bool = false, clamp_range: Vector2 = Vector2(0, 100)) -> void:
    if not self.has_method("get") or not self.has_method("set"):
        push_warning("SettingSubsystem: Object does not support get/set methods")
        return

    var old_value = self.get(backing_field)
    if old_value == null:
        push_warning("SettingSubsystem: Property '%s' not found on %s" % [backing_field, self.get_class()])
        return

    if new_value == old_value: return

    if should_clamp:
        var original_value = new_value
        new_value = clamp(new_value, clamp_range.x, clamp_range.y)
        if original_value != new_value:
            push_warning("SettingSubsystem: Value %s was clamped to %s (range: %s-%s)" % [original_value, new_value, clamp_range.x, clamp_range.y])

    self.set(backing_field, new_value)
    event.emit(old_value, new_value)

#region Signal Connections
func get_setting_changed_signals() -> Array[Signal]:
    push_warning("%s has not implemented the get_setting_changed_signals() method" % cn)
    return []


## This is vestigial -> was previously used to emit signals from the settings object.  Since it's global though, nodes can just connect directly to the properties themselves.
func connect_settings_changed_signals_internal(handler_prefix: String = "_on") -> void:
    var signals: Array[Signal] = get_setting_changed_signals()
    for s in signals:
        var handler_name = String("%s_%s" % [handler_prefix, s.get_name()])
        if !self.has_method(StringName(handler_name)):
            push_warning("%s's signal %s is trying to connect to handler %s, which is not defined." % [cn, s.get_name(), handler_name])
            continue
        s.connect(handler_name)
#endregion

#region Grouping

## Can be overridden to define groupings of setting properties.  Useful when rendering in menus where you want to group similar properties together, make sections collapsable, etc. 
func get_setting_groups() -> Array[SettingGroup]:
    return []
    
var has_groups: bool:
    get: return get_setting_groups().size() > 0

#endregion

## In case we want to nest our subsystems within one another.  Don't think it's necessary right now.
# var child_subsystems: Dictionary[String, SettingSubsystem]

# func add_active_subsystem(name: String, system: SettingSubsystem) -> void:
#     if child_subsystems.get(name) != null:
#         push_warning("Subsystem already exists! This shouldn't happen - ensure that only one subsystem of each type is initialized")
#         return
#     child_subsystems.get_or_add(name, system)