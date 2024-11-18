extends Node

@onready var MainMenu : Control = $MainMenuCanvasLayer/MainMenu
@onready var SubViewC = $SubViewportC

# Called when the node enters the scene tree for the first time.
func _ready():
	MainMenu.connect("on_play_button_pressed", OnPlayButtonPressed)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func OnPlayButtonPressed():
	MainMenu.hide()
	SubViewC.show()
