local blocks = require("src.data.blocks")
local biome = require("src.data.biome")
local player = require("src.player")
api = {}

function api.draw()
    -- On calcule l'indice du bloc sur lequel se trouve le joueur
    local start_x = math.floor(player.x / 64)
    local start_y = math.floor(player.y / 64)
    local width, height = love.graphics.getDimensions() 
    -- On dessine autour du joueur (par exemple 10 blocs de rayon pour éviter de voir les bords)
    for ix = start_x - (width / 2)/64, start_x + (width / 2) / 64 do
        for iy = start_y - (height / 2)/64, start_y + ((height / 2)/64)+1 do
            local width, height = love.graphics.getDimensions() 
            local height = love.math.noise(ix / 100, iy / 100)
            
            --love.graphics.setColor(height, height, height)
            
            -- Affichage : (Position du bloc * taille) - Position du joueur pour l'effet caméra
            -- On centre l'affichage au milieu de l'écran (ex: 400, 300)
            local screen_x = (ix * 64) - player.x + 400
            local screen_y = (iy * 64) - player.y + 300
            
            --love.graphics.rectangle("fill", ix*64, iy*64, 64, 64)
            if height < 0.15 then   
                biome.water(ix, iy)
            end
            if height > 0.15 and height < 0.3 then   
                biome.sand(ix, iy)
            end
            if height > 0.3 then   
                biome.plain(ix, iy)
            end
        end
    end
    love.graphics.setColor(1, 1, 1)
end
return api