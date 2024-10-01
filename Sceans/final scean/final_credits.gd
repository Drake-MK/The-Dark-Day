extends Label

var credits = "Seeds of doubts planted into his memories, was he really the one told by everyone or is he the one in his memories."

func _ready(): 
	scroll_text(credits)	
func scroll_text(t):
	visible_characters = 0
	text = t
	for i in text:
		visible_characters+=1
		await get_tree().create_timer(0.1).timeout
		pass

	
	
