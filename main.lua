local scene_manager = require("src.scene.scene_manager")
local assets = require("src.assets")
local args_manager = require("src.args_manager")

-- Ces trois fonctions constituent la boucle principale du jeu

function love.load(args)
    args_manager.start_scene(args)
    assets.preload()
    scene_manager.load() -- start the actual scene
end


function love.update(dt) -- la partie mise à jour
    scene_manager.update(dt) 
end


function love.draw() -- la partie graphique
    scene_manager.draw() 
    love.graphics.print(love.timer.getFPS(), 10, 10)
end