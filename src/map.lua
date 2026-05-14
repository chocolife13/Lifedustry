local biome = require("src.data.biome")
local screen = require("src.display.screen")
local mobs = require("src.mobs")


local map = {}

local TILE = 64
map.seed = love.math.random(0, 99999)

--- Draws all visible tiles centred on the camera position (`cx`, `cy`).
---@param cx   number  camera world x
---@param cy   number  camera world y
---@param zoom number  current zoom level
function map.draw(cx, cy, zoom)
	local half_w = (screen.width / 2) / TILE
	local half_h = (screen.height / 2) / TILE
	local origin_x = math.floor(cx / TILE)
	local origin_y = math.floor(cy / TILE)

	for ix = (origin_x - half_w) / zoom, (origin_x + half_w) / zoom do
		for iy = (origin_y - half_h) / zoom, (origin_y + half_h + 1) / zoom do
			local height = love.math.noise((ix + map.seed) / 100, (iy + map.seed) / 100)
			local temp = love.math.noise((ix + map.seed) / 200, (iy + map.seed) / 200)

			if height < 0.1 then
				biome.water(ix, iy)
			elseif temp > 0.8 then
				biome.desert(ix, iy)
			elseif height > 0.5 and temp < 0.3 then
				biome.snow(ix, iy)
			else
				biome.plain(ix, iy)
			end
		end
	end
end

return map
