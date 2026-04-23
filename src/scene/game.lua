local screen = require("src.display.screen")
local assets = require("src.assets")
local ui = require("src.display.ui")
local gui = require("src.display.gui")
local map = require("src.map")
local player = require("src.player")

local api = {}



function api.load()
    x = 0
    player.x = 0
    player.y = 0
end

function api.draw()
    
    
    love.graphics.push()
    local width, height = love.graphics.getDimensions() 
    love.graphics.translate(-player.x + width / 2, -player.y + height / 2)
    
    map.draw()
    
    player.draw()
    

    love.graphics.setBackgroundColor(0, 0, 0, 0)
    love.graphics.pop()
end

function api.update(dt)
    player.update(dt)

end

return api

