require("src.world.map")
require("src.data.tiles")
require("src.data.biomes")
require("src.world.world_draw")
require("src.camera")
require("src.input.keys")
require("src.player")
require("src.ui.ui")
require("src.world.time")
require("src.func")
require("src.world.gen")
require("src.inventory")
require("src.input.action")

function love.load()
  camera.init()
  gen.map()
end


function love.update(dt)
	player.update(dt)
	camera.update(dt)
	func.update()
	action.check(dt)
	player.move()
	player.collide()
end





function love.draw()

	time.update()
	draw.map()
	player.draw()
	inventory.draw()
	ui.draw()
end
