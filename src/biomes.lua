require("src.map")

gen = {biome}

love.math.setRandomSeed(os.time())

  
function gen.flat_map()
  map.setTiles(0, 0, -1, map.size, map.size, -1, 2)

  for x = 0, map.size do
    for y = 0, map.size do 
        local noise = love.math.noise(x + 0, y + 0)
        if noise < 0.017 then
          map.setTile(x, y, 1, 3)
        elseif noise > 0.7 then
          map.setTile(x, y, 1, 5)
        end
    end
  end

end