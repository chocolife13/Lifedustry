local assets = require("src.assets")
local ui = require("src.display.ui")
local lmath = require("src.core.math")
local player = require("src.player")
local screen = require("src.display.screen")
local inventory = require("src.inventory")

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
        mob.x = mob.x + (dx / distance) * speed * dt
        mob.y = mob.y + (dy / distance) * speed * dt
    end

    mob.timer = mob.timer - dt
end

--- Creates a new mob and appends it to the Mob mobs.list.
function mobs.create(x, y, name, mob_type)
    ---@type Mob
    local mob = {
        x = x or 0,
        y = y or 0,
        name = name or (#mobs.list + 1),
        type = mob_type or "npc",
        rotation = rotation or 0,
        timer = 0,
        goal = { x = 0, y = 0 }
    }
    table.insert(mobs.list, mob)
    return mob
end

function mobs.delete(id)
    table.remove(mobs.list, id)
end

-- The mobs added for testing ig
mobs.create(20, -160, "Gilbert (Bro)", "gilbert")
mobs.create(nil, -160, "Bob", "statue")
mobs.create(20, -160, "Random", "npc")
mobs.create(0, -1000, "God of rocks", "god")

function mobs.update(dt)
    -- Update movement for all NPCs
    for i, mob in ipairs(mobs.list) do
        local dx = mob.x - player.x
        local dy = mob.y - player.y
        local distance = math.sqrt(dx * dx + dy * dy)
        if distance < 5000 then
            if mob.type == "npc" or mob.type == "chicken" or mob.type == "fish" then
                mobs.apply_wandering(mob, dt)
            end
            if mob.type == "snowman" then
                mobs.apply_wandering(mob, dt)
                mob.timer = mob.timer + 1 or 0
                if mob.timer > 1000 then
                    mobs.create(mob.x, mob.y, nil, "snowball")
                    mob.timer = 0
                end
            end

            if mob.type == "folower" then
                mob.x = lmath.lerp(mob.x, player.x, 0.05)
                mob.y = lmath.lerp(mob.y, player.y, 0.05)
            end

            if mob.type == "gilbert" then
                mob.x = mob.x + 1
            end

            if mob.type == "ball" then
                mob.x = mob.x + 1
                mob.rotation = mob.rotation + (dt * 2)
            end

            if mob.type == "snowball" then
                mob.x = lmath.lerp(mob.x, player.x, 0.001)
                mob.y = lmath.lerp(mob.y, player.y, 0.001)
            end

            if mob.type == "run" then
                local run_speed = 300
                local safe_distance = 300

                if distance < safe_distance and distance > 0 then
                    mob.x = mob.x + (dx / distance) * run_speed * dt
                    mob.y = mob.y + (dy / distance) * run_speed * dt
                else
                    mobs.apply_wandering(mob, dt)
                end
            end
            if mob.type == "item" then
                local dx = mob.x - player.x
                local dy = mob.y - player.y
                local distance = math.sqrt(dx * dx + dy * dy)
                if distance < 50 then
                    mobs.delete(i)
                    inventory.add(mob.name, 1)
                end
            end
        end
    end
end

function mobs.draw()
    for _, mob in ipairs(mobs.list) do
        -- Draw name and texture
        -- if api[i].x > player.x + (screen.width)/2 then -- try cliping
        ui.print_centered(tostring(mob.name), mob.x, mob.y - 20)
        if mob.type == "god" then
            love.graphics.draw(assets.textures.god, mob.x, mob.y)
        elseif mob.type == "item" then
            love.graphics.draw(assets.textures.item[mob.name], mob.x, mob.y)
        elseif mob.type == "chicken" then
            love.graphics.draw(assets.textures.chicken, mob.x, mob.y)
        elseif mob.type == "fish" then
            love.graphics.draw(assets.textures.fish, mob.x, mob.y)
        elseif mob.type == "ball" then
            love.graphics.draw(assets.textures.ball, mob.x, mob.y, mob.rotation)
        elseif mob.type == "snowman" then
            love.graphics.draw(assets.textures.snowman, mob.x, mob.y)
        elseif mob.type == "snowball" then
            love.graphics.draw(assets.textures.snowball, mob.x, mob.y)
        else
            love.graphics.draw(assets.textures.player, mob.x, mob.y)
        end
        -- end
    end
end

return mobs

-- TODO: random part of i think somting can help cliping

-- (start_x - (screen.width / 2)/64)/zoom, (start_x + (screen.width / 2) / 64)/zoom do -- cliping for x and y and btw 64 is the tile dimmension 64x64
-- for iy = (start_y - (screen.height / 2)/64)/zoom, (start_y + ((screen.height / 2)/64)+1)/zoom do
