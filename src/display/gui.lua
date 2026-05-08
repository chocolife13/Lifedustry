--gui graphic user interface like buttun panel window
local ui = require("src.display.ui")
local screen = require("src.display.screen")


local api = {}

local buttons = {}

function api.begin_frame()
    buttons = {}
end


function api.button(text, x, y, width, height, callback) --help for not click for all
    local bx = screen.relative_to_percent.width(x) - width / 2
    local by = screen.relative_to_percent.height(y) - height / 2

    table.insert(buttons, {
        x = bx,
        y = by,
        width = width,
        height = height,
        callback = callback
    })

    love.graphics.rectangle("line", bx, by, width, height)
    ui.print_centered(text, bx + width / 2, by + height / 2)
end

function api.mousereleased(x, y, button)
    if button ~= 1 then return end

    for _, gui_button in ipairs(buttons) do
        local isHover = (
            x > gui_button.x and
            x < gui_button.x + gui_button.width and
            y > gui_button.y and
            y < gui_button.y + gui_button.height
        )

        if isHover then
            gui_button.callback()
            return
        end
    end
end


return api
