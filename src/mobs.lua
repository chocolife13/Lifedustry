local assets = require("src.assets")
local ui = require("src.display.ui")
local maths = require("src.core.math")
local player = require("src.player")

local api = {}
api.amount = 0


function api.movement(mob, dt)
    local speed = 50
    if mob.timer <= 0 then
        mob.goal.x = love.math.random(mob.x - 320, mob.x + 320)
        mob.goal.y = love.math.random(mob.y - 320, mob.y + 320)
        mob.timer = love.math.random(6, 7)
    end

    local dx = mob.goal.x - mob.x
    local dy = mob.goal.y - mob.y
    local distance = math.sqrt(dx * dx + dy * dy) or 0

    if distance > 1 then 
        -- normalize the direction and apply speed/time
        mob.x = mob.x + (dx / distance) * speed * dt
        mob.y = mob.y + (dy / distance) * speed * dt
    end

    mob.timer = mob.timer - dt
end


function api.create(x, y)
    api.amount = api.amount + 1
    api[api.amount] = {} 
    api[api.amount].x = x or 0
    api[api.amount].y = y or 0
    api[api.amount].name = api.amount
    api[api.amount].type = type
    api[api.amount].timer = 0
    api[api.amount].goal = {x=0,y=0}
end

api.create(nil)
api.create(20, -200)
api.create(20, -160)
api[3].name = "gilbert"

function api.update(dt)
    api[1].x = maths.lerp(api[1].x, player.x, .01)
    api[2].x = api[2].x + dt * 100
    api.movement(api[3], dt) --makes gilbert move like a bot
end

function api.draw()
    for i=1, api.amount  do
        ui.print_centered(api[i].name, api[i].x, api[i].y -20)
        love.graphics.draw(assets.textures.player, api[i].x, api[i].y)
    end
end

return api