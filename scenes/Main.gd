extends Node

func _ready():
    $StatsBar.calculate_stats()

func _on_StartButton_pressed():
    get_tree().change_scene("res://scenes/ui/level_select/LevelScreen.tscn")
    
func _on_ClearSaveButton_pressed():
    globals.clear_save()