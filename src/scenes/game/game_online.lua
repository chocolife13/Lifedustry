local assets = require("src.assets")
local player = require("src.player")
local mobs = require("src.mobs")
local camera = require("src.camera")
local screen = require("src.display.screen")
local hud = require("src.hud")
local gui = require("src.display.gui")
local event = require("src.event")
local time = require("src.time")
local client = require("src.multiplayer.client")
local map = require("src.map")
local game = {}

function game.load()
    local ip = gui.get("ip", "text")
	client.connect(ip)
    map.seed = nil
    gui.reset()
    game.timeStop = false
	assets.audios.music.menu:stop()
end

function game.draw()
	camera.draw()
    hud.draw()
    event.draw()
end

function game.update(dt)
    client.update()
	if _G.DEV and love.keyboard.isDown("t") then game.timeStop = not game.timeStop end
    if not game.timeStop then mobs.update(dt) end
    time.update(dt)
    event.update(dt)
	player.update(dt)
	if map.seed then
        camera.update(dt)
    end
    hud.update(dt)
end

function love.keypressed(key, scancode)
    if key == "f11" then
        screen.fullscreen = not screen.fullscreen
        love.window.setFullscreen(screen.fullscreen)
    end
end
return game
