local assets = require("src.assets")

local api = {}
api.x = 0
api.y = 0
api.timer = 0 -- Variable pour suivre le temps

-- Paramètres de l'onde
local amplitude = 50  -- Hauteur de la vague (en pixels)
local vitesse = 5    -- Vitesse de l'oscillation
local y_central = 0 -- Position verticale de base

function api.update(dt)
    api.timer = api.timer + dt
    
    -- Avancement horizontal classique
    api.x = api.x + 100 * dt
    
    -- Calcul du mouvement sinusoïdal
    -- Formule : Position de base + (sin(temps * vitesse) * amplitude)
    api.y = y_central + math.sin(api.timer * vitesse) * amplitude
end

function api.draw()
    love.graphics.setColor(0, 0, 0, 0.5)
    love.graphics.rectangle("fill", api.x-5, api.y-20, 30, 15)
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.print("bob", api.x, api.y-20)
    love.graphics.draw(assets.textures.player, api.x, api.y)
end

return api