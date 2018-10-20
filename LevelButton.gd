extends TextureButton

var star_achieved = preload("res://artwork/star_achieved_small.png")

export(Color) var LevelColour
export var LevelStar1Score = 0
export var LevelStar2Score = 0
export var LevelStar3Score = 0
export var Number = "0"

signal start_level

func _ready():
    $MarginContainer/VBoxContainer/LevelNumber.text = Number
    var star_requirement = int(globals.Levels[Number]["star_requirement"])
    if star_requirement > globals.calculate_total_stars():
        self.disabled = true
    if globals.SaveData["completed_levels"].has(Number):
        calculate_stars(globals.SaveData["completed_levels"][Number]["stars"])
        

func _on_LevelButton_button_up():
    globals.LevelColour = Color(globals.Levels[Number]["colour"])
    globals.LevelNumber = Number
    globals.LevelStar1Score = LevelStar1Score
    globals.LevelStar2Score = LevelStar2Score
    globals.LevelStar3Score = LevelStar3Score
    get_tree().change_scene("res://Level.tscn")


func calculate_stars(stars):
    if stars >= 1:
        $MarginContainer/VBoxContainer/Stars/Star1.texture = star_achieved
    if stars >= 2:
        $MarginContainer/VBoxContainer/Stars/Star2.texture = star_achieved
    if stars >= 3:
        $MarginContainer/VBoxContainer/Stars/Star3.texture = star_achieved
