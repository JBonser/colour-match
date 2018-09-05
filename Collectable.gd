extends Area2D

signal score


func _on_Collectable_mouse_entered():
    emit_signal("score")
    queue_free()
