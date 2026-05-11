local SceneManager = require("src.scene_manager")
local assets       = require("src.assets")
local dev          = require("src.core.dev")
local screen       = require("src.display.screen")
local gui          = require("src.display.gui")
local args         = require("src.args")

---@type boolean
_G.DEV = false -- set by args; global so every module can read it

function love.load(arg)
    args.start(arg)
    if DEV then dev.load() end
    assets.preload()
    SceneManager.load()
end

function love.update(dt)
    SceneManager.update(dt)
    screen.update()
    if DEV then dev.keycheck() end
end

function love.draw()
    gui.begin_frame()
    SceneManager.draw()
    if DEV then dev.info() end
end
