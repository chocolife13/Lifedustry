local assets = require("src.assets")
local screen = require("src.display.screen")
local items = require("src.data.items")

local inventory = {}

inventory.list = {}

inventory.selected = 1

function inventory.add(itemToAdd, numberToAdd)
    for itemIventory, numberIventory in pairs(inventory.list) do
        if itemToAdd == itemIventory then
            inventory.list[itemToAdd] = numberIventory + numberToAdd
            return
        end
    end

    inventory.list[itemToAdd] = numberToAdd
end


function inventory.clear()
    inventory.list = {}
end









function inventory.draw()
    love.graphics.draw(assets.textures.inventory, screen.pct_x(50), screen.height - 20, 0, 1, 1,assets.textures.inventory:getWidth() / 2, assets.textures.inventory:getHeight())
    local i = 0
    for itemIventory, numberIventory in pairs(inventory.list) do
        i = i + 1
        if i == inventory.selected then
            love.graphics.draw(assets.textures.item[itemIventory], screen.mouse.x, screen.mouse.y, 0, 0.5, 0.5)
            love.graphics.setColor(0.5, 0.5, 0.5)
        end
        love.graphics.draw(assets.textures.item[itemIventory], screen.pct_x(50) - ((assets.textures.inventory:getWidth() / 2)) + (i * 64) - 64, (screen.height - 20) - assets.textures.inventory:getHeight())
        if i == inventory.selected then
            love.graphics.setColor(1, 1, 1)
        end
        
        love.graphics.print(tostring(numberIventory), screen.pct_x(50) - ((assets.textures.inventory:getWidth() / 2)) + (i * 64) - 12, (screen.height - 20) - assets.textures.inventory:getHeight())
        
    end
    
end






function inventory.update(dt)
    if love.keyboard.isScancodeDown(keys.inventory.swapto["1"]) then
        inventory.selected = 1
    end

    if love.keyboard.isScancodeDown(keys.inventory.swapto["2"]) then
        inventory.selected = 2
    end
    
    if love.keyboard.isScancodeDown(keys.inventory.swapto["3"]) then
        inventory.selected = 3
    end


    if love.keyboard.isScancodeDown(keys.inventory.swapto["3"]) then
        inventory.selected = 3
    end

end


return inventory
