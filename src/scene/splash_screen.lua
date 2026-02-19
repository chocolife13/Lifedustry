require("src.screen")
require("src.assets")

splash_screen = {}

function splash_screen.load()
    print("Splash screen: loaded")
    splash_screen.orientation = 0
end

function splash_screen.draw()
    love.graphics.draw(assets.textures.splash_screen, screen.relative_to_percent.width(50), screen.relative_to_percent.height(50), splash_screen.orientation, 5, 5, assets.textures.splash_screen:getWidth() / 2, assets.textures.splash_screen:getHeight() / 2)
    love.graphics.print("Lifedustry", screen.relative_to_percent.width(50), screen.relative_to_percent.height(10), 0, 4, 4)
end

function splash_screen.update()
    splash_screen.orientation = splash_screen.orientation + 0.005
end

return splash_screen