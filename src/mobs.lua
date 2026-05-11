local assets = require("src.assets")
local ui = require("src.display.ui")
local lmath = require("src.core.math")
local player = require("src.player")

---@class Mob
---@field x      number
---@field y      number
---@field name   string|number
---@field type   string
---@field timer  number
---@field goal   {x: number, y: number}

local mobs = {}

---@type Mob[]
local list = {}

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

--- Creates a new mob and appends it to the Mob list.
function mobs.create(x, y, name, mob_type)
    ---@type Mob
    local mob = {
        x = x or 0,
        y = y or 0,
        name = name or (#list + 1),
        type = mob_type or "npc",
        timer = 0,
        goal = {x = 0, y = 0}
    }
    table.insert(list, mob)
    return mob
end

-- The mobs added for testing ig
mobs.create(20, -160, "Gilbert", "npc")
mobs.create(nil, -160, "Bob", "statue")
mobs.create(20, -160, "Random", "npc")

function mobs.update(dt)
    -- Gilbert chases player w/ lerp
    if list[1] then
        list[1].x = lmath.lerp(list[1].x, player.x, 0.01)
    end

    -- Update movement for all NPCs
    for _, mob in ipairs(list) do
        if mob.type == "npc" then
            mobs.apply_wandering(mob, dt)
        end
    end
end

function mobs.draw()
    for _, mob in ipairs(list) do
        -- Draw name and texture
	-- if api[i].x > player.x + (screen.width)/2 then -- try cliping
        ui.print_centered(tostring(mob.name), mob.x, mob.y - 20)
        love.graphics.draw(assets.textures.player, mob.x, mob.y)
	-- end
    end
end

return mobs

-- TODO: random part of i think somting can help cliping

--(start_x - (screen.width / 2)/64)/zoom, (start_x + (screen.width / 2) / 64)/zoom do -- cliping for x and y and btw 64 is the tile dimmension 64x64
--for iy = (start_y - (screen.height / 2)/64)/zoom, (start_y + ((screen.height / 2)/64)+1)/zoom do
