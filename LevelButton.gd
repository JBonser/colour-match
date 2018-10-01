extends Button

export(Color) var LevelColour
export var LevelStar1Score = 0
export var LevelStar2Score = 0
export var LevelStar3Score = 0

signal start_level

func _ready():
    if globals.CompletedLevels.has(text):
        set("custom_colors/font_color", Color(0,0,0))
        

func _on_LevelButton_button_up():
    globals.LevelColour = Color(globals.Levels[text])
    globals.LevelNumber = text
    globals.LevelStar1Score = LevelStar1Score
    globals.LevelStar2Score = LevelStar2Score
    globals.LevelStar3Score = LevelStar3Score
    get_tree().change_scene("res://Level.tscn")
