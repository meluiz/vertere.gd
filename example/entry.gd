extends Node

@onready var title_label: Label = $TitleLabel as Label
@onready var content_label: Label = $ContentLabel as Label

# Vertere instance for handling localization
# It holds the dictionaries for each language
var i18n = Vertere.create({
	"en": preload("res://example/dictionaries/en_us.json"),
	"pt": preload("res://example/dictionaries/pt_br.json")
})


func _ready():
	"""
	When the node enters the scene tree for the first time, 
	set the locale and print some translated text.
	"""
	
	# Set the locale to 'pt'
	var _locale = i18n.set_locale("pt")
	
	# Translate the 'welcome' key from 'intro' dictionary
	var _welcome = i18n.translate("intro.welcome", {"name": "meluiz"})
	
	# Translate the 'text' key from 'intro' dictionary
	var _text = i18n.translate("intro.text", {"name": "meluiz"})
	
	title_label.text = _welcome
	content_label.text = _text
	
	# Print the translated text
	print(_welcome) # Bem-vindo, meluiz!
	print(_text) # Eu espero que ache isso útil!


func _process(delta):
	"""
	Dummy function that is called every frame.
	This is where you can put your game logic.
	"""
	pass

