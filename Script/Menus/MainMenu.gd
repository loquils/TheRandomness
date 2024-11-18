extends Control

signal on_play_button_pressed()

@onready var PlayButon = $MainPanelC/MenuPanelC/MenuVBoxC/ButtonVBoxC/PlayButtonMarginC/PlayButton

func _on_play_button_pressed():
	on_play_button_pressed.emit()
