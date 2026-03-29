local api = {}
api.relative_to_percent = {}

function api.relative_to_percent.width(x)  
    local width, height = love.graphics.getDimensions() 
    return (x / 100)* width
end

function api.relative_to_percent.height(y)
    local width, height = love.graphics.getDimensions()
    return (y / 100)* height
end


return api