local assets = require("src.assets")
local ui = require("src.display.ui")
local math = require("src.core.math")
local player = require("src.player")

local api = {}
api.last = 0


function api.create(x, y)
    api.last = api.last + 1
    api[api.last] = {} 
    api[api.last].x = x or 0
    api[api.last].y = y or 0
    api[api.last].name = name
    api[api.last].type = type
end

api.create(nil)
api.create(20, -200)



function api.update(dt)
    api[1].x = math.lerp(api[1].x, player.x, dt)
    api[2].x = api[2].x + dt * 100
end

function api.draw()
    for i=1, api.last  do
        ui.print_centered(i, api[i].x, api[i].y -20)
        love.graphics.draw(assets.textures.player, api[i].x, api[i].y)
    end
end

return api