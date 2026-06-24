local inventory = require("src.inventory")

local hud = {}

function hud.draw()
    inventory.draw()
end

return hud
