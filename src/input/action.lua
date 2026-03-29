require("src.player")
require("src.input.keys")
action = {}


function action.check(dt)
    if love.keyboard.isDown(keys.player_walk_right) then
        player.velocity.x =  player.speed * dt
    end
    if love.keyboard.isDown(keys.player_walk_left) then
        player.velocity.x = 0-player.speed * dt
    end
    if love.keyboard.isDown(keys.player_walk_up) then
        player.velocity.y = 0- player.speed * dt
    end
    if love.keyboard.isDown(keys.player_walk_down) then
        player.velocity.y =  player.speed * dt
    end
end
