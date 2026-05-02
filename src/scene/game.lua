local player = require("src.player")
local camera = require("src.camera")
local debug = require("src.core.debug")


local api = {}



function api.load()
end

function api.draw()
    camera.draw()
end

function api.update(dt)
    player.update(dt)
    camera.update(dt)
    
    if dev then debug.keycheck() end
end

return api
