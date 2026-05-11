local screen = require("src.display.screen")
local assets = require("src.assets")
local ui = require("src.display.ui")
local SceneManager = require("src.scene_manager")
local args = require("src.args")

local loading = {}
local WAIT_FRAMES = 200
local timer = 0

function loading.load()
    timer = 0
    assets.load()
end

function loading.draw()
    love.graphics.setBackgroundColor(0, 0, 0)
    ui.print_centered("Loading ...", screen.pct_x(50), screen.pct_y(50))
end

function loading.update()
    timer = timer + 1
    if timer > WAIT_FRAMES then
        local next = args.target_scene or "main"
        args.target_scene = nil
        SceneManager.switch(next)
    end
end

return loading
