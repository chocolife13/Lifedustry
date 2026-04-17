scene_manager = require("src.scene.scene_manager")
local assets = require("src.assets")
local args_manager = require("src.args_manager")

-- Ces trois fonctions constituent la boucle principale du jeu

function love.load(args)
    args_manager.start_scene(args)
    if dev then
        print("debug mod activated")
    end
    assets.preload()
    scene_manager.load() -- start the actual scene
end


function love.update(dt) -- la partie mise à jour
    scene_manager.update(dt) 
    if love.keyboard.isDown("f") then
        love.window.showMessageBox("A info from your keeboard", "Have you pressed f ?", info)
    end
end


function love.draw() -- la partie graphique
    scene_manager.draw() 
    if dev then
        love.graphics.print("scene: " .. scene_manager.scene, 10, 10)
        love.graphics.print("FPS: " .. love.timer.getFPS(), 10, 30)
    end
end