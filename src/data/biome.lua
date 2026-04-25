blocks = require("src.data.blocks")

api = {}

function api.plain(x, y)
    love.graphics.draw(blocks.grass.texture, x * 64, y * 64)
end
function api.moutain(x, y)
    love.graphics.draw(blocks.stone.texture, x * 64, y * 64)
end
function api.desert(x, y)
    love.graphics.draw(blocks.sand.texture, x * 64, y * 64)
end
function api.water(x, y)
    love.graphics.draw(blocks.water.texture, x * 64, y * 64)
end
function api.snow(x, y)
    love.graphics.draw(blocks.snow.texture, x * 64, y * 64)
end
return api