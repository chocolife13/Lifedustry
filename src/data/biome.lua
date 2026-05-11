local blocks = require("src.data.blocks")

local biome = {}

local TILE = 64 -- tile size in pixels

---@param x integer  tile column
---@param y integer  tile row
function biome.plain(x, y)
    love.graphics.draw(blocks.grass.texture(), x * TILE, y * TILE)
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
end

---@param x integer
---@param y integer
function biome.water(x, y)
    love.graphics.draw(blocks.water.texture(), x * TILE, y * TILE)
end

---@param x integer
---@param y integer
function biome.snow(x, y)
    love.graphics.draw(blocks.snow.texture(), x * TILE, y * TILE)
end

return biome
