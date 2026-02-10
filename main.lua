--[[
]]
require("src.map")
require("src.tiles")
require("src.biomes")
require("src.world_draw")
require("src.camera")
require("src.keys")
require("src.player")
require("src.ui")

-- ces deux ligne servent a savoir la resolution de l'ecran
screenWidth  = love.graphics.getWidth()  
screenHeight = love.graphics.getHeight()




-- ces ytois boucles sont les boucle principale du jeux

function love.load()
  gen.flat_map()
end



-- ces deux boucles sont les boucle principale du jeux


function love.update(dt) -- la partit mise a jour
  player.update(dt)
  camera.update(dt)
end


function love.draw() -- la partit graphique
  draw.map()
  player.draw()
  ui.draw()
end