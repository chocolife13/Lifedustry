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
    api.timer = api.timer + 1 --wait 200 frame bc loading screen is way too fast (can't even see it)
    if api.timer > 200 then
        require("src.scene.scene_manager").scene = "main_menu"
    end
end

return api