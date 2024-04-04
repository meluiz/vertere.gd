extends Node

# Utility function to get a value from a nested Dictionary using a dot-separated key string
#
# Parameters:
# - `_object`: Dictionary to be searched
# - `_key`: String with the key(s) separated by dots
#
# Returns:
# - The value found in the nested Dictionary, or null if not found
func deep(_object: Dictionary, _key: String):
	var _val = ''  # Initialize result value
	var _obj = _object  # Initialize object to search
	var _keys: PackedStringArray = _key.rsplit('.')  # Split the key string into an array of keys
	
	for _k in _keys:  # Iterate over the keys
		if _obj.has(_k):  # If the current key exists in the object
			_obj = _obj.get(_k)  # Get the value of the current key
	
	return _obj  # Return the final value

# Utility function to replace placeholders in a string with values from a Dictionary
#
# Parameters:
# - `_input`: String with placeholders to be replaced
# - `_mix`: Dictionary with the values to replace the placeholders
#
# Returns:
# - `_input` string with the placeholders replaced by the values
var _regex = RegEx.new()  # Regular expression for matching placeholders


func tmpl(_input: String, _mix: Dictionary) -> String:
	_regex.compile("{{(.*?)}}")  # Compile the regular expression
	
	var _matches = _regex.search_all(_input)  # Get all matches
	
	for _match in _matches:  # Iterate over the matches
		var _m = _match.get_string(0)  # Get the full match
		var _k = _match.get_string(1)  # Get the key inside the match
		
		if _mix.has(_k):  # If the key exists in the mix
			_input = _input.replacen(_m, _mix.get(_k))  # Replace the match with the value
	
	return _input  # Return the final string

