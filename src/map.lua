local blocks = require("src.data.blocks")
local biome = require("src.data.biome")
local player = require("src.player")
api = {}

function api.draw()
    for ix = 0, love.graphics.getWidth() / 64 do
        for yx = 0, love.graphics.getHeight() / 64 do
            local temp = love.math.noise((ix + player.x) / 200, (yx + player.y) / 200)
            local height = love.math.noise((ix + player.x) / 100, (yx + player.y) / 100)
            love.graphics.setColor(height, height, height)
            love.graphics.rectangle("fill", (ix * 64) + player.x, (yx * 64) + player.y, 64, 64)
            love.graphics.setColor(1, 1, 1)
            --if height < 0.15 then   
            --    biome.water(ix, yx)
            --end
            --if height > 0.15 then   
            --    biome.plain(ix, yx)
            
            --end
        end
    end
   
end
return api