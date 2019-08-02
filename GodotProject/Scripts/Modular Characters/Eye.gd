tool
extends Node2D

var eyeTextures = [
	preload("res://Images/Modular Characters/Person/GrEyes/Eye_Angry.png"),
	preload("res://Images/Modular Characters/Person/GrEyes/Eye_Excited.png"),
	preload("res://Images/Modular Characters/Person/GrEyes/Eye_Furious.png"),
	preload("res://Images/Modular Characters/Person/GrEyes/Eye_MidOpen.png"),
	preload("res://Images/Modular Characters/Person/GrEyes/Eye_Open.png"),
	preload("res://Images/Modular Characters/Person/GrEyes/Eye_Sad.png")
]

#var eyeTextures = {
#	Angry = preload("res://Images/Modular Characters/Person/GrEyes/Eye_Angry.png"),
#	Excited = preload("res://Images/Modular Characters/Person/GrEyes/Eye_Excited.png"),
#	Furious = preload("res://Images/Modular Characters/Person/GrEyes/Eye_Furious.png"),
#	MidOpen = preload("res://Images/Modular Characters/Person/GrEyes/Eye_MidOpen.png"),
#	Open = preload("res://Images/Modular Characters/Person/GrEyes/Eye_Open.png"),
#	Sad = preload("res://Images/Modular Characters/Person/GrEyes/Eye_Sad.png")
#}

export(bool) onready var rightEye:bool = false setget set_right_eye,is_right_eye
func set_right_eye(isRight:bool):
	rightEye = isRight
	var sclera = get_node("Sclera")
	if (rightEye):
		sclera.scale.x = -1
	else:
		sclera.scale.x = 1
func is_right_eye():
	return rightEye

export(enums.EyeTexture) onready var expression:int = enums.EyeTexture.Open setget set_expression,get_expression
func set_expression(expr:int):
	expression = expr
	var texture:Texture = eyeTextures[expression]
	get_node("Sclera").set_texture(texture)
	get_node("Sclera/Mask").set_texture(texture)
func get_expression():
	return expression

export(Color) onready var eyeColor:Color = Color.greenyellow setget set_eye_color,get_eye_color
func set_eye_color(color:Color):
	eyeColor = color
	get_node("Iris").set_self_modulate(eyeColor)
func get_eye_color():
	return eyeColor

export(Vector2) onready var irisPosition:Vector2 = Vector2.ZERO setget set_iris_position,get_iris_position
func set_iris_position(pos:Vector2):
	if (pos.length() > 1):
		pos = pos.normalized()
	
	var iris = get_node("Iris")
	var scleraSize = get_node("Sclera").get_texture().get_size() / 2
	var irisSize = iris.get_texture().get_size() / 2
	irisPosition = pos
	iris.position = irisPosition * scleraSize - irisPosition * irisSize
func get_iris_position():
	return irisPosition

func _ready():
	set_eye_color(eyeColor)