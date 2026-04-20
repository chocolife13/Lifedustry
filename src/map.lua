local blocks = require("src.data.blocks")

api = {}

function api.draw()
    for ix = 0, 20 do
        for yx = 0, 20 do
            if love.math.noise(ix/20, yx/20) > 0.5 then
                love.graphics.draw(blocks.grass.texture, ix * 64, yx * 64)
            else
                love.graphics.draw(blocks.stone.texture, ix * 64, yx * 64)
            end
        end
    end
end
return api