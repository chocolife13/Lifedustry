local screen = require("src.display.screen")
local assets = require("src.assets")
local ui = require("src.display.ui")
local gui = require("src.display.gui")
local map = require("src.map")

local api = {}



function api.load()
    x = 0
    y = 0
end

function api.draw()
    
    if love.keyboard.isDown("up") then
        y = y +2
    end
    if love.keyboard.isDown("down") then
        y = y -2
    end
    if love.keyboard.isDown("left") then
        x = x +2
    end
    if love.keyboard.isDown("right") then
        x = x -2
    end
    love.graphics.push()
    love.graphics.translate(x, y)
    map.draw()
    love.graphics.pop()
    love.graphics.draw(assets.textures.player, screen.relative_to_percent.width(50), screen.relative_to_percent.height(50))
    

    love.graphics.setBackgroundColor(0, 0, 0, 0)
    
end

function api.update(dt)
    
end

return api

