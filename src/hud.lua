local inventory = require("src.inventory")

local hud = {}

function hud.draw()
    inventory.draw()
end

function hud.update(dt)
    inventory.update(dt)
end

return hud
