local screen = require("src.display.screen")
local lmath = require("src.core.math")
local map = require("src.map")
local player = require("src.player")
local mobs = require("src.mobs")

local camera = {}

camera.x = 0
camera.y = 0
camera.zoom = 1

function camera.draw()
	love.graphics.push()
	love.graphics.translate(-camera.x + (screen.width / 2) * camera.zoom, -camera.y + (screen.height / 2) * camera.zoom)
	love.graphics.scale(camera.zoom, camera.zoom)

	map.draw(camera.x, camera.y, camera.zoom)
	player.draw()
	mobs.draw()

	love.graphics.setBackgroundColor(0, 0, 0, 0)
	love.graphics.pop()
end

function camera.update(dt)
	camera.x = lmath.cerp(camera.x, player.x, 18 * dt)
	camera.y = lmath.cerp(camera.y, player.y, 18 * dt)

	if love.keyboard.isDown("+") then
		camera.zoom = camera.zoom + 0.01
	end
	if love.keyboard.isDown("-") then
		camera.zoom = camera.zoom - 0.01
	end
end

return camera
