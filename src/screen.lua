screen = {}



function screen.relative_to_percent(x, y)
    screen.width, screen.height = love.graphics.getPixelDimensions()
    return (x / 100)* screen.width, (y / 100)* screen.height
end

return screen