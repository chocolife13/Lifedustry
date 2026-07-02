local assets = require("src.assets")
---@class ItemDef
---@field name    string
---@field texture fun(): love.Image  Returns the texture (resolved lazily at draw time)

---@type table<string, ItemDef>

local items = {
    rock = {
        name = "rock",
        texture = assets.textures.block.god,
        onUse = function(x, y)
        	local mobs = require("src.mobs")
            local camera = require("src.camera")
            local screen = require("src.display.screen")
            mobs.create((x + camera.x) - screen.width / 2, (y + camera.y) - screen.height / 2, "rock", "item")
        end
        },
    apple = {
        name = "Apple",
        texture = assets.textures.apple,
        onUse = function(x, y)
        	assets.audios.sfx.bell:stop()
        	assets.audios.sfx.bell:play()
        end
		},
    mushroom = { name = "mushroom", texture = assets.textures.mushroom },
    turnip = { name = "turnip", texture = assets.textures.turnip },
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
