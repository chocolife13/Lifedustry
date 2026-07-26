-- Entity definitions.
--
local entities = {
    snowman = {
        speed = 10,
        update = function (dt, mob)
            local mobs = require("src.mobs")
            local player = require("src.player")
            local dx = mob.x - player.x
            local dy = mob.y - player.y
            mob.distance = math.sqrt(dx * dx + dy * dy)
            mobs.apply_wandering(mob, dt)
            mob.timer = mob.timer + 1 or 0
            if mob.timer > 1000 then
                mobs.create(mob.x, mob.y, nil, "snowball", nil, nil, nil, 1)
                mob.damaged = false
                mob.timer = 0
            end
            if mob.hp < 1 then
                mobs.create(mob.x, mob.y, "apple", "item")
                mobs.delete(i)
            end
        end
    },
    snowball = {
        speed = 10,
        update = function (dt, mob)
            local mobs = require("src.mobs")
            local player = require("src.player")
            local assets = require("src.assets")
            if not mob.vx or not mob.vy  then
                local dx = player.x - mob.x
                local dy = player.y - mob.y
                if mob.hp < 1 then
                    mobs.delete(i)
                end
                if mob.distance > 0 then
                    local speed = 1
                    mob.vx = (dx / mob.distance) * speed
                    mob.vy = (dy / mob.distance) * speed
                else
                    mob.vx = 0
                    mob.vy = 0
                end
            end
            mob.x = mob.x + mob.vx
            mob.y = mob.y + mob.vy
            if mob.distance > 3000 then
                mobs.delete(i)
            end
            if mob.distance < assets.textures.player:getWidth() then
                mobs.delete(i)
                player.hit(1)
            end
        end
    },
    chicken = {
        speed = 10,
        update = function (dt, mob)
            local mobs = require("src.mobs")
            mobs.apply_wandering(mob, dt)
            if mob.hp < 1 then
                mobs.delete(i)
            end
        end

    },
    fish = {
        speed = 10,
        update = function (dt, mob)
            local mobs = require("src.mobs")
            mobs.apply_wandering(mob, dt)
            if mob.hp < 1 then
                mobs.delete(i)
            end
        end
    },
    ball = {
        speed = 10,
        update = function (dt, mob)
            mob.x = mob.x + 1
            mob.rotation = mob.rotation + (dt * 2)
        end
    },
    item = {
        speed = 10,
        update = function (dt, mob)
            local mobs = require("src.mobs")
            local player = require("src.player")
            local inventory = require("src.inventory")
            local dx = mob.x - player.x
            local dy = mob.y - player.y
            mob.distance = math.sqrt(dx * dx + dy * dy)
            if mob.distance < 50 then
                mobs.delete(i)
                inventory.add(mob.name, 1)
            end
        end
    },
    run = {
        speed = 10,
        update = function (dt, mob)
            local mobs = require("src.mobs")
            local run_speed = 300
            local safe_mob_distance = 300
            if mob.distance < safe_mob_distance and mob.distance > 0 then
                mob.x = mob.x + (mob.dx / mob.distance) * run_speed * dt
                mob.y = mob.y + (mob.dy / mob.distance) * run_speed * dt
            else
                mobs.apply_wandering(mob, dt)
            end
        end
    }
}

return entities