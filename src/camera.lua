require("src.keys") 
camera = {}
-- Positionement par default de la caméra
camera.x = 0
camera.y = 0
-- Zoom de la caméra
camera.z = 1

-- Vitesse de la caméra
camera.lerp = 5

local function lerp(a, b, t)
    return a + (b - a) * t
end

function camera.gotoPos(x, y, z)
  camera.x = x
  camera.y = y
  camera.z = z
end

function camera.update(dt)
  camera.gotoPos(lerp(camera.x, player.x, camera.lerp * dt), lerp(camera.y, player.y, camera.lerp * dt), camera.z)
end
