local screen = require("src.display.screen")
local assets = require("src.assets")
local ui = require("src.display.ui")

local test = {}

local orientation = 0

function test.load()
	print("dev: welcome to the test scene (you can benchmark here)")
	orientation = 0
end

function test.draw()
	love.graphics.setBackgroundColor(0, 0.30, 1)
	local splash = assets.textures.splash_screen
	love.graphics.draw(
		splash,
		screen.pct_x(50),
		screen.pct_y(50),
		orientation,
		5,
		5,
		splash:getWidth() / 2,
		splash:getHeight() / 2
	)
	ui.print_centered("Lifedustry", screen.pct_x(50), screen.pct_y(10))
end

function test.update()
	orientation = orientation + 0.02
end

return test
