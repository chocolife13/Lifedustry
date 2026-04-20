local blocks = require("src.data.blocks")

api = {}

function api.draw()
    for ix = 0, 10 do
        for yx = 0, 10 do
            love.graphics.draw(blocks.grass.texture, ix * 64, yx * 64)
        end
    end
end
return api