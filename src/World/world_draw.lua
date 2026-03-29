require("src.World.map")
require("src.camera")
require("src.data.tiles")
draw = {}


screenWidth  = love.graphics.getWidth()
screenHeight = love.graphics.getHeight()


function draw.getTextureFromIndex(x, y, z)
  return tile[map.getTile(x, y, z)].texture or 0
end


function draw.map()
  local startX = math.max(math.floor(camera.x / (32 * camera.zoom)) - 1, 0)
  local endX = math.min(math.ceil((camera.x + screenWidth)/ (32 * camera.zoom)) - 1, map.size -1)

  local endY = math.min(math.ceil((camera.y + screenHeight)/ (32 * camera.zoom) )- 1, map.size -1)
  local startY = math.max(math.floor(camera.y / (32 * camera.zoom)) - 1, 0)

  for z = -1, 3 do
   for x = startX, endX  do
    for y = startY, endY do

        if draw.getTextureFromIndex(x, y, z) and draw.getTextureFromIndex(x, y, z) ~= 0 then
          love.graphics.draw(draw.getTextureFromIndex(x, y, z), (x * (32 * camera.zoom)) - camera.x, (y * (32 * camera.zoom)) - camera.y, 0, camera.zoom, camera.zoom)
        end
      end
    end
  end
end
