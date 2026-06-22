local player = require("src.player")
local mobs = require("src.mobs")
local screen = require("src.display.screen")
local camera = require("src.camera")
local SceneManager = require("src.scene_manager")
local keys = require("src.data.keys")
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
    love.graphics.print("Entity Count: " .. tostring(#mobs.list), 10, 110)
    love.graphics.setColor(1, 1, 1)
end

--- Handles dev-only hotkeys every frame.
function dev.keycheck()
    function love.keyreleased(key)
        if key == keys.dev.farland then -- teleport to the far lands
            player.x = 1073741835
            player.y = 1073741835
        end
        if key == keys.dev.restart then -- restart the game
            love.event.quit("restart")
        end
        if key == "u" then
            for _, mob in ipairs(mobs.list) do
                mob.x = player.x
                mob.y = player.y
            end
        end
        if key == "t" then
            for _, mob in ipairs(mobs.list) do
                if mob.type == "gilbert" then
                    player.x = mob.x
                    player.y = mob.y
                end
            end
        end
        if key == "e" then -- spawn mob
            mobs.create(
                (screen.mouse.x + camera.x) - screen.width / 2, (screen.mouse.y + camera.y) - screen.height / 2, "rock",
                "item"
            )
        end
        if key == "a" then -- spawn mob
            mobs.delete(2)
        end

        if key == "g" then -- force GC
            collectgarbage("collect")
            print("dev: garbage collected")
        end
    end
    if love.keyboard.isDown(keys.dev.speed) then
        player.speed = 5000
    else
        player.speed = 500
    end
end

return dev
