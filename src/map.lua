local blocks = require("src.data.blocks")
local biome = require("src.data.biome")
local player = require("src.player")
local screen = require("src.display.screen")


local api = {}
api.seed = love.math.random(0, 99999)
function api.draw(x, y, zoom)
    local start_x = math.floor(x / 64)
    local start_y = math.floor(y / 64)
    for ix = (start_x - (screen.width / 2)/64)/zoom, (start_x + (screen.width / 2) / 64)/zoom do --cliping for x and y and btw 64 is thi tile dimmension 64x64
        for iy = (start_y - (screen.height / 2)/64)/zoom, (start_y + ((screen.height / 2)/64)+1)/zoom do
            local height = love.math.noise((ix + api.seed) / 100, (iy + api.seed) / 100) --gen a noise for height
            local temp = love.math.noise((ix + api.seed) / 200, (iy + api.seed) / 200) --gen a noise for height
            --biome conditions
            if height < 0.1 then   
                biome.water(ix, iy)
            elseif temp > 0.8 then   
                biome.desert(ix, iy)
            elseif height > 0.5 and temp < 0.3 then   
                biome.snow(ix, iy)
            elseif height > 0.1 then   
                biome.plain(ix, iy)
            end
        end
    end
end
return api