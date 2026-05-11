local screen = require("src.display.screen")
local ui = require("src.display.ui")
local gui = require("src.display.gui")
local SceneManager = require("src.scene_manager")

local play = {}

function play.load() end

function play.draw()
	ui.print_centered("Lifedustry", screen.pct_x(50), screen.pct_y(15))
	gui.button("Preview a world with no seed", 50, 50, 250, 35, function()
		SceneManager.switch("game")
	end)
end

function play.update() end

return play
