local screen = require("src.display.screen")
local assets = require("src.assets")

local api = {}

api.speed = 2000
api.x = 0
api.y = 0
api.velocity ={}
api.velocity.x = 0
api.velocity.y = 0


function api.draw()
    love.graphics.draw(assets.textures.player, api.x, api.y)
end

function api.update(dt) 
    if love.keyboard.isDown("up") then
        api.velocity.y = -api.speed
    end
    if love.keyboard.isDown("down") then
        api.velocity.y = api.speed
    end
    if love.keyboard.isDown("left") then
        api.velocity.x = -api.speed
    end
    if love.keyboard.isDown("right") then
        api.velocity.x = api.speed
    end

    if api.velocity.x ~= 0 or api.velocity.y ~= 0 then --ajusting the speed values when both x and y movement happen
        local length = math.sqrt(api.velocity.x^2 + api.velocity.y^2) --scary math
        api.velocity.x = (api.velocity.x / length) * dt * api.speed -- formula to find the right value
        api.velocity.y = (api.velocity.y / length) * dt * api.speed
    end

    api.x = api.x + api.velocity.x --increse the x with the velocity
    api.y = api.y + api.velocity.y
    api.velocity.x = 0
    api.velocity.y = 0 --reset the velocity for no garou slide
end

return api