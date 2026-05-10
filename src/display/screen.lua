local api = {}
api.relative_to_percent = {}
api.mouse = {}
function api.relative_to_percent.width(x)  
    return (x / 100)* api.width
end

function api.relative_to_percent.height(y)
    return (y / 100)* api.height
end

function api.update()
    api.width, api.height = love.graphics.getDimensions()
    api.width, api.height = love.graphics.getDimensions()
    api.fullscreen, api.fstype = love.window.getFullscreen() --default value for fstype = desktop, DO NOT CHANGE IT, it's useless (i warned you)
    api.vsync = love.window.getVSync()
    api.mouse.x, api.mouse.y = love.mouse.getPosition()
end

return api