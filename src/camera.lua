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
    love.graphics.translate(-api.x + (screen.width / 2)*api.zoom, -api.y + (screen.height / 2)*api.zoom)-- move from the push(origin) to the player
    love.graphics.scale(api.zoom, api.zoom)  
    map.draw(api.x, api.y, api.zoom)
    
    player.draw()
    

    love.graphics.setBackgroundColor(0, 0, 0, 0)
    love.graphics.pop() -- go to last save (push(origin))
end


function api.update(dt)
    api.x = math.cerp(api.x, player.x, 6*dt)
    api.y = math.cerp(api.y, player.y, 6*dt)
    if love.keyboard.isDown("+") then
        api.zoom = api.zoom + 0.01
    end
    if love.keyboard.isDown("-") then
        api.zoom = api.zoom - 0.01
    end
end
return api