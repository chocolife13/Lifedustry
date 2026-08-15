local screen = require("src.display.screen")
local ui = require("src.display.ui")
local gui = require("src.display.gui")
local SceneManager = require("src.scene_manager")
local assets = require("src.assets")

local play = {}

function play.load() 
	gui.reset()
gui.add({type = "button",
			text = "Preview a world with no seed",
			w = 250,
			h = 35,
			x = 50, 
			y = 50,
			width = 230,
			height = 35,
			hover = 1.30,
			callback = function() SceneManager.switch("game") end
		})
end

function play.draw()
	love.graphics.draw(assets.textures.bg, 0, 0, 0, screen.width/640, screen.height/480)
	ui.print_centered("Lifedustry", screen.pct_x(50), screen.pct_y(15))
	gui.draw()
end

function play.update(dt) 
	gui.update(dt)
end

return play
