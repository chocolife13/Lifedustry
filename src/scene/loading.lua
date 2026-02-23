local screen = require("src.screen")
local assets = require("src.assets")
local ui = require("src.ui")



local api = {}

function api.load()
    
end

function api.draw()
    ui.print_centered("Loading ...", screen.relative_to_percent.width(50), screen.relative_to_percent.height(50))
end

function api.update(dt)
    require("src.scene.scene_manager").scene = "main_menu"
end

return api