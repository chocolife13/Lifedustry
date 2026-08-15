local screen = require("src.display.screen")
local assets = require("src.assets")
local gui = require("src.display.gui")
local ui = require("src.display.ui")
local SceneManager = require("src.scene_manager")
local funfact = require("src.data.funfact")


local main = {}

function main.load()
	gui.reset()
    main.funfact = funfact.random()
    assets.audios.music.menu:setLooping(true)
    assets.audios.music.menu:setVolume(0.1)
    assets.audios.music.menu:play()
	gui.add({type = "button",
			text = "Play",
			w = 230,
			h = 35,
			x = 50, 
			y = 50,
			width = 230,
			height = 35,
			hover = 1.30,
			callback = function() SceneManager.switch("play") end
		})
	gui.add({type = "button",
			text = "Settings",
			w = 230,
			h = 35,
			x = 50, 
			y = 75,
			width = 230,
			height = 35,
			hover = 1.30,
			callback = function() SceneManager.switch("settings") end
		})
end

function main.draw()
	
	love.graphics.draw(assets.textures.bg, 0, 0, 0, screen.width/640, screen.height/480)

	local logo = assets.textures.ui.logo
	love.graphics.draw(logo, screen.pct_x(50), screen.pct_y(15), 0, 0.1, 0.1, logo:getWidth() / 2, logo:getHeight() / 2)

	ui.print_percent(funfact.list[main.funfact], 50, 22)

	gui.draw()
	
end

function main.update(dt) 
	gui.update(dt)
end

return main
