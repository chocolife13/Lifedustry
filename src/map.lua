local biomes = require("src.data.biomes")
local biomes = require("src.data.biomes")
local blocks = require("src.data.blocks")
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

	for ix = (origin_x - half_w) / zoom, (origin_x + half_w + 1) / zoom do
		for iy = (origin_y - half_h) / zoom, (origin_y + half_h + 1) / zoom do
			local height = love.math.noise((ix + map.seed) / 100, (iy + map.seed) / 100)
			local temp = love.math.noise((ix + map.seed) / 200, (iy + map.seed) / 200)

			for list, _ in ipairs(biomes) do
				if height > biomes[list].noises.height.min and height < biomes[list].noises.height.max then
					if temp > biomes[list].noises.temperature.min and temp < biomes[list].noises.temperature.max then
						love.graphics.draw(blocks[biomes[list].floor].texture(), ix * 64, iy * 64)
    					if love.math.random(0, 500000) == 50 then
							mobs.create({x = (ix * 64)-2000, y = iy * 64, "",type = biomes[list].mob})	
						end
					end
				end
			end
		end
	end
end

return map
