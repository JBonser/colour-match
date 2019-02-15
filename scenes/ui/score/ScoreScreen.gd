extends CanvasLayer

var star_achieved = preload("res://artwork/star_achieved.png")

export(Color) var level_colour
export(Color) var user_chosen_colour
const SCORE_MULTIPLIER = 200
var achieved_stars = 0
var achieved_score = 0
func _ready():
    $BackgroundContainer/UserChosenColourRect.color = user_chosen_colour
    $BackgroundContainer/LevelColourRect.color = level_colour
    var colour_difference = 1.0 - abs(level_colour.h - user_chosen_colour.h)
    var score = (colour_difference * SCORE_MULTIPLIER) + globals.LevelScore
    achieved_score = int(score)
    $MarginContainer/VBoxContainer/ScoreScreenBackground/VBoxContainer/Score.text = str(achieved_score)
    calculate_stars(achieved_score)
    save_scores()

func save_scores():
    var level_data = {}
    if globals.SaveData["completed_levels"].has(globals.LevelNumber):
        level_data = globals.SaveData["completed_levels"][globals.LevelNumber]
        if level_data["stars"] < achieved_stars:
             level_data["stars"] = achieved_stars
        if level_data["score"] < achieved_score:
            level_data["score"] = achieved_score
    else:
        level_data = {
            "score": achieved_score,
            "stars": achieved_stars
        }
    globals.SaveData["completed_levels"][globals.LevelNumber] = level_data
    globals.save_game()
    
func calculate_stars(score):
    if score >= globals.LevelStar1Score:
        $MarginContainer/VBoxContainer/ScoreScreenBackground/VBoxContainer/Stars/Star1.texture = star_achieved
        achieved_stars = 1
    if score >= globals.LevelStar2Score:
        $MarginContainer/VBoxContainer/ScoreScreenBackground/VBoxContainer/Stars/Star2.texture = star_achieved
        achieved_stars = 2
    if score >= globals.LevelStar3Score:
        $MarginContainer/VBoxContainer/ScoreScreenBackground/VBoxContainer/Stars/Star3.texture = star_achieved
        achieved_stars = 3


func _on_MainMenuButton_button_up():
    get_tree().change_scene("res://scenes/Main.tscn")