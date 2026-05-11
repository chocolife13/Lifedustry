local player = require("src.player")
local mobs = require("src.mobs")
local screen = require("src.display.screen")
local camera = require("src.camera")
local SceneManager = require("src.scene_manager")

local dev = {}

--- Dev mode: prints a notice and disables VSync for raw FPS.
function dev.load()
	print("dev mode activated")
	love.window.setVSync(0)
end

--- Draws an overlay with scene name, FPS, RAM, VRAM and draw-call counts.
function dev.info()
	love.graphics.setColor(0.5, 0, 0.5)
	love.graphics.print("scene: " .. SceneManager.current, 10, 10)
	love.graphics.print("FPS: " .. love.timer.getFPS(), 10, 30)
	love.graphics.print(string.format("RAM: %.1f MB", collectgarbage("count") / 1024), 10, 50)
	love.graphics.print(string.format("VRAM: %.1f MB", love.graphics.getStats().texturememory / (1024 * 1024)), 10, 70)
	love.graphics.print(string.format("DrawCalls: %d", love.graphics.getStats().drawcalls), 10, 90)
	love.graphics.setColor(1, 1, 1)
end

--- Handles dev-only hotkeys every frame.
function dev.keycheck()
	function love.keyreleased(key)
		if key == "f" then -- teleport to the far lands
			player.x = 1073741835
			player.y = 1073741835
		end
		if key == "r" then -- restart the game
			love.event.quit("restart")
		end
		if key == "e" then -- spawn mob
			mobs.create(
				(screen.mouse.x + camera.x) - screen.width / 2,
				(screen.mouse.y + camera.y) - screen.height / 2,
				nil,
				"npc"
			)
		end
		if key == "lshift" then -- speed boost
			player.speed = 10040000000
		else
			player.speed = 2000
		end
		if key == "g" then -- force GC
			collectgarbage("collect")
			print("dev: garbage collected")
		end
	end
end

return dev
