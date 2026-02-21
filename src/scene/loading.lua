require("src.screen")
require("src.assets")
require("src.ui")

self = {}

function self.load()
    self.orientation = 0
end

function self.draw()
    love.graphics.draw(assets.textures.splash_screen, screen.relative_to_percent.width(50), screen.relative_to_percent.height(50), self.orientation, 5, 5, assets.textures.splash_screen:getWidth() / 2, assets.textures.splash_screen:getHeight() / 2)
    ui.print_centered("Lifedustry", screen.relative_to_percent.width(50), screen.relative_to_percent.height(10))
end

function self.update()
    self.orientation = self.orientation + 0.005
end

return self