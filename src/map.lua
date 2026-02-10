require("src.camera")

map = {}
map.size = 100


function map.tile(x, y, z)
    return x + y*map.size + z*map.size*map.size	or 0
end

function map.getTile(x, y, z)
	return map[map.tile(x, y, z)] or 0
end


function map.setTile(x, y, z, value)
	map[map.tile(x, y, z)] = value
end


function map.setTiles(x1, y1, z1, x2, y2, z2, value)
  for x = x1, x2 do
    for y = y1, y2 do 
      for z = z1, z2 do
        map.setTile(x, y, z, value)
      end
    end
  end
end


function map.selectedTileX()
  return math.ceil((love.mouse.getX() + camera.x) / 32) - 1
end


function map.selectedTileY()
  return math.ceil((love.mouse.getY() + camera.y) / 32) - 1
end



function map.selectedTileZ()
  for z = camera.z + 10, camera.z - 10, -1 do
    if map.getTile(map.selectedTileX(), map.selectedTileY(), z) ~= 0 then
      return z
    end
  end
  return 0
end