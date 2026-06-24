local screen = require("src.display.screen")
local ui = require("src.display.ui")
local gui = require("src.display.gui")
local util = require("src.core.util")
local SceneManager = require("src.scene_manager")
local assets = require("src.assets")

local settings = {}

local BTN_W = 250
local BTN_H = 35

function settings.load() end

function settings.draw()
	love.graphics.draw(assets.textures.bg, 0, 0, 0, screen.width/640, screen.height/480)

	ui.print_centered("Settings", screen.pct_x(50), screen.pct_y(15))
	ui.print_centered("Press Escape to go back", screen.pct_x(50), screen.pct_y(20))
	ui.print_centered(
		("Current resolution: %dx%d"):format(screen.width, screen.height),
		screen.pct_x(50),
		screen.pct_y(70)
	)

	gui.button(("Fullscreen : %s"):format(util.bool_to_string(screen.fullscreen)), 50, 50, BTN_W, BTN_H, function()
		love.window.setFullscreen(not screen.fullscreen)
	end)
	gui.button(("VSync : %s"):format(util.bool_to_string(screen.vsync)), 50, 60, BTN_W, BTN_H, function()
		love.window.setVSync(screen.vsync == 1 and 0 or 1)
	end)
end

function settings.update()
	if love.keyboard.isDown("escape") then
		SceneManager.switch("main")
	end
end

return settings
