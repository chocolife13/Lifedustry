
local api = {}
api.relative_to_percent = {}

function api.relative_to_percent.width(x)  
    return (x / 100)* api.width
end

function api.relative_to_percent.height(y)
    return (y / 100)* api.height
end

function api.update()
    api.width, api.height = love.graphics.getDimensions()
end

return api