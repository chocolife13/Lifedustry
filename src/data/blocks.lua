local assets = require("src.assets")

---@class BlockDef
---@field name    string
---@field texture fun(): love.Image  Returns the texture (resolved lazily at draw time)

---@type table<string, BlockDef>
local blocks = {
	grass = {
		name = "grass",
		texture = function()
			return assets.textures.block.grass
		end,
	},
	stone = {
		name = "stone",
		texture = function()
			return assets.textures.block.stone
		end,
	},
	sand = {
		name = "sand",
		texture = function()
			return assets.textures.block.sand
		end,
	},
	water = {
		name = "water",
		texture = function()
			return assets.textures.block.water
		end,
	},
	snow = {
		name = "snow",
		texture = function()
			return assets.textures.block.snow
		end,
	},
}

return blocks
