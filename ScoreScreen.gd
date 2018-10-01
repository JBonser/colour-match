extends CanvasLayer

var star_achieved = preload("res://artwork/star_achieved.png")

export(Color) var level_colour
export(Color) var user_chosen_colour
const SCORE_MULTIPLIER = 200

func _ready():
    $BackgroundContainer/UserChosenColourRect.color = user_chosen_colour
    $BackgroundContainer/LevelColourRect.color = level_colour
    var colour_difference = 1.0 - abs(level_colour.h - user_chosen_colour.h)
    var score = (colour_difference * SCORE_MULTIPLIER) + globals.LevelScore
    $MarginContainer/VBoxContainer/ScoreScreenBackground/VBoxContainer/Score.text = str(int(score))
    display_stars(score)

func display_stars(score):
    if score >= globals.LevelStar1Score:
        $MarginContainer/VBoxContainer/ScoreScreenBackground/VBoxContainer/Stars/Star1.texture = star_achieved
    if score >= globals.LevelStar2Score:
        $MarginContainer/VBoxContainer/ScoreScreenBackground/VBoxContainer/Stars/Star2.texture = star_achieved
    if score >= globals.LevelStar3Score:
        $MarginContainer/VBoxContainer/ScoreScreenBackground/VBoxContainer/Stars/Star3.texture = star_achieved

func _on_MainMenuButton_button_up():
    get_tree().change_scene("res://Main.tscn")