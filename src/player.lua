local assets = require("src.assets")
local keys = require("src.data.keys")

local player = {}

player.speed = 500
player.x = 0
player.y = 0

---@type { x: number, y: number }
player.velocity = { x = 0, y = 0 }

function player.draw()
    love.graphics.draw(assets.textures.player, player.x, player.y)
end

function player.update(dt)
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

return player
