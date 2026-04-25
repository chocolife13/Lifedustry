-- this file is for dev mode is not better to rename this file to devmode.lua instead ?
local player = require("src.player")

api = {}
function api.info()
    love.graphics.print("scene: " .. scene_manager.scene, 10, 10)
    love.graphics.print("FPS: " .. love.timer.getFPS(), 10, 30)
    love.graphics.print(string.format("RAM: %.1f MB", collectgarbage("count") / 1024), 10, 50)
    love.graphics.print(string.format("VRAM: %.1f MB", love.graphics.getStats().texturememory / (1024* 1024)), 10, 70)
    love.graphics.print(string.format("DrawCalls: %d", love.graphics.getStats().drawcalls), 10, 90)
    --love.graphics.print("player x: " .. player.x .. ", y: " .. player.y, 10, 110)
end
return api