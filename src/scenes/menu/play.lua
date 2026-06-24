local screen = require("src.display.screen")
local ui = require("src.display.ui")
local gui = require("src.display.gui")
local SceneManager = require("src.scene_manager")
local assets = require("src.assets")

local play = {}

function play.load() end

function play.draw()
	love.graphics.draw(assets.textures.bg, 0, 0, 0, screen.width/640, screen.height/480)
	ui.print_centered("Lifedustry", screen.pct_x(50), screen.pct_y(15))
	gui.button("Preview a world with no seed", 50, 50, 250, 35, function()
		SceneManager.switch("game")
	end)
end

function play.update() end

return play
