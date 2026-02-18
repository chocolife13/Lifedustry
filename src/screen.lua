screen = {}




screen.relative_to_percent = {}
function screen.relative_to_percent.width(x)  
    screen.width, screen.height = love.graphics.getDimensions() 
    return (x / 100)* screen.width
end

function screen.relative_to_percent.height(y)
    screen.width, screen.height = love.graphics.getDimensions()
    return (y / 100)* screen.height
end


return screen