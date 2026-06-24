local assets = require("src.assets")
local screen = require("src.display.screen")
local items = require("src.data.items")

local inventory = {}

inventory.list = {}



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





function inventory.print()
    for itemIventory, numberIventory in pairs(inventory.list) do
        print(itemIventory .. ": " .. numberIventory)
    end
end





function inventory.draw()
    love.graphics.draw(assets.textures.inventory, screen.pct_x(50), screen.height - 20, 0, 1, 1,assets.textures.inventory:getWidth() / 2, assets.textures.inventory:getHeight())
    local i = 0
    for itemIventory, numberIventory in pairs(inventory.list) do
        i = i + 1
        love.graphics.draw(assets.textures.item[itemIventory], screen.pct_x(50) - ((assets.textures.inventory:getWidth() / 2)) + (i * 64) - 64, (screen.height - 20) - assets.textures.inventory:getHeight())
        love.graphics.print(tostring(numberIventory), screen.pct_x(50) - ((assets.textures.inventory:getWidth() / 2)) + (i * 64) - 12, (screen.height - 20) - assets.textures.inventory:getHeight())
    end
end

return inventory
