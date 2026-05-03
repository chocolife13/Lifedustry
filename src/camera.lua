local screen = require("src.display.screen")
local assets = require("src.assets")
local ui = require("src.display.ui")
local gui = require("src.display.gui")
local map = require("src.map")
local player = require("src.player")
local math = require("src.core.math")


local api = {}



api.x = 0
api.y = 0
api.zoom = 1

function api.draw()
    love.graphics.push() --save the position screen here at origin
    local width, height = love.graphics.getDimensions() --bruh
    love.graphics.translate(-api.x + (width / 2)*api.zoom, -api.y + (height / 2)*api.zoom)-- move from the push(origin) to the player
    love.graphics.scale(api.zoom, api.zoom)  
    map.draw(api.x, api.y, api.zoom)
    
    player.draw()
    

    love.graphics.setBackgroundColor(0, 0, 0, 0)
    love.graphics.pop() -- go to last save (push(origin))
end


function api.update(dt)
    api.x = math.lerp(api.x, player.x, 0.02)
    api.y = math.lerp(api.y, player.y, 0.02)
    if love.keyboard.isDown("+") then
        api.zoom = api.zoom + 0.01
    end
    if love.keyboard.isDown("-") then
        api.zoom = api.zoom - 0.01
    end
end
return api