--[[

      -- Ici on charge tout ce dont le jeu a besoin pour fonctionner
]]
require("src.map")
require("src.tiles")
require("src.biomes")
require("src.world_draw")
require("src.camera")
require("src.keys")
require("src.player")
require("src.ui")


screenWidth  = love.graphics.getWidth() -- Ça sert a savoir la resolution de l'ecran 
screenHeight = love.graphics.getHeight()





function love.load() -- Fonction lancée au démarrage du jeu qui sert a génère la map au début
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