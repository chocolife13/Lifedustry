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



return inventory
