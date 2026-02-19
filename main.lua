require("src.scene.scene_manager")
require("src.screen")

-- ces trois boucles sont les boucle principale du jeux


function love.load()
    
    scene_manager.scene = "splash_screen" -- set the first scene splash screen
    require("src.assets")
    scene_manager.load() -- start the actual scene
end


function love.update(dt) -- la partit mise a jour
    scene_manager.update() 
end


function love.draw() -- la partit graphique
    scene_manager.draw() 
end