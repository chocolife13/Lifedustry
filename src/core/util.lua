local util = {}

--- Converts a boolean or integer flag to a display string.
---@param value boolean|integer  `true` / `1` → "On", `false` / `0` → "Off"
---@return string
function util.bool_to_string(value)
	if value == true or value == 1 then
		return locales.texts.on
	end
	if value == false or value == 0 then
		return locales.texts.off
	end
	return "?"
end

return util
