require("src.map")
require("src.function")
player = {}
player.x = 0
player.y = 0
player.z = 1
player.speed = 1000
player.texture = love.graphics.newImage("assets/textures/player.png")
player.velocity = {x = 0,y = 0}



function player.draw()
  
  mouseWorldX = love.mouse.getX() + camera.x - screenWidth / 2
  mouseWorldY = love.mouse.getY() + camera.y - screenHeight / 2


  local angle = math.atan2(mouseWorldY - player.y, mouseWorldX - player.x)
  
  love.graphics.draw(player.texture, player.x - camera.x + screenWidth / 2, player.y - camera.y + screenHeight / 2, angle, 1, 1, player.texture:getWidth() / 2, player.texture:getHeight() / 2)
end

function player.collide()
  if map.getTile(map.player_x, map.player_y, player.z) ~= 0 then
    player.velocity.x = 0 - player.velocity.x
  end
end
function player.reset_velocity()
  player.velocity.x = 0
  player.velocity.y = 0
end
function player.move()
  player.x = player.x + player.velocity.x
  player.y = player.y + player.velocity.y
end
function player.update(dt)
  player.reset_velocity()
  
map.player_x = math.ceil((player.x + screenWidth / 2) / 32) - 1
map.player_y = math.ceil((player.y + screenHeight / 2) / 32) - 1
  
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
  
player.move()
player.collide()


end


function love.mousepressed(x, y, button, istouch, presses)
    if button == 1 then -- bouton gauche
        map.setTile(map.selectedTileX(), map.selectedTileY(), map.selectedTileZ(), 0)
        -- ici tu peux mettre ton code pour commencer une action
    end
    if button == 2 then -- bouton gauche
        map.setTile(map.selectedTileX(), map.selectedTileY(), map.selectedTileZ() + 1, 1)
        -- ici tu peux mettre ton code pour commencer une action
    end




end


 