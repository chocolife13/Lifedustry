require("src.data.tiles")
inventory = {}

inventory.slots = 1

function inventory.draw()
    love.graphics.draw(tile[inventory.slots].texture, love.mouse.getX(), love.mouse.getY())
end
