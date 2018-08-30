extends CanvasLayer

export(Color) var level_colour
export(Color) var user_chosen_colour

func _ready():
    $UserChosenColourRect.color = user_chosen_colour
    $LevelColourRect.color = level_colour

#func set_colour_properties(level_colour, user_chosen_colour):
#    $UserChosenColourRect.color = user_chosen_colour
#    $LevelColourRect.color = level_colour

func _on_MainMenuButton_button_up():
    get_tree().change_scene("res://Main.tscn")