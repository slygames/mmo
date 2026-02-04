extends RichTextLabel
class_name Log

func _message(message: String, color: Color = Color.WHITE):
	append_text("[color=#%s]%s[/color]\n" % [color.to_html(false), message])

func info(message : String):
	_message(message, Color.WHITE)
	
func warning(message : String):
	_message(message, Color.YELLOW)
	
func error(message : String):
	_message(message, Color.ORANGE_RED)
	
func success(message : String):
	_message(message, Color.GREEN)

#todo: this is a bit innefficient as _message() wraps the white color tags from the _message, better to have seperate functions or inline seperate append_text code instead of using _message
func chat(sender_name: String, message : String):
	_message("[color=#%s]%s:[/color] [i]%s[/i]" % [Color.CORNFLOWER_BLUE.to_html(false), sender_name, message])
