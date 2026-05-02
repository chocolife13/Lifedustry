local blocks = require("src.data.blocks")
local biome = require("src.data.biome")
local player = require("src.player")



local api = {}

function api.draw(x, y)
    local start_x = math.floor(x / 64)
    local start_y = math.floor(y / 64)
    local width, height = love.graphics.getDimensions() -- yes another  
    for ix = (start_x - (width / 2)/64)/player.zoom, (start_x + (width / 2) / 64)/player.zoom do --cliping for x and y and btw 64 is thi tile dimmension 64x64
        for iy = (start_y - (height / 2)/64)/player.zoom, (start_y + ((height / 2)/64)+1)/player.zoom do
            local width, height = love.graphics.getDimensions() 
            local height = love.math.noise(ix / 100, iy / 100) --gen a noise for height
            local temp = love.math.noise(ix / 200, iy / 200) --gen a noise for height
            --biome conditions
            if height < 0.1 then   
                biome.water(ix, iy)
            end
            if height > 0.1 then   
                biome.plain(ix, iy)
            end
            if height > 0.5 and temp < 0.3 then   
                biome.snow(ix, iy)
            end
            if temp > 0.8 then   
                biome.desert(ix, iy)
            end
        end
    end
end
return api