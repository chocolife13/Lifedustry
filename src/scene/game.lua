local screen = require("src.display.screen")
local assets = require("src.assets")
local ui = require("src.display.ui")
local gui = require("src.display.gui")
local map = require("src.map")
local player = require("src.player")

local api = {}



function api.load()
end

function api.draw()
    
    
    love.graphics.push() --save the position screen here at origin
    local width, height = love.graphics.getDimensions() --bruh
    love.graphics.translate(-player.x + width / 2, -player.y + height / 2)-- move from the push(origin) to the player
    
    map.draw()
    
    player.draw()
    

    love.graphics.setBackgroundColor(0, 0, 0, 0)
    love.graphics.pop() -- go to last save (push(origin))
end

function api.update(dt)
    player.update(dt)

end

return api

