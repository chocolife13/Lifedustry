local screen = require("src.display.screen")
local ui = require("src.display.ui")
local gui = require("src.display.gui")
local SceneManager = require("src.scene_manager")
local assets = require("src.assets")
local map = require("src.map")
local client = require("src.multiplayer.client")

local play_online = {}

function play_online.load() 
	gui.reset()
	gui.add({type = "input",
			text = "127.0.0.1",
			id = "ip",
			w = 250,
			h = 35,
			x = 50, 
			y = 50,
			width = 230,
			height = 35,
			hover = 1.30,
		})
		gui.add({type = "input",
			text = "username",
			id = "username",
			w = 250,
			h = 35,
			x = 50, 
			y = 25,
			width = 230,
			height = 35,
			hover = 1.30,
		})
gui.add({type = "button",
			text = "enter with ip",
			w = 250,
			h = 35,
			x = 50, 
			y = 75,
			width = 230,
			height = 35,
			hover = 1.30,
			callback = function()
				SceneManager.switch("game_online")
			end
		})
end

function play_online.draw()
	love.graphics.draw(assets.textures.bg, 0, 0, 0, screen.width/640, screen.height/480)
	ui.print_centered("Lifedustry", screen.pct_x(50), screen.pct_y(15))
	gui.draw()
end

function play_online.update(dt) 
	gui.update(dt)
end

return play_online
