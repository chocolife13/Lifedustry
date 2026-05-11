local player = require("src.player")
local mobs = require("src.mobs")
local camera = require("src.camera")

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

return game
