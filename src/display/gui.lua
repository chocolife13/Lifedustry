--gui graphic user interface like buttun panel window
local ui = require("src.display.ui")
local screen = require("src.display.screen")


local api = {}

local waspressed = false



function api.button(text, x, y, width, height, callback) --help for not click for all
    local bx = screen.relative_to_percent.width(x) - width / 2
    local by = screen.relative_to_percent.height(y) - height / 2
    local mx, my = love.mouse.getPosition()
    local isHover = (mx > bx and mx < bx + width and my > by and my < by + height)

    
    
    function love.mousereleased(x, y, button)
        if button == 1 then
            if isHover then 
                callback()
            end
        end
    end
        
        

    
    love.graphics.rectangle("line", bx, by, width, height)
    ui.print_centered(text, bx + width / 2, by + height / 2)
end


return api
