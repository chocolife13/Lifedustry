local screen = require("src.display.screen")
local assets = require("src.assets")
local ui = require("src.display.ui")



local api = {}

function api.load()
    
end

function api.draw()
     love.graphics.setBackgroundColor(1, 0, 0, 0)
    ui.print_centered("Loading ...", screen.relative_to_percent.width(50), screen.relative_to_percent.height(50))
end

function api.update(dt)
    require("src.scene.scene_manager").scene = "main_menu"
end

return api