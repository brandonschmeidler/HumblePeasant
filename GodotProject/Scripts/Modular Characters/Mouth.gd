tool
extends Node2D

var mouthTextures = [
	preload("res://Images/Modular Characters/Person/GrMouths/GrMouthEmotions/Mouth_Angry_Teeth.png"),
	preload("res://Images/Modular Characters/Person/GrMouths/GrMouthEmotions/Mouth_Frown.png"),
	preload("res://Images/Modular Characters/Person/GrMouths/GrMouthEmotions/Mouth_Scared.png"),
	preload("res://Images/Modular Characters/Person/GrMouths/GrMouthEmotions/Mouth_Smile.png"),
	preload("res://Images/Modular Characters/Person/GrMouths/GrMouthEmotions/Mouth_Smile_Teeth.png"),
	preload("res://Images/Modular Characters/Person/GrMouths/GrMouthPhenomes/AI.png"),
	preload("res://Images/Modular Characters/Person/GrMouths/GrMouthPhenomes/E.png"),
	preload("res://Images/Modular Characters/Person/GrMouths/GrMouthPhenomes/etc.png"),
	preload("res://Images/Modular Characters/Person/GrMouths/GrMouthPhenomes/FV.png"),
	preload("res://Images/Modular Characters/Person/GrMouths/GrMouthPhenomes/L.png"),
	preload("res://Images/Modular Characters/Person/GrMouths/GrMouthPhenomes/MBP.png"),
	preload("res://Images/Modular Characters/Person/GrMouths/GrMouthPhenomes/O.png"),
	preload("res://Images/Modular Characters/Person/GrMouths/GrMouthPhenomes/Rest.png"),
	preload("res://Images/Modular Characters/Person/GrMouths/GrMouthPhenomes/U.png"),
	preload("res://Images/Modular Characters/Person/GrMouths/GrMouthPhenomes/WQ.png")
]

export(enums.MouthTexture) onready var mouthShape:int = enums.MouthTexture.Rest setget set_mouth_shape,get_mouth_shape
func set_mouth_shape(shape:int):
	mouthShape = shape
	get_node("Sprite").set_texture(mouthTextures[mouthShape])
func get_mouth_shape():
	return mouthShape