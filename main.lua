scene_manager = require("src.scene.scene_manager")
assets = require("src.assets")
debug = require("src.core.debug")
screen = require("src.display.screen")
local args_manager = require("src.args_manager")

-- THese 3 function are the 3 main function in LOVE2D

function love.load(args) -- loading the game and retunr an arguments like --dev
    debug.load()
    args_manager.start_scene(args)
    assets.preload() -- loading the assets for the loading screen
    scene_manager.load() -- start the scene set in arg manager
end
 

function love.update(dt) --update all frames
    scene_manager.update(dt)
    screen.update()
end

function love.draw() -- graphics
    scene_manager.draw() --draw the content of the actual scene
    if dev then debug.info() end --if dev print dev info that all !
end 