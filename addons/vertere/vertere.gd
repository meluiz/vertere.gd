extends Node

# Holds the current locale
var _locale: String = ''

# Holds the dictionary of dictionaries for each language
var _tree: Dictionary = {}


# Sets the table for a specific language
# 
# @param _lang: String, the language to set the table for
# @param _table: Dictionary, the table to be set
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
func get_table(_lang: String) -> Dictionary:
	return _tree[_lang]

# Sets the current locale
#
# @param _lang: String, the language to set as the current locale
# @return String, the current locale
func set_locale(_lang: String) -> String:
	# If no language is provided, return the current locale
	if _lang.is_empty():
		return _locale
	
	# Set the current locale and return it
	_locale = _lang
	return _lang


# Translates a key using the current locale
#
# @param _key: String, the key to be translated
# @param params: Dictionary, the parameters to replace placeholders in the translation
# @return Variant, the translated value
func translate(_key: String, params: Dictionary = {}):
	# Get the dictionary for the current locale
	var _dict = _tree.get(_locale, null)
	
	# If the key is found in the dictionary, translate it
	var _val = Utils.deep(_dict, _key)
	
	# If the value is a function, call it with the parameters
	if _val != null:
		if typeof(_val) == TYPE_CALLABLE:
			return _val.call_func(params)
		
		# If the value is a string, replace placeholders in the string with the parameters
		elif typeof(_val) == TYPE_STRING:
			return Utils.tmpl(_val, params)
	
	return _val


# Creates a new Vertere instance
#
# @param _object: Dictionary, the dictionaries for each language
# @return Vertere, a new Vertere instance
func create(_object: Dictionary):
	# Create a new table for each language in the object
	for _key in _object:
		_tree[_key] = _object[_key].data
	
	return Vertere

