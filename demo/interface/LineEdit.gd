extends LineEdit


# Called when the node enters the scene tree for the first time.
func _ready():
	var http = get_node("HTTPRequest")
	http.request("http://afternoon-retreat-35681.herokuapp.com/ips")
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_HTTPRequest_request_completed(result, response_code, headers, body):
	var json = JSON.parse(body.get_string_from_utf8())
	print(json.result)
	self.text = json.result.ip
