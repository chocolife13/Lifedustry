local screen = require("src.display.screen")
local assets = require("src.assets")
local ui = require("src.display.ui")
local gui = require("src.display.gui")


local api = {}



function api.load()
    
end

function api.draw()
    for ix = 0, 10 do
        for yx = 0, 10 do
            love.graphics.draw(assets.textures.block.grass, ix * 64, yx * 64)
        end
    end
    
    love.graphics.draw(assets.textures.player, screen.relative_to_percent.width(50), screen.relative_to_percent.height(50))

    love.graphics.setBackgroundColor(0, 0, 0, 0)
    
end

function api.update(dt)
    if love.keyboard.isDown("up") then
        print("up pressed")
    end
end

return api

