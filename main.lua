local scene_manager = require("src.scene.scene_manager")
local assets = require("src.assets")
require("src.screen")
require("src.ui")
-- ces trois boucles sont les boucle principale du jeux


function love.load()
    
    scene_manager.scene = "loading" -- set the first scene splash screen
    assets.preload()
    scene_manager.load() -- start the actual scene
end


function love.update(dt) -- la partit mise a jour
    scene_manager.update() 
end


function love.draw() -- la partit graphique
    scene_manager.draw() 
    love.graphics.print(love.timer.getFPS(), 10, 10)
end