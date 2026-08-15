local assets = require("src.assets")

local items = {
    rock = {
        name = "rock",
        isConsumable = true,
        onUse = function(x, y)
        	local mobs = require("src.mobs")
            local camera = require("src.camera")
            local screen = require("src.display.screen")
            mobs.create({x = (x + camera.x) - screen.width / 2, y = (y + camera.y) - screen.height / 2, name = "rock", type = "item"})
        end
    },
    stone = {
        name = "Stone",
        isConsumable = false,
        type = "block"
    },
    sand = {
        name = "Stone",
        isConsumable = false,
        type = "block"
    },
    grass = {
        name = "Stone",
        isConsumable = false,
        type = "block"
    },
    water = {
        name = "Water",
        isConsumable = false,
        type = "block"
    },
    snow = {
        name = "Stone",
        isConsumable = false,
        type = "block"
    },
    snowflake = {
        name = "Snowflake",
        type = "custom",
        isConsumable = false,
        onUse = function(x, y)
        	local mobs = require("src.mobs")
            local camera = require("src.camera")
            local screen = require("src.display.screen")
            mobs.create({x = (x + camera.x) - screen.width / 2, y = (y + camera.y) - screen.height / 2, type = "snowman"})
        end
        },
    apple = {
        name = "Apple",
        isConsumable = true,
        type = "stat",
        amount = 13,
        stat = "hp",
		},
    mushroom = { name = "mushroom"},
    turnip = {
        name = "turnip",
        type = "custom",
        isConsumable = true,
        onUse = function(x, y)
        	assets.audios.sfx.crunch:stop()
        	assets.audios.sfx.crunch:play()
            local player = require("src.player")
            local screen = require("src.display.screen")
            local camera = require("src.camera")
            player.x = player.x + ((screen.mouse.x - (screen.width / 2)) / camera.zoom)
            player.y = player.y + ((screen.mouse.y - (screen.height / 2)) / camera.zoom)
        end
    },
    sword = {
        name = "sword",
        type = "custom",
        isConsumable = false,
        onUse = function(x, y)
            assets.audios.sfx.swing:stop()
            assets.audios.sfx.swing:play()
            local mobs = require("src.mobs")
            local player = require("src.player")
            for id, mob in ipairs(mobs.list) do
                local dx = mobs.list[id].x - player.x
                local dy = mobs.list[id].y - player.y
                mobs.list[id].distance = math.exp(0.5 * math.log(dx * dx + dy * dy))
                if mobs.list[id].distance < 100 then
                    mobs.damage(id, 10)
                    assets.audios.sfx.bell:stop()
                    assets.audios.sfx.bell:play()
                end
            end
        end 
    },
    pumpkin = {name = "pumpkin", type = "custom", texture = assets.textures.pumpkin},
    slingshot = { name = "slingshot", texture = assets.textures.slingshot},

}
return items
