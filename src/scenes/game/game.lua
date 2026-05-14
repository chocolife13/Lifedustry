local player = require("src.player")
local mobs = require("src.mobs")
local camera = require("src.camera")
local screen = require("src.display.screen")

local game = {}

function game.load() end

function game.draw()
	camera.draw()
end

function game.update(dt)
	mobs.update(dt)
	player.update(dt)
	camera.update(dt)
end

function love.keypressed(key)
    if key == "f11" then
        screen.fullscreen = not screen.fullscreen
        love.window.setFullscreen(screen.fullscreen)
    end
end
return game
