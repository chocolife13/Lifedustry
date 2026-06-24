local assets = require("src.assets")
---@class ItemDef
---@field name    string
---@field texture fun(): love.Image  Returns the texture (resolved lazily at draw time)

---@type table<string, ItemDef>

local items = {
	rock = {name = "rock", texture = assets.textures.block.god},
	apple = {name = "Apple", texture = assets.textures.apple}
}   mushroom = {name = "mushroom", texture = assets.textures.mushroom} 

return items
