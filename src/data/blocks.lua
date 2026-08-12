local assets = require("src.assets")

---@class BlockDef
---@field name    string
---@field texture fun(): love.Image  Returns the texture (resolved lazily at draw time)

---@type table<string, BlockDef>
local blocks = {
	grass = {
		name = "grass",
	},
	stone = {
		name = "stone",
	},
	sand = {
		name = "sand",
	},
	water = {
		name = "water",
	},
	snow = {
		name = "snow",
	},
}

return blocks
