local screen = require("src.display.screen")
local assets = require("src.assets")
local ui = require("src.display.ui")
local gui = require("src.display.gui")


local api = {}



function api.load()
    
end

function api.draw()
    love.graphics.draw(assets.textures.block.grass, 50, 50)
    love.graphics.draw(assets.textures.player, screen.relative_to_percent.width(50), screen.relative_to_percent.height(50))

    love.graphics.setBackgroundColor(0, 0, 0, 0)
    
end

function api.update(dt)
    if love.keyboard.isDown("up") then
        print("up pressed")
    end
end

return api

