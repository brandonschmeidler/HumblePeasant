tool
extends Node2D

var mouthTextures = [
	preload("res://Images/Modular Character Parts/Mouth/Emotions/AngryTeeth.png"),
	preload("res://Images/Modular Character Parts/Mouth/Emotions/Frown.png"),
	preload("res://Images/Modular Character Parts/Mouth/Emotions/Scared.png"),
	preload("res://Images/Modular Character Parts/Mouth/Emotions/Smile.png"),
	preload("res://Images/Modular Character Parts/Mouth/Emotions/SmileTeeth.png"),
	preload("res://Images/Modular Character Parts/Mouth/Phonemes/AI.png"),
	preload("res://Images/Modular Character Parts/Mouth/Phonemes/E.png"),
	preload("res://Images/Modular Character Parts/Mouth/Phonemes/etc.png"),
	preload("res://Images/Modular Character Parts/Mouth/Phonemes/FV.png"),
	preload("res://Images/Modular Character Parts/Mouth/Phonemes/L.png"),
	preload("res://Images/Modular Character Parts/Mouth/Phonemes/MBP.png"),
	preload("res://Images/Modular Character Parts/Mouth/Phonemes/O.png"),
	preload("res://Images/Modular Character Parts/Mouth/Phonemes/Rest.png"),
	preload("res://Images/Modular Character Parts/Mouth/Phonemes/U.png"),
	preload("res://Images/Modular Character Parts/Mouth/Phonemes/WQ.png")
]

export(enums.MouthTexture) onready var mouthShape:int = enums.MouthTexture.Rest setget set_mouth_shape,get_mouth_shape
func set_mouth_shape(shape:int):
	mouthShape = shape
	get_node("Sprite").set_texture(mouthTextures[mouthShape])
func get_mouth_shape():
	return mouthShape