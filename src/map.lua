local biomes = require("src.data.biomes")
local blocks = require("src.data.blocks")
local screen = require("src.display.screen")
local mobs = require("src.mobs")
local assets = require("src.assets")
local player = require("src.player")

local map = {}

map.seed = love.math.random(0, 99999)
local TileSize = 64
map.world = {}

-- Fonction utilitaire pour générer ou récupérer un bloc selon le bruit
local function getOrGenerateTile(ix, iy)
    local key = ix .. "," .. iy
    if not map.world[key] then
		local height = love.math.noise((ix + map.seed) / 100, (iy + map.seed) / 100)
		local temp = love.math.noise((ix + map.seed) / 200, (iy + map.seed) / 200)
		for list, _ in ipairs(biomes) do
			if height > biomes[list].noises.height.min and height < biomes[list].noises.height.max then
				if temp > biomes[list].noises.temperature.min and temp < biomes[list].noises.temperature.max then
					map.world[key] = blocks[biomes[list].floor].texture()
				end
			end
		end
    end

	return map.world[key]
end

function map.update(camera_x, camera_y)
    -- Calcul de la demi-largeur et demi-hauteur en nombre de tuiles
    local half_w = math.ceil((screen.width / 2) / TileSize)
    local half_h = math.ceil((screen.height / 2) / TileSize)

    -- Origine de la caméra en coordonnées de tuiles
    local origin_x = math.floor(camera_x / TileSize)
    local origin_y = math.floor(camera_y / TileSize)

    -- Génération des tuiles visibles autour du joueur
    for ix = origin_x - half_w, origin_x + half_w do
        for iy = origin_y - half_h, origin_y + half_h do
            getOrGenerateTile(ix, iy)
        end
    end
end

function map.draw(camera_x, camera_y, camera_zoom)
    local half_w = math.ceil(((screen.width / camera_zoom) / 2) / TileSize)
    local half_h = math.ceil(((screen.height / camera_zoom) / 2) / TileSize)

    local origin_x = math.floor(camera_x / TileSize)
    local origin_y = math.floor(camera_y / TileSize)

    for ix = origin_x - half_w, origin_x + half_w do
        for iy = origin_y - half_h, origin_y + half_h do
            local key = ix .. "," .. iy
            if map.world[key] then
                -- On multiplie par TileSize pour replacer en pixels réels à l'écran
                love.graphics.draw(map.world[key], ix * TileSize, iy * TileSize)
            end
        end
    end
end

return map