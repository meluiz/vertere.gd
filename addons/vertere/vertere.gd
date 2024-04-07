extends Node

# Holds the current locale
var _locale: String = ''

# Holds the dictionary of dictionaries for each language
var _tree: Dictionary = {}

# Gets the Vertere singleton
onready var Vertere = get_node("/root/Vertere")

# Sets the table for a specific language
# 
# @param _lang: String, the language to set the table for
# @param _table: Dictionary, the table to be set
# @example:
# 		obj.set_table("en", { "key": "value" })
func set_table(_lang: String, _table: Dictionary) -> void:
	# If the language already has a table, update it
	if _tree.has(_lang):
		for _key in _table:
			_tree[_lang][_key] = _table[_key]
	# If not, create a new table for the language
	else:
		_tree[_lang] = _table.duplicate()


# Gets the table for a specific language
#
# @param _lang: String, the language to get the table for
# @return Dictionary, the table for the language
# @example:
# 		var table = obj.get_table("en")
func get_table(_lang: String) -> Dictionary:
	return _tree[_lang]

# Sets the current locale
#
# @param _lang: String, the language to set as the current locale
# @return String, the current locale
# @example:
# 		obj.set_locale("en")
func set_locale(_lang: String) -> String:
	# If no language is provided, return the current locale
	if _lang.empty():
		return _locale
	
	# Set the current locale and return it
	_locale = _lang
	return _lang


# Translates a key using the current locale
#
# @param _key: String, the key to be translated
# @param params: Dictionary, the parameters to replace placeholders in the translation
# @return Variant, the translated value
# @example:
# 		var translated_value = obj.translate("key", { "placeholder": "value" })
func translate(_key: String, params: Dictionary = {}):
	# Get the dictionary for the current locale
	var _dict = _tree.get(_locale, null)
	
	# If the key is found in the dictionary, translate it
	var _val = Utils.deep(_dict, _key)
	
	# If the value is a string, replace placeholders in the string with the parameters
	if _val != null:
		if typeof(_val) == TYPE_STRING:
			return Utils.tmpl(_val, params)
		# If the value is a function, call it with the parameters
		elif _val.has_method("call_func"):
			return _val.call_func(params)
	
	return _val


# Creates a new Vertere instance
#
# @param _object: Dictionary, the dictionaries for each language
# @return Vertere, a new Vertere instance
# @example:
# 		var obj_instance = obj.create({ "en": { "key": "value" }, "pt": { "key": "valor" } })
func create(_object: Dictionary):
	# Create a new table for each language in the object
	for _key in _object:
		_tree[_key] = _object[_key]
	
	return Vertere

