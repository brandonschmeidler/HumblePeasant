tool
extends Node2D

export(Color) onready var skinColor:Color = Color("#ffffe0bd") setget set_skin_color,get_skin_color
func set_skin_color(color:Color):
	skinColor = color
	get_node("Groin").set_self_modulate(skinColor)
	get_node("Groin/Body").set_self_modulate(skinColor)
	get_node("Groin/Body/Head").set_self_modulate(skinColor)
	get_node("Groin/Body/LeftArm").set_self_modulate(skinColor)
	get_node("Groin/Body/LeftArm/Forearm").set_self_modulate(skinColor)
	get_node("Groin/Body/LeftArm/Forearm/Hand").set_self_modulate(skinColor)
	get_node("Groin/Body/RightArm").set_self_modulate(skinColor)
	get_node("Groin/Body/RightArm/Forearm").set_self_modulate(skinColor)
	get_node("Groin/Body/RightArm/Forearm/Hand").set_self_modulate(skinColor)
	get_node("Groin/LeftLeg").set_self_modulate(skinColor)
	get_node("Groin/LeftLeg/Calf").set_self_modulate(skinColor)
	get_node("Groin/LeftLeg/Calf/Foot").set_self_modulate(skinColor)
	get_node("Groin/RightLeg").set_self_modulate(skinColor)
	get_node("Groin/RightLeg/Calf").set_self_modulate(skinColor)
	get_node("Groin/RightLeg/Calf/Foot").set_self_modulate(skinColor)
func get_skin_color():
	return skinColor

export(Color) onready var eyeColor:Color = Color("#ff6ca580") setget set_eye_color,get_eye_color
func set_eye_color(color:Color):
	eyeColor = color
	get_node("Groin/Body/Head/LeftEye").set_eye_color(eyeColor)
	get_node("Groin/Body/Head/RightEye").set_eye_color(eyeColor)
func get_eye_color():
	return eyeColor

export(enums.PersonEmotion) onready var emotion:int = enums.PersonEmotion.Neutral setget set_emotion,get_emotion
func set_emotion(emote:int):
	emotion = emote
	var eyeExpression:int = enums.EyeTexture.Open
	var mouthShape:int = enums.MouthTexture.Rest
	var irisPos:Vector2 = Vector2.ZERO
	
	match emotion:
		enums.PersonEmotion.Angry:
			eyeExpression = enums.EyeTexture.Furious
			mouthShape = enums.MouthTexture.AngryTeeth
			irisPos.x = 0.4
		enums.PersonEmotion.Evil:
			eyeExpression = enums.EyeTexture.Angry
			mouthShape = enums.MouthTexture.SmileTeeth
			irisPos.y = 0.3
		enums.PersonEmotion.Happy:
			mouthShape = enums.MouthTexture.Smile
		enums.PersonEmotion.Jizz:
			eyeExpression = enums.EyeTexture.Excited
			mouthShape = enums.MouthTexture.FV
			irisPos.y = -0.5
		enums.PersonEmotion.Neutral:
			pass
	
	var leftEye = get_node("Groin/Body/Head/LeftEye")
	var rightEye = get_node("Groin/Body/Head/RightEye")
	leftEye.set_expression(eyeExpression)
	leftEye.set_iris_position(irisPos)
	rightEye.set_expression(eyeExpression)
	rightEye.set_iris_position(Vector2(-irisPos.x,irisPos.y))
	get_node("Groin/Body/Head/Mouth").set_mouth_shape(mouthShape)
func get_emotion():
	return emotion

func _ready():
	set_skin_color(skinColor)
	set_eye_color(eyeColor)
	set_emotion(emotion)