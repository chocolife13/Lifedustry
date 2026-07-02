local screen = require("src.display.screen")
local assets = require("src.assets")
local gui = require("src.display.gui")
local ui = require("src.display.ui")
local SceneManager = require("src.scene_manager")
local funfact = require("src.data.funfact")


local main = {}

function main.load()
    main.funfact = funfact.random()
    assets.audios.music.menu:setLooping(true)
    assets.audios.music.menu:setVolume(0.1)
    assets.audios.music.menu:play()
end

function main.draw()

	love.graphics.draw(assets.textures.bg, 0, 0, 0, screen.width/640, screen.height/480)

	local logo = assets.textures.ui.logo
	love.graphics.draw(logo, screen.pct_x(50), screen.pct_y(15), 0, 0.1, 0.1, logo:getWidth() / 2, logo:getHeight() / 2)

	ui.print_percent(funfact.list[main.funfact], 50, 22)

	gui.button("Play", 50, 50, 250, 35, function()
		SceneManager.switch("play")
	end)
	gui.button("Settings", 50, 75, 250, 35, function()
		SceneManager.switch("settings")
	end)
end

function main.update() end

return main
