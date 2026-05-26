local assets = require("src.assets")

---@class ItemDef
---@field name    string
---@field texture fun(): love.Image  Returns the texture (resolved lazily at draw time)

---@type table<string, ItemDef>
local items = {
	rock = {
		name = "rock",
		texture = function()
			return assets.textures.block.god
		end}
}

return items
