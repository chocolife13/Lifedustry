require("src.input.keys")
require("src.func")
camera = {}

camera.zoom = 1

function camera.init()
  require("src.player")
  camera.x = player.x
  camera.y = player.y
  camera.z = 1
  camera.lerp = 5 
end


local function lerp(a, b, t)
    return a + (b - a) * t
end

function camera.gotoPos(x, y, z)
  camera.x = x
  camera.y = y
  camera.z = z
end

function camera.update(dt)
  camera.gotoPos(lerp(camera.x , player.x, camera.lerp * dt), lerp(camera.y, player.y, camera.lerp * dt), camera.z)
end
