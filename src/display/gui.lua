local ui = require("src.display.ui")
local screen = require("src.display.screen")
local api = {}

function api.button(text, x, y, width, height, callback)
    local x = screen.relative_to_percent.width(x)
    local y = screen.relative_to_percent.height(y)

    ui.print_centered(text, x, y)
    love.graphics.rectangle("line", x - width / 2, y - height / 2, width, height)
end

function api.update()
    print()
end
api.update = {}
api.update.list = {"z"}

return api
