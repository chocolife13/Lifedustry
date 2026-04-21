local blocks = require("src.data.blocks")
local biome = require("src.data.biome")
api = {}

function api.draw()
    for ix = 0, love.graphics.getWidth() / 64 do
        for yx = 0, love.graphics.getHeight() / 64 do
            local temp = love.math.noise(ix / 200, yx / 200)
            local height = love.math.noise(ix / 100, yx / 100)
            if height < 0.15 then   
                biome.water(ix, yx)
            end
            if height > 0.15 then   
                biome.plain(ix, yx)
            end
        end
    end
   
end
return api