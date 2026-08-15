local screen = require("src.display.screen")
local ui = require("src.display.ui")
local gui = require("src.display.gui")
local util = require("src.core.util")
local SceneManager = require("src.scene_manager")
local assets = require("src.assets")

local settings = {}

function settings.load() 
	gui.reset()
gui.add({type = "button",
			id = "fullscreen",
			text = screen.fullscreen,
			w = 250,
			h = 35,
			x = 50, 
			y = 50,
			width = 230,
			height = 35,
			hover = 1.30,
			callback = function() love.window.setFullscreen(not screen.fullscreen) end
		})
gui.add({type = "button",
			id = "vsync",
			text = screen.vsync,
			w = 250,
			h = 35,
			x = 50, 
			y = 60,
			width = 230,
			height = 35,
			hover = 1.30,
			callback = function() love.window.setVSync(screen.vsync == 1 and 0 or 1) end
		})
end

function settings.draw()
	love.graphics.draw(assets.textures.bg, 0, 0, 0, screen.width/640, screen.height/480)

	ui.print_centered("Settings", screen.pct_x(50), screen.pct_y(15))
	ui.print_centered("Press Escape to go back", screen.pct_x(50), screen.pct_y(20))
	ui.print_centered(
		("Current resolution: %dx%d"):format(screen.width, screen.height),
		screen.pct_x(50),
		screen.pct_y(70)
	)
	gui.draw()
end

function settings.update(dt)
	gui.update(dt)
	gui.edit("vsync", "text", ("VSync : %s"):format(util.bool_to_string(screen.vsync)))
	gui.edit("fullscreen", "text", ("Fullscreen : %s"):format(util.bool_to_string(screen.fullscreen)))

	if love.keyboard.isDown("escape") then
		gui.reset()
		SceneManager.switch("main")
	end
end

return settings
