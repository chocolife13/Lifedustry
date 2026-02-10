require("src.map")
require("src.camera")
require("src.tiles")
draw = {}


screenWidth  = love.graphics.getWidth()
screenHeight = love.graphics.getHeight()


-- fonction qui retourne la texture avec l'id du block
function draw.getTextureFromIndex(x, y, z) 
  return tile[map.getTile(x, y, z)].texture or 0
end



-- fonction qui dessine la carte depuis ./main.lua
function draw.map() 
   for x = math.ceil(camera.x / 32) -1, math.ceil((camera.x + screenWidth)/ 32)  do
    for y = math.ceil(camera.y / 32) -1, math.ceil((camera.y + screenHeight)/ 32)  do 
      for z = 0, 3 do
        if draw.getTextureFromIndex(x, y, z) ~= 0 then 
          local TextureFromIndex = draw.getTextureFromIndex(x, y, z)
          love.graphics.draw(TextureFromIndex, (x * 32) - camera.x, (y * 32) - camera.y)
        end
      end
    end
  end
end
