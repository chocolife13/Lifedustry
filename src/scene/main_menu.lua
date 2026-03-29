local screen = require("src.display.screen")
local assets = require("src.assets")
local ui = require("src.display.ui")
local gui = require("src.display.gui")


local api = {}

function butonclick_test()
    scene_manager.scene = "loading"
    scene_manager.load()
end


function api.load()
    
end

function api.draw()
    ui.print_centered("Lifedustry", screen.relative_to_percent.width(50), screen.relative_to_percent.height(15))
    gui.button("If u tryed to click ur a fuckin idiot", 50, 50, 250, 35, function() butonclick_test() end)
    
end

function api.update(dt)
    
end

return api

