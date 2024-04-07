extends Node

# Vertere instance for handling localization.
# It holds the dictionaries for each language.
onready var Vertere = get_node("/root/Vertere")

func _ready():
	"""
	When the node enters the scene tree for the first time, 
	set the locale and print some translated text.
	"""
	
	# Create an instance of Vertere and set the dictionaries for each language.
	# The dictionaries should have this structure:
	# {
	#   "en": {
	#       "intro": {
	#           "welcome": "Welcome, {{name}}!",
	#           "text": "I hope you find this useful!"
	#       }
	#   },
	#   "pt": {
	#       "intro": {
	#           "welcome": "Bem-vindo, {{name}}!",
	#           "text": "Eu espero que ache isso útil!"
	#       }
	#   }
	# }
	var i18n = Vertere.create({
		"en": {
			"intro": {
				"welcome": "Welcome, {{name}}!",
				"text": "I hope you find this useful!"
			}
		},
		"pt": {
			"intro": {
				"welcome": "Bem-vindo, {{name}}!",
				"text": "Eu espero que ache isso útil!"
			}
		}
	})
	
	# Set the locale to 'pt'
	# Parameters:
	# - _locale: String, the language to set as the current locale
	# Returns:
	# - String, the current locale
	var _locale = i18n.set_locale("pt")
	
	# Translate the 'welcome' key from 'intro' dictionary
	# Parameters:
	# - _key: String, the key to be translated
	# - _mix: Dictionary, the values to replace the placeholders
	# Returns:
	# - The translated string
	var _welcome = i18n.translate("intro.welcome", {"name": "meluiz"})
	
	# Translate the 'text' key from 'intro' dictionary
	# Same as '_welcome', just with different parameters
	var _text = i18n.translate("intro.text", {"name": "meluiz"})
	
	print(_welcome)
	
	$TitleLabel.text = _welcome
	$ContentLabel.text = _text
	
	# Print the translated text
	print(_welcome) # Bem-vindo, meluiz!
	print(_text) # Eu espero que ache isso útil!