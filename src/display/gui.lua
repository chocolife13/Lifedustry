local ui = require("src.display.ui")
local screen = require("src.display.screen")


local api = {}

function api.button(text, x, y, width, height, callback)
    local x = screen.relative_to_percent.width(x) - width / 2
    local y = screen.relative_to_percent.height(y) - height / 2
    local mx, my = love.mouse.getPosition()
    local button = 1
    local isHover = (mx > (x) and mx < (x) + width and my > (y) and my < (y) + height)
    if isHover then
        function love.mousereleased(x, y, button)
            callback()
        end
    end
    ui.print_centered(text, x + width / 2, y + height / 2)
    love.graphics.rectangle("line", x , y, width, height)
end



return api
