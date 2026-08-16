local assets = require("src.assets")

events = {}

events.winter = {
    timer = 0,
    duration = 30000,
    update = function()
        return
    end,

    draw = function()
        love.graphics.draw(assets.textures.snowball, 0, 0)
    end
}

return events