local screen = require("src.display.screen")
local assets = require("src.assets")

local api = {}

api.speed = 600000000
api.x = 1073741835
api.y = 1073741835
api.velocity ={}
api.velocity.x = 0
api.velocity.y = 0

function api.draw()
    love.graphics.draw(assets.textures.player, api.x, api.y)
end

function api.update(dt) 
    if love.keyboard.isDown("up") then -- not better to put this in a input file or juste the up or down
        api.velocity.y = -(api.speed * dt)
    end
    if love.keyboard.isDown("down") then
        api.velocity.y = (api.speed*dt) --set the velocity to the speed
    end
    if love.keyboard.isDown("left") then
        api.velocity.x = -(api.speed*dt)
    end
    if love.keyboard.isDown("right") then
        api.velocity.x = (api.speed*dt)
    end
    if love.keyboard.isDown("lshift") then
       api.speed = 600000000000
    else
        api.speed = 3000
    end
    api.x = api.x + api.velocity.x --increse the x with the velocity
    api.y = api.y + api.velocity.y
    api.velocity.x = 0
    api.velocity.y = 0 --reset the velocity for no garou slide
end

return api