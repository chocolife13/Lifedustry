require("src.screen")
splash_screen = {}

function splash_screen.load()
    love.graphics.print("Lifedustry", screen.relative_to_percent.width(50), screen.relative_to_percent.height(50))
    print("yay")
end