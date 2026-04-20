scene_manager = require("src.scene.scene_manager")
assets = require("src.assets")
local args_manager = require("src.args_manager")

-- Ces trois fonctions constituent la boucle principale du jeu

function love.load(args) -- loading the game
    args_manager.start_scene(args)
    if dev then
        print("debug mod activated")
    end
    assets.preload()
    scene_manager.load() -- start the scene set in arg manager
end


function love.update(dt) 
    scene_manager.update(dt) 
    
end


function love.draw() -- la partie graphique
    scene_manager.draw() 
    if dev then
        love.graphics.print("scene: " .. scene_manager.scene, 10, 10)
        love.graphics.print("FPS: " .. love.timer.getFPS(), 10, 30)
        love.graphics.print(string.format("RAM: %.1f MB", collectgarbage("count") / 1024), 10, 50)
        love.graphics.print(string.format("VRAM: %.1f MB", love.graphics.getStats().texturememory / (1024* 1024)), 10, 70)
        love.graphics.print(string.format("DrawCalls: %d", love.graphics.getStats().drawcalls), 10, 90)
    end
end 