local screen = require("src.display.screen")
local assets = require("src.assets")

local api = {}

api.speed = 6000
function api.draw()
    love.graphics.draw(assets.textures.player, api.x, api.y)
end

function api.update(dt)
    if love.keyboard.isDown("up") then
        api.y = api.y -(api.speed*dt)
    end
    if love.keyboard.isDown("down") then
        api.y = api.y +(api.speed*dt)
    end
    if love.keyboard.isDown("left") then
        api.x = api.x -(api.speed*dt)
    end
    if love.keyboard.isDown("right") then
        api.x = api.x +(api.speed*dt)
    end
end

return api