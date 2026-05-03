local screen = require("src.display.screen")
local assets = require("src.assets")
local ui = require("src.display.ui")
local gui = require("src.display.gui")


local api = {}

function butonclick_fullscreen()
    love.window.setFullscreen(not screen.fullscreen)
end



function api.load()
    
end

function api.draw()
    ui.print_centered("Settings", screen.relative_to_percent.width(50), screen.relative_to_percent.height(15))
    

    gui.button(("Fullscreen : " .. tostring(screen.fullscreen)), 50, 50, 250, 35, function() butonclick_fullscreen() end)
    love.graphics.setBackgroundColor(57/255, 116/255, 11/255, 0)
    
end

function api.update(dt)
    if love.keyboard.isDown("escape") then 
        scene_manager.scene = "main_menu"
        scene_manager.load()    
    end
end

return api

