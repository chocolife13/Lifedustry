local ui = require("src.display.ui")
local screen = require("src.display.screen")


local api = {}

function api.button(text, x, y, width, height, callback)
    local x = screen.relative_to_percent.width(x) - width / 2
    local y = screen.relative_to_percent.height(y) - height / 2
    local mx, my = love.mouse.getPosition()
    local isHover = (mx > (x) and mx < (x) + width and my > (y) and my < (y) + height)
    local isClicked = isHover and love.mouse.isDown(1)
    if isClicked then  
        callback()
        
    end
    ui.print_centered(text, x + width / 2, y + height / 2)
    love.graphics.rectangle("line", x , y, width, height)
end



return api
