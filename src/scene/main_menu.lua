local screen = require("src.display.screen")
local assets = require("src.assets")
local ui = require("src.display.ui")
local gui = require("src.display.gui")


local api = {}

function butonclick_play()
    scene_manager.scene = "play_menu"
    scene_manager.load()
end

function butonclick_test()
    scene_manager.scene = "test"
    scene_manager.load()
end

function api.load()
    
end

function api.draw()
    love.graphics.draw(assets.textures.ui.logo, screen.relative_to_percent.width(50), screen.relative_to_percent.height(15), 0, 0.1, 0.1, assets.textures.ui.logo:getWidth() / 2, assets.textures.ui.logo:getHeight() / 2)
    gui.button("Play", 50, 50, 250, 35, function() butonclick_play() end)
    gui.button("Test", 50, 67, 250, 35, function() butonclick_test() end)
    love.graphics.setBackgroundColor(57/255, 116/255, 11/255, 0)
    
end

function api.update(dt)
if love.keyboard.isDown("t") and dev then
    require("src.scene.scene_manager").scene = "test"
    end
end

return api

