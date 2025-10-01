extends Node

enum Subsystem {
    ACCESSIBILITY,
    AUDIO,
    DISPLAY,
    GAMEPLAY,
    GRAPHICS,
    INPUT,
}

# Subsystems
@export var accessibility: AccessibilitySettings = AccessibilitySettings.new()
@export var audio: AudioSettings = AudioSettings.new()
@export var display: DisplaySettings = DisplaySettings.new()
@export var gameplay: GameplaySettings = GameplaySettings.new()
@export var graphics: GraphicsSettings = GraphicsSettings.new()
@export var input: InputSettings = InputSettings.new()