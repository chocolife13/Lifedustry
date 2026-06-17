local screen = require("src.display.screen")
local lmath = require("src.core.math")
local map = require("src.map")
local player = require("src.player")
local mobs = require("src.mobs")
local keys = require("src.data.keys")
local camera = {}

camera.x = 0
camera.y = 0
camera.zoom = 1

function camera.draw()
	love.graphics.push()
	love.graphics.translate((-camera.x*camera.zoom +((screen.width) / 2) ), (-camera.y * camera.zoom + (screen.height / 2)))
	love.graphics.scale(camera.zoom, camera.zoom)

	map.draw(camera.x*camera.zoom, camera.y*camera.zoom, camera.zoom)
	player.draw()
	mobs.draw()

	love.graphics.setBackgroundColor(0, 0, 0, 0)
	love.graphics.pop()
end

function camera.update(dt)
	camera.x = lmath.cerp(camera.x, player.x, 18 * dt)
	camera.y = lmath.cerp(camera.y, player.y, 18 * dt)

	if love.keyboard.isDown(keys.camera.zoomin) then
		camera.zoom = camera.zoom + 0.01
	end
	if love.keyboard.isDown(keys.camera.zoomout) then
		camera.zoom = camera.zoom - 0.01
	end
end

return camera
