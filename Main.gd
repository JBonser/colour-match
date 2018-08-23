extends Node

func _on_StartButton_pressed():
    $VBoxContainer/Title.hide()
    $VBoxContainer/StartButton.hide()
    $Level.start_level()
