local player = require("src.player")
local mobs = require("src.mobs")
local camera = require("src.camera")
local debug = require("src.core.debug")


local api = {}



function api.load()
end

function api.draw()
    camera.draw()
end

function api.update(dt)
    mobs.update(dt)
    player.update(dt)
    camera.update(dt)
    
    if dev then debug.keycheck() end
end

return api
