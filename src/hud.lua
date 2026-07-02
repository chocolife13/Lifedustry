local hotbar = require("src.hotbar")

local hud = {}

function hud.draw()
    hotbar.draw()
end

function hud.update(dt)
    hotbar.update(dt)
end

return hud
