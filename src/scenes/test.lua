local screen = require("src.display.screen")
local assets = require("src.assets")
local ui = require("src.display.ui")
local gui = require("src.display.gui")

local test = {}


function test.load()
	gui.reset()
	gui.add({type = "input",
			text = "Text here",
			selected = false,
			id = "test",
			w = 230,
			h = 35,
			x = 50, 
			y = 25,
			width = 230,
			height = 35,
			hover = 1.30,
			callback = function() end
		})


gui.add({type = "button",
			text = "Enter",
			w = 230,
			h = 35,
			x = 50, 
			y = 75,
			width = 230,
			height = 35,
			hover = 1.30,
			callback = function() print(gui.get("test", "text"))end
		})
end

function test.draw()
	love.graphics.setBackgroundColor(0, 0.30, 1)
	ui.print_centered("Lifedustry", screen.pct_x(50), screen.pct_y(10))
	gui.draw()
end

function test.update(dt)
	gui.update(dt)
end

return test
