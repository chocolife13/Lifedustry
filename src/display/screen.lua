local screen = {}

screen.width = love.graphics.getWidth()
screen.height = love.graphics.getHeight()
screen.fullscreen = false
screen.vsync = 1

screen.mouse = {}

--- Converts a percentage (0–100) of the screen width to pixels.
---@param x number
---@return number
function screen.pct_x(x)
    return (x / 100) * screen.width
end

--- Converts a percentage (0–100) of the screen height to pixels.
---@param y number
---@return number
function screen.pct_y(y)
    return (y / 100) * screen.height
end

--- Updates cached screen dimensions and window state. Call once per frame.
function screen.update()
    screen.width, screen.height = love.graphics.getDimensions()
    screen.fullscreen, _ = love.window.getFullscreen()
    screen.vsync = love.window.getVSync()
    screen.mouse.x, screen.mouse.y = love.mouse.getPosition()
end

return screen
