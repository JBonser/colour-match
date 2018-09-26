extends CanvasLayer

export(Color) var level_colour
export(Color) var user_chosen_colour
const SCORE_MULTIPLIER = 200

func _ready():
    $UserChosenColourRect.color = user_chosen_colour
    $LevelColourRect.color = level_colour
    var colour_difference = 1.0 - abs(level_colour.h - user_chosen_colour.h)
    var score = (colour_difference * SCORE_MULTIPLIER) + globals.LevelScore
    $MarginContainer/VBoxContainer/ScoreScreenBackground/Score.text = str(int(score))

func _on_MainMenuButton_button_up():
    get_tree().change_scene("res://Main.tscn")