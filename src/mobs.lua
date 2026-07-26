local assets = require("src.assets")
local ui = require("src.display.ui")
local lmath = require("src.core.math")
local player = require("src.player")
local screen = require("src.display.screen")
local inventory = require("src.inventory")
local entities = require("src.data.entities")

---@class Mob
---@field x        number
---@field y        number
---@field name     string | number
---@field type     string
---@field timer    number
---@field goal     { x: number, y: number }
---@field rotation number

local mobs = {}

---@type Mob[]
mobs.list = {}

--- Wandering logic
function mobs.apply_wandering(mob, dt)
    local speed = 50
    if mob.timer <= 0 then
        mob.goal.x = love.math.random(mob.x - 320, mob.x + 320)
        mob.goal.y = love.math.random(mob.y - 320, mob.y + 320)
        mob.timer = love.math.random(6, 7)
    end

    local dx = mob.goal.x - mob.x
    local dy = mob.goal.y - mob.y
    local distance = math.sqrt(dx * dx + dy * dy)

    if distance > 1 then
        mob.x = mob.x + (dx / distance ) * speed * dt
        mob.y = mob.y + (dy / distance ) * speed * dt
    end

    mob.timer = mob.timer - dt
end

--- Creates a new mob and appends it to the Mob mobs.list.
function mobs.create(args)
    local stat = {
        type = args.type or "npc",

        x = args.x or 0,
        y = args.y or 0,
        speed = args.spped or 1,
        name = args.name,
        rotation = args.rotation or 0,
        hp = args.hp or entities[args.type].hp,
        
        timer = 0,
        goal = { x = 0, y = 0 }
    }
    table.insert(mobs.list, stat)
    return stat
end

function mobs.delete(id)
    table.remove(mobs.list, id)
end


function mobs.update(dt)
    -- Update movement for all NPCs
    for i, mob in ipairs(mobs.list) do
        entities[mob.type].update(dt, i)
    end
end

function mobs.damage(id, amount)
    mobs.list[id].hp = mobs.list[id].hp - amount
    if mobs.list[id].hp <= 0 then
        mobs.delete(id)
    end
end


function mobs.draw()
    for _, mob in ipairs(mobs.list) do
        -- Draw name and texture
        -- if api[i].x > player.x + (screen.width)/2 then -- try cliping
        if mob.name then
            ui.print_centered(tostring(mob.name), mob.x, mob.y - 20)
        end
        if mob.type == "item" then
            mobs.currentTexture = assets.textures.item[mob.name] or assets.textures["player"]
        else
            
            mobs.currentTexture = assets.textures[mob.type] or assets.textures["player"]
            
        end
        if mob.damaged then love.graphics.setColor(1, 0.5, 0, 1) end
        love.graphics.draw(mobs.currentTexture, mob.x, mob.y)
        love.graphics.setColor(1, 1, 1, 1)
    end
end

return mobs

-- TODO: random part of i think somting can help cliping

-- (start_x - (screen.width / 2)/64)/zoom, (start_x + (screen.width / 2) / 64)/zoom do -- cliping for x and y and btw 64 is the tile dimmension 64x64
-- for iy = (start_y - (screen.height / 2)/64)/zoom, (start_y + ((screen.height / 2)/64)+1)/zoom do
