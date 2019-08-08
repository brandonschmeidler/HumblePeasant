tool extends Node2D

var eyeTextures = [
	preload("res://Images/Modular Character Parts/Eye/Angry.png"),
	preload("res://Images/Modular Character Parts/Eye/Furious.png"),
	preload("res://Images/Modular Character Parts/Eye/Open.png"),
	preload("res://Images/Modular Character Parts/Eye/OpenHalf.png"),
	preload("res://Images/Modular Character Parts/Eye/Squint.png"),
	preload("res://Images/Modular Character Parts/Eye/SquintHalf.png")
]

var irisTexture = preload("res://Images/Modular Character Parts/Eye/Iris.png")

export(enums.EyeTexture) onready var expression:int = enums.EyeTexture.Open setget set_expression,get_expression
func set_expression(expr:int):
	expression = expr
	var texture:Texture = eyeTextures[expression]
	get_node("Sprite").set_texture(texture)
func get_expression():
	return expression

export(Vector2) onready var irisPosition:Vector2 = Vector2.ZERO setget set_iris_position,get_iris_position
func set_iris_position(pos:Vector2):
	if (pos.length() > 1):
		pos = pos.normalized()
	
	var scleraSize = get_node("Sprite").get_texture().get_size() / 2
	var irisSize = irisTexture.get_size() / 2
	irisPosition = pos
	var material:ShaderMaterial = get_node("Sprite").get_material()
	material.set_shader_param("irisPosition",irisPosition * get_node("Sprite").scale * scleraSize)
func get_iris_position():
	return irisPosition

export(Color) onready var eyeColor:Color = Color.greenyellow setget set_eye_color,get_eye_color
func set_eye_color(color:Color):
	eyeColor = color
	get_node("Sprite").get_material().set_shader_param("irisColor",eyeColor)
func get_eye_color():
	return eyeColor

export(bool) onready var rightEye:bool = false setget set_right_eye,is_right_eye
func set_right_eye(isRight:bool):
	rightEye = isRight
	var sclera = get_node("Sprite")
	if (rightEye):
		sclera.scale.x = -1
	else:
		sclera.scale.x = 1
func is_right_eye():
	return rightEye