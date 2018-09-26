extends Button

export(Color) var LevelColour

signal start_level

func _ready():
    if globals.CompletedLevels.has(text):
        set("custom_colors/font_color", Color(0,0,0))
        

func _on_LevelButton_button_up():
    globals.LevelColour = Color(globals.Levels[text])
    globals.LevelNumber = text
    get_tree().change_scene("res://Level.tscn")
