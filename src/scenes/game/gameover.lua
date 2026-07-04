local screen = require("src.display.screen")
local ui = require("src.display.ui")
local gui = require("src.display.gui")
local SceneManager = require("src.scene_manager")
local assets = require("src.assets")

local gameover = {}

function gameover.load() 
	gameover.rotation = 0
end

function gameover.draw()
	ui.print_centered("Gameover bro", screen.pct_x(50), screen.pct_y(15))	
	love.graphics.draw(assets.textures.ui.annoying_cat, screen.pct_x(50), screen.pct_y(50), gameover.rotation, 0.2, 0.2, assets.textures.ui.annoying_cat:getWidth()/2, assets.textures.ui.annoying_cat:getHeight()/2)
	gui.button("Respawn", 25, 90, 250, 35, function()
		SceneManager.switch("game")
	end)
	gui.button("Ragequit", 75, 90, 250, 35, function()
		SceneManager.switch("main")
	end)
end

function gameover.update(dt) 
	gameover.rotation = gameover.rotation + 3 * dt
end

return gameover
