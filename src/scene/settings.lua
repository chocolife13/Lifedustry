local screen = require("src.display.screen")
local assets = require("src.assets")
local ui = require("src.display.ui")
local gui = require("src.display.gui")

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

function boolToString(t) --used to show correctly setting's value
    if t==true or t==1 then return "On" end
    if t==false or t==0 then return "Off" end
end

function api.load()
    
end

function api.draw()

    ui.print_centered("Settings", screen.relative_to_percent.width(50), screen.relative_to_percent.height(15))
    ui.print_centered("Press Escape to leave settings...", screen.relative_to_percent.width(50), screen.relative_to_percent.height(20))
    ui.print_centered( --shows the resolution selected (may need a resolution selector later)
        "Current resolution : x=" .. screen.width .. ", y=".. screen.height, 
        screen.relative_to_percent.width(50), screen.relative_to_percent.height(70)
    )

    gui.button(
        ("Fullscreen : " .. boolToString(screen.fullscreen)),
        50, 50, buttonPercentageWidth, buttonPercentageHeight,
        function() buttonclick_fullscreen() end
    )

    gui.button(
        ("VSync : " .. boolToString(screen.vsync)),
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

