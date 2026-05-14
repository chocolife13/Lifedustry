local blocks = require("src.data.blocks")
local mobs = require("src.mobs")

local biome = {}

local TILE = 64 -- tile size in pixels

---@param x integer  tile column
---@param y integer  tile row
function biome.plain(x, y)
    love.graphics.draw(blocks.grass.texture(), x * TILE, y * TILE)
    if love.math.random(0, 500000) == 50 then
		mobs.create(x * 64, y * 64, "","chicken")	
	end
    
end

---@param x integer
---@param y integer
function biome.mountain(x, y)
    love.graphics.draw(blocks.stone.texture(), x * TILE, y * TILE)
end

---@param x integer
---@param y integer
function biome.desert(x, y)
    love.graphics.draw(blocks.sand.texture(), x * TILE, y * TILE)
    if love.math.random(0, 500000) == 50 then
		mobs.create((x * 64)-2000, y * 64, "","ball")	
	end
end

---@param x integer
---@param y integer
function biome.water(x, y)
    love.graphics.draw(blocks.water.texture(), x * TILE, y * TILE)
    if love.math.random(0, 50000) == 50 then
		mobs.create(x * 64, y * 64, "","fish")	
	end
end

---@param x integer
---@param y integer
function biome.snow(x, y)
    love.graphics.draw(blocks.snow.texture(), x * TILE, y * TILE)
    if love.math.random(0, 500000) == 50 then
		mobs.create(x * 64, y * 64, "","snowman")	
	end
end

return biome
