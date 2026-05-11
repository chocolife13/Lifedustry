-- chance that these will be rewritten on UI update.

local ui = require("src.display.ui")
local screen = require("src.display.screen")

local gui = {}

---@type table[]
local buttons = {}

--- Must be called at the start of every `love.draw()` to reset the hit-test list.
function gui.begin_frame()
	buttons = {}
end

--- Draws a labelled button and registers it for mouse hit-testing.
--- Position is expressed as a percentage of screen dimensions (0–100).
---@param text     string
---@param pct_x   number   horizontal centre, in percent
---@param pct_y   number   vertical centre, in percent
---@param width   number   button width in pixels
---@param height  number   button height in pixels
---@param callback fun()   called when the button is clicked
function gui.button(text, pct_x, pct_y, width, height, callback)
	local bx = screen.pct_x(pct_x) - width / 2
	local by = screen.pct_y(pct_y) - height / 2

	table.insert(buttons, {
		x = bx,
		y = by,
		width = width,
		height = height,
		callback = callback,
	})

	love.graphics.rectangle("line", bx, by, width, height)
	ui.print_centered(text, bx + width / 2, by + height / 2)
end

--- Internal: tests a mouse-release against every registered button and callback the button. May be a bad practice? Iterating over several buttons is bad for perfomance but I'm quite unsure (Note left by Fsy)
---@param x      number
---@param y      number
---@param button integer
function gui.mousereleased(x, y, button)
	if button ~= 1 then
		return
	end
	for _, btn in ipairs(buttons) do
		if x > btn.x and x < btn.x + btn.width and y > btn.y and y < btn.y + btn.height then
			btn.callback()
			return
		end
	end
end

function love.mousereleased(x, y, button)
	gui.mousereleased(x, y, button)
end

return gui
