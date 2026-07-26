-- Entity definitions.
--
local entities = {
    snowman = {
        speed = 10,
        hp = 10,
        update = function (dt, id)
            local mobs = require("src.mobs")
            local player = require("src.player")
            local dx = mobs.list[id].x - player.x
            local dy = mobs.list[id].y - player.y
            mobs.list[id].distance = math.sqrt(dx * dx + dy * dy)
            mobs.apply_wandering(mobs.list[id], dt)
            mobs.list[id].timer = mobs.list[id].timer + 1 or 0
            if mobs.list[id].timer > 1000 then
                mobs.create({x = mobs.list[id].x, y = mobs.list[id].y, type = "snowball", rotation=1})
                mobs.list[id].damaged = false
                mobs.list[id].timer = 0
            end
            if mobs.list[id].hp < 1 then
                mobs.create({x = mobs.list[id].x, y = mobs.list[id].y, name = "apple", type = "item"})
            end
        end
    },
    snowball = {
        hp = 1,
        speed = 1,
        update = function (dt, id)
            local mobs = require("src.mobs")
            local player = require("src.player")
            local assets = require("src.assets")
            mobs.list[id].dx = player.x - mobs.list[id].x
            mobs.list[id].dy = player.y - mobs.list[id].y
            mobs.list[id].distance = math.sqrt(mobs.list[id].dx * mobs.list[id].dx + mobs.list[id].dy * mobs.list[id].dy)
            if not mobs.list[id].vx or not mobs.list[id].vy  then
                if mobs.list[id].hp < 1 then
                    mobs.delete(id)
                end
                if mobs.list[id].distance > 0 then
                    mobs.list[id].vx = (mobs.list[id].dx / mobs.list[id].distance) * mobs.list[id].speed
                    mobs.list[id].vy = (mobs.list[id].dy / mobs.list[id].distance) * mobs.list[id].speed
                else
                    mobs.list[id].vx = 0
                    mobs.list[id].vy = 0
                end
            end
            mobs.list[id].x = mobs.list[id].x + mobs.list[id].vx
            mobs.list[id].y = mobs.list[id].y + mobs.list[id].vy
            if mobs.list[id].distance > 3000 then
                mobs.delete(id)
            elseif mobs.list[id].distance < assets.textures.player:getWidth() then
                mobs.delete(id)
                player.hit(1)
            end
        end
    },
    chicken = {
        hp = 5,
        speed = 10,
        update = function (dt, id)
            local mobs = require("src.mobs")
            local player = require("src.player")
            mobs.list[id].dx = player.x - mobs.list[id].x
            mobs.list[id].dy = player.y - mobs.list[id].y
            mobs.list[id].distance = math.sqrt(mobs.list[id].dx * mobs.list[id].dx + mobs.list[id].dy * mobs.list[id].dy)
            mobs.apply_wandering(mobs.list[id], dt)
        end

    },
    fish = {
        hp = 2,
        speed = 10,
        update = function (dt, id)
            local mobs = require("src.mobs")
            local player = require("src.player")
            mobs.list[id].dx = player.x - mobs.list[id].x
            mobs.list[id].dy = player.y - mobs.list[id].y
            mobs.list[id].distance = math.sqrt(mobs.list[id].dx * mobs.list[id].dx + mobs.list[id].dy * mobs.list[id].dy)
            mobs.apply_wandering(mobs.list[id], dt)
        end
    },
    ball = {
        hp = 1,
        speed = 10,
        update = function (dt, id)
            local mobs = require("src.mobs")
            local player = require("src.player")
            mobs.list[id].x = mobs.list[id].x + 1
            mobs.list[id].dx = player.x - mobs.list[id].x
            mobs.list[id].dy = player.y - mobs.list[id].y
            mobs.list[id].distance = math.sqrt(mobs.list[id].dx * mobs.list[id].dx + mobs.list[id].dy * mobs.list[id].dy)
            mobs.list[id].rotation = mobs.list[id].rotation + (dt * 2)
        end
    },
    item = {
        speed = 10,
        update = function (dt, id)
            local mobs = require("src.mobs")
            local player = require("src.player")
            local inventory = require("src.inventory")
            local dx = mobs.list[id].x - player.x
            local dy = mobs.list[id].y - player.y
            mobs.list[id].distance = math.sqrt(dx * dx + dy * dy)
            if mobs.list[id].distance < 50 then
                inventory.add(mobs.list[id].item, 1)
                mobs.delete(id)
            end
        end
    },
    run = {
        hp = 100,
        speed = 10,
        update = function (dt, id)
            local mobs = require("src.mobs")
            local player = require("src.player")
            mobs.list[id].dx = player.x - mobs.list[id].x
            mobs.list[id].dy = player.y - mobs.list[id].y
            mobs.list[id].distance = math.sqrt(mobs.list[id].dx * mobs.list[id].dx + mobs.list[id].dy * mobs.list[id].dy)
            local run_speed = 300
            local safe_mob_distance = 300
            if mobs.list[id].distance < safe_mob_distance and mobs.list[id].distance > 0 then
                mobs.list[id].x = mobs.list[id].x + (mobs.list[id].dx / mobs.list[id].distance) * run_speed * dt
                mobs.list[id].y = mobs.list[id].y + (mobs.list[id].dy / mobs.list[id].distance) * run_speed * dt
            else
                mobs.apply_wandering(mobs.list[id], dt)
            end
        end
    }
}

return entities