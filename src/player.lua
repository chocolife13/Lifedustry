local screen = require("src.display.screen")
local assets = require("src.assets")

local api = {}



function api.draw()
    love.graphics.draw(assets.textures.player, screen.relative_to_percent.width(50), screen.relative_to_percent.height(50))
end

function api.update(dt)
    if love.keyboard.isDown("up") then
        api.y = api.y +2
    end
    if love.keyboard.isDown("down") then
        api.y = api.y -2
    end
    if love.keyboard.isDown("left") then
        api.x = api.x +2
    end
    if love.keyboard.isDown("right") then
        api.x = api.x -2
    end
end

return api