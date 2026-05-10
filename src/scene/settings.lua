local screen = require("src.display.screen")
local assets = require("src.assets")
local ui = require("src.display.ui")
local gui = require("src.display.gui")
local func = require("src.core.functions")

local buttonPercentageWidth = 250
local buttonPercentageHeight = 35

local api = {}

function buttonclick_fullscreen() 
    love.window.setFullscreen(not screen.fullscreen) 
end

function buttonclick_vsync()
    if screen.vsync == 1 then
        love.window.setVSync(0)
    else
        love.window.setVSync(1)
    end
end

function api.load()
    
end

function api.draw()

    ui.print_centered("Settings", screen.relative_to_percent.width(50), screen.relative_to_percent.height(15))
    ui.print_centered("Press Escape to leave settings...", screen.relative_to_percent.width(50), screen.relative_to_percent.height(20))
    ui.print_centered( --shows the resolution selected (may need a resolution selector later)
        "Current resolution : " .. screen.width .. "x".. screen.height, 
        screen.relative_to_percent.width(50), screen.relative_to_percent.height(70)
    )

    gui.button(
        ("Fullscreen : " .. func.boolToString(screen.fullscreen)),
        50, 50, buttonPercentageWidth, buttonPercentageHeight,
        function() buttonclick_fullscreen() end
    )

    gui.button(
        ("VSync : " .. func.boolToString(screen.vsync)),
        50, 60, buttonPercentageWidth, buttonPercentageHeight,
        function() buttonclick_vsync() end
    )

    love.graphics.setBackgroundColor(57/255, 116/255, 11/255, 0)
    
end

function api.update(dt)
    if love.keyboard.isDown("escape") then 
        scene_manager.scene = "main_menu"
        scene_manager.load()    
    end
end

return api

