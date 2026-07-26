local assets = require("src.assets")
---@class ItemDef
---@field name    string
---@field texture fun(): love.Image  Returns the texture (resolved lazily at draw time)

---@type table<string, ItemDef>

local items = {
    rock = {
        name = "rock",
        texture = assets.textures.block.god,
        isConsumable = true,
        onUse = function(x, y)
        	local mobs = require("src.mobs")
            local camera = require("src.camera")
            local screen = require("src.display.screen")
            mobs.create((x + camera.x) - screen.width / 2, (y + camera.y) - screen.height / 2, "rock", "item")
        end
        },
    snowflake = {
        name = "Snowflake",
        texture = assets.textures.item.snowflake,
        isConsumable = false,
        onUse = function(x, y)
        	local mobs = require("src.mobs")
            local camera = require("src.camera")
            local screen = require("src.display.screen")
            mobs.create((x + camera.x) - screen.width / 2, (y + camera.y) - screen.height / 2, nil, "snowman")
        end
        },
    apple = {
        name = "Apple",
        texture = assets.textures.apple,
        isConsumable = true,
        onUse = function(x, y)
        	assets.audios.sfx.bell:stop()
        	assets.audios.sfx.bell:play()
            local player = require("src.player")
            player.hp = player.hp + 5
        end
		},
    mushroom = { name = "mushroom", texture = assets.textures.mushroom },
    turnip = {
        name = "turnip", 
        texture = assets.textures.turnip,
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
        texture = assets.textures.sword,
        isConsumable = false,
        onUse = function(x, y)
            assets.audios.sfx.swing:stop()
            assets.audios.sfx.swing:play()
            local mobs = require("src.mobs")
            for _, mob in ipairs(mobs.list) do
                if mob.distance < 100 then
                    mob.damaged = true
                    mob.hp = mob.hp - 5
                    assets.audios.sfx.bell:stop()
                    assets.audios.sfx.bell:play()
                end
            end
        end 
    },
    pumpkin = {name = "pumpkin", texture = assets.textures.pumpkin},

    slingshot = { name = "slingshot", texture = assets.textures.slingshot,
    onUse = function(x, y)
    	local mobs = require("src.mobs")
        local camera = require("src.camera")
        local screen = require("src.display.screen")
        for i = 0, 2000 do
        	mobs.create(((x  + camera.x) - screen.width / 2) + 10 * i, (y + camera.y) - screen.height / 2, "apple", "item")
        end
    end}
}
return items
