local screen = require("src.display.screen")
local assets = require("src.assets")
local ui = require("src.display.ui")



local api = {}

function api.load()
    api.timer = 0
end

function api.draw()
     love.graphics.setBackgroundColor(0, 0, 0)
    ui.print_centered("Loading ...", screen.relative_to_percent.width(50), screen.relative_to_percent.height(50))
end

function api.update(dt)
    api.timer = api.timer + 1 --wait 1000 frame bc loading screen is way too fast
    if api.timer > 1000 then
        require("src.scene.scene_manager").scene = "main_menu"
    end
end

return api