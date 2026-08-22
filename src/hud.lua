local hotbar = require("src.hotbar")
local hpbar = require("src.hpbar")

local hud = {}

function hud.draw()
    hotbar.draw()
    hpbar.draw()
end

function hud.update(dt)
    hotbar.update(dt)
end

return hud
