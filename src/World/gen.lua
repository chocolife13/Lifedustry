require("src.World.map")
require("src.data.biomes")
gen = {}


function gen.surface_biome(x, y, biome_select)
    local height_noise = love.math.noise(x * 0.002, y * 0.0012)
    local temperature_noise = love.math.noise(x * 0.002, y * 0.002, 255)
    local object_noise = love.math.noise(x * 0.9, y * 0.9, 255)
    if temperature_noise > biome_select.temperature.min and temperature_noise < biome_select.temperature.max and
      height_noise > biome_select.height.min and height_noise < biome_select.height.max then
        map.setTile(x, y, 0, biome_select.floor)
        if object_noise > 0.7 then
          map.setTile(x, y, 1, biome_select.object)
        end
    end
end


function gen.map()
  for x = 0, map.size  do
    for y = 0, map.size  do
     gen.surface_biome(x, y, biome.plain)
     gen.surface_biome(x, y, biome.desert)
     gen.surface_biome(x, y, biome.snowy)
     gen.surface_biome(x, y, biome.stone)
     gen.surface_biome(x, y, biome.see)
     gen.surface_biome(x, y, biome.hell)
    end
  end
end

