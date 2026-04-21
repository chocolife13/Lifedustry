blocks = require("src.data.blocks")

api = {}

function api.plain(x, y)
    love.graphics.draw(blocks.grass.texture, x * 64, y * 64)
end
function api.moutain(x, y)
    love.graphics.draw(blocks.stone.texture, x * 64, y * 64)
end
function api.water(x, y)
    love.graphics.setColor(0, 0, 1)
    love.graphics.rectangle("fill", x * 64, y * 64, 64, 64)
    love.graphics.setColor(1, 1, 1)
end
return api