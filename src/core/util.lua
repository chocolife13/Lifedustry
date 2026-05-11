local util = {}

--- Converts a boolean or integer flag to a display string.
---@param value boolean|integer  `true` / `1` → "On", `false` / `0` → "Off"
---@return string
function util.bool_to_string(value)
	if value == true or value == 1 then
		return "On"
	end
	if value == false or value == 0 then
		return "Off"
	end
	return "?"
end

return util
