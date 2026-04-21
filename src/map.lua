local blocks = require("src.data.blocks")
local biome = require("src.data.biome")
api = {}

function api.draw()
    for ix = 0, 200 do
        for yx = 0, 200 do
            -- On récupère une valeur entre 0 et 1
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