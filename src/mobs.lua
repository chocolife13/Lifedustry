local assets = require("src.assets")
local ui = require("src.display.ui")
local maths = require("src.core.math")
local player = require("src.player")
local screen = require("src.display.screen")

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


function api.create(x, y, name, type)
    api.amount = api.amount + 1
    api[api.amount] = {} 
    api[api.amount].x = x or 0
    api[api.amount].y = y or 0
    api[api.amount].name = name
    api[api.amount].type = type or "npc"
    api[api.amount].timer = 0
    api[api.amount].goal = {x=0,y=0}
end


api.create(20, -160, "Gilbert", "npc")
api.create(nil,-160,"bob","statue")
api.create(20, -160, "random", "npc")

function api.update(dt)
    api[1].x = maths.lerp(api[1].x, player.x, .01)
    for i=1, api.amount do
        if api[i].type == "npc" then
            api.movement(api[i], dt) --makes gilbert move like a bot
        end
    end
    
   
end

function api.draw()
    for i=1, api.amount  do 
        -- if api[i].x > player.x + (screen.width)/2 then -- try cliping
            ui.print_centered(api[i].name or i, api[i].x, api[i].y -20)
            love.graphics.draw(assets.textures.player, api[i].x, api[i].y)
        -- end
    end
end

return api



-- random part of i think somting can help cliping

--(start_x - (screen.width / 2)/64)/zoom, (start_x + (screen.width / 2) / 64)/zoom do --cliping for x and y and btw 64 is thi tile dimmension 64x64
        --for iy = (start_y - (screen.height / 2)/64)/zoom, (start_y + ((screen.height / 2)/64)+1)/zoom do