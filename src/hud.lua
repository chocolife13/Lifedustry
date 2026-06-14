local assets = require("src.assets")
local screen = require("src.display.screen")

local hud = {}

function hud.draw()
    love.graphics.draw(assets.textures.inventory, screen.pct_x(50), screen.height - 20, 0, 1, 1, assets.textures.inventory:getWidth() / 2, assets.textures.inventory:getHeight())
end

return hud