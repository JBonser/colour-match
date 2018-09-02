extends Button

export(Color) var LevelColour

signal start_level

func _on_LevelButton_button_up():
    globals.LevelColour = Color(globals.Levels[text])
    get_tree().change_scene("res://Level.tscn")
