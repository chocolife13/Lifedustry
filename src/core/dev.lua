local player = require("src.player")
local mobs = require("src.mobs")
local screen = require("src.display.screen")
local camera = require("src.camera")
local SceneManager = require("src.scene_manager")
local keys = require("src.data.keys")
local time = require("src.time")
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
    love.graphics.print("HP: " .. player.hp, 10, 130)
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
        if key == "e" then 
            mobs.create({x = (screen.mouse.x + camera.x) - screen.width / 2, y = (screen.mouse.y + camera.y) - screen.height / 2, item = "rock", type = "item"})
        end
        if key == "a" then 
        	mobs.create({x = (screen.mouse.x + camera.x) - screen.width / 2, y = (screen.mouse.y + camera.y) - screen.height / 2, item = "apple", type = "item"})
        end

        if key == "m" then 
        	mobs.create({x = (screen.mouse.x + camera.x) - screen.width / 2, y = (screen.mouse.y + camera.y) - screen.height / 2, item = "water", type = "item"})
        end
        
        if key == "l" then 
        	mobs.create({x = (screen.mouse.x + camera.x) - screen.width / 2, y = (screen.mouse.y + camera.y) - screen.height / 2, item = "slingshot", type = "item"})
        end

        if key == "b" then
            for i = 1, 100 do
        	    mobs.create({x = (screen.mouse.x + camera.x) - screen.width / 2, y = (screen.mouse.y + camera.y) - screen.height / 2, type = "snowman"})
            end
        end
        if key == "n" then -- spawn mob
        	mobs.create({x = (screen.mouse.x + camera.x) - screen.width / 2, y = (screen.mouse.y + camera.y) - screen.height / 2, item = "turnip", type = "item"})
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
        if love.keyboard.isDown("k") then
            time.speed = 5000
        else
            time.speed = 50
        end

       
    


end

return dev
