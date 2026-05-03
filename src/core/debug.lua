-- this file is for dev mode is not better to rename this file to devmode.lua instead ?
local player = require("src.player")

local api = {}


function api.load()
    print("debug mod activated")
end



function api.info()
    love.graphics.setColor(0.5, 0, 0.5)
    love.graphics.print("scene: " .. scene_manager.scene, 10, 10)
    love.graphics.print("FPS: " .. love.timer.getFPS(), 10, 30)
    love.graphics.print(string.format("RAM: %.1f MB", collectgarbage("count") / 1024), 10, 50)
    love.graphics.print(string.format("VRAM: %.1f MB", love.graphics.getStats().texturememory / (1024* 1024)), 10, 70)
    love.graphics.print(string.format("DrawCalls: %d", love.graphics.getStats().drawcalls), 10, 90)
    --love.graphics.print("player x: " .. player.x .. ", y: " .. player.y, 10, 110)
    love.graphics.setColor(1, 1, 1)
end


function api.keycheck()
    if love.keyboard.isDown("f") then --go to farland
       player.x = 1073741835
       player.y = 1073741835
    end
    if love.keyboard.isDown("lshift") then
       player.speed = 10040000000
    else
        player.speed = 2000
    end
    if love.keyboard.isDown("g") then
            collectgarbage("collect")
            print("garbage collected")
    end
end
return api