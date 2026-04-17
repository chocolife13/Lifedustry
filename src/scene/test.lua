local screen = require("src.display.screen")
local assets = require("src.assets")
local ui = require("src.display.ui")

local api = {}

function api.load()
    print("Welcome nerdy developer to the test scene")
    api.orientation = 0
    
end

function api.draw()
    love.graphics.draw(assets.textures.splash_screen, screen.relative_to_percent.width(50), screen.relative_to_percent.height(50), api.orientation, 5, 5, assets.textures.splash_screen:getWidth() / 2, assets.textures.splash_screen:getHeight() / 2)
    ui.print_centered("Lifedustry", screen.relative_to_percent.width(50), screen.relative_to_percent.height(10))
    love.graphics.setBackgroundColor(0, 0.30, 1, 0)
end

function api.update(dt)
    api.orientation = api.orientation + dt

end

return api