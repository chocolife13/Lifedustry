scene_manager = require("src.scene.scene_manager")
assets = require("src.assets")
debug = require("src.core.debug")
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
    if dev then
        if love.keyboard.isDown("g") then
            collectgarbage("collect")
            print("garbage collected")
        end
    end
end

function love.draw() -- la partie graphique
    scene_manager.draw() 
    if dev then debug.info() end
end 