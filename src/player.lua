require("src.World.map")
require("src.func")
player = {}
player.x = ((map.size / 2) - (screenWidth/2)/(32 * camera.zoom))* 32
player.y = ((map.size / 2) - (screenHeight/2)/(32 * camera.zoom))* 32
player.z = 1
player.speed = 1000
player.texture = love.graphics.newImage("assets/textures/player.png")
player.velocity = {x = 0,y = 0}



function player.draw()
  
  mouseWorldX = love.mouse.getX() + camera.x - screenWidth / 2
  mouseWorldY = love.mouse.getY() + camera.y - screenHeight / 2


  local angle = math.atan2(mouseWorldY - player.y, mouseWorldX - player.x)
  
  love.graphics.draw(player.texture, player.x - camera.x + screenWidth / 2, player.y - camera.y + screenHeight / 2, angle, camera.zoom, camera.zoom, player.texture:getWidth() / 2, player.texture:getHeight() / 2)
end

function player.collide()
  if map.getTile(map.player_x, map.player_y, player.z) ~= 0 then
    player.velocity.x = 0- player.velocity.x
    player.velocity.y = 0- player.velocity.y
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
  
map.player_x = math.ceil((player.x + screenWidth / 2) / (32 * camera.zoom)) - 1
map.player_y = math.ceil((player.y + screenHeight / 2) / (32 * camera.zoom)) - 1
  
  
  




end


function love.mousepressed(x, y, button, istouch, presses)
    if button == 1 then -- bouton gauche
        map.setTile(map.selectedTileX(), map.selectedTileY(), map.selectedTileZ(), 0)
        
    end
    if button == 2 then -- bouton gauche
        map.setTile(map.selectedTileX(), map.selectedTileY(), map.selectedTileZ() + 1, inventory.slots)
        -- ici tu peux mettre ton code pour commencer une action
    end




end


 
