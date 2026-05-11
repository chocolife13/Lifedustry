-- chance that these will be rewritten on UI update.

local ui = {}

--- Draws `text` centred on (`x`, `y`).
---@param text     string
---@param x        number
---@param y        number
---@param rotation? number   default 0
---@param sx?      number    x scale, default 1
---@param sy?      number    y scale, defaults to `sx`
---@param ox?      number    extra x origin offset
---@param oy?      number    extra y origin offset
function ui.print_centered(text, x, y, rotation, sx, sy, ox, oy)
	local font = love.graphics.getFont()
	local text_w = font:getWidth(tostring(text))
	local text_h = font:getHeight()
	rotation = rotation or 0
	sx = sx or 1
	sy = sy or sx
	ox = ox or 0
	oy = oy or 0
	love.graphics.print(tostring(text), x, y, rotation, sx, sy, text_w / 2 + ox, text_h / 2 + oy)
end

return ui
