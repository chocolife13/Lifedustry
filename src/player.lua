local assets = require("src.assets")
local keys = require("src.data.keys")
local SceneManager = require("src.scene_manager")
local screen = require("src.display.screen")
local inventory = require("src.inventory")
local items = require("src.data.items")
local time = require("src.time")
local player = {}

player.speed = 500
player.x = 0
player.y = 0
player.hp = 100
player.maxhp = 100

---@type { x: number, y: number }
player.velocity = { x = 0, y = 0 }

function player.draw()
    love.graphics.setColor(time.timer /10000, time.timer/10000, time.timer/10000)
    love.graphics.draw(assets.textures.player, player.x, player.y, player.rotation - (math.pi / 2), 1, 1, assets.textures.player:getWidth() / 2, assets.textures.player:getHeight() /2)
    if inventory.list[inventory.selected].name then
        love.graphics.draw(items[inventory.list[inventory.selected].name].texture, player.x, player.y, player.rotation - (math.pi / 2), 0.5, 0.5, -20)
    end
    love.graphics.setColor(1, 1, 1)
end

function player.update(dt)
    
    player.rotation = math.atan2(screen.mouse.y - screen.height/2, screen.mouse.x - screen.width/2)


    if love.keyboard.isDown(keys.player.up) then
        player.velocity.y = -player.speed
    end
    if love.keyboard.isDown(keys.player.down) then
        player.velocity.y = player.speed
    end
    if love.keyboard.isDown(keys.player.left) then
        player.velocity.x = -player.speed
    end
    if love.keyboard.isDown(keys.player.right) then
        player.velocity.x = player.speed
    end

    -- Normalise diagonal movement so speed stays consistent
    local vx, vy = player.velocity.x, player.velocity.y
    if vx ~= 0 or vy ~= 0 then
        local length = math.sqrt(vx ^ 2 + vy ^ 2)
        player.velocity.x = (vx / length) * dt * player.speed
        player.velocity.y = (vy / length) * dt * player.speed
    end

    

    player.x = player.x + player.velocity.x
    player.y = player.y + player.velocity.y
    player.velocity.x = 0
    player.velocity.y = 0

    
end


function player.hit(number)
    assets.audios.sfx.hit:stop()
    assets.audios.sfx.hit:play()
    player.hp = player.hp - number
         
    if player.hp < 1 then
        player.hp = 100
        SceneManager.switch("gameover")
    end
end

return player
