local assets = require("src.assets")
local screen = require("src.display.screen")
local items = require("src.data.items")

local inventory = {}


inventory.list = {
    [1] = {name = "apple", number = -1},
    [2] = {name = "snowflake", number = -1},
    [3] = {name = "sword", number = 1},
    [4] = {name = "water", number = -1},
    [5] = {name = "stone", number = -1},
    [6] = {name = "grass", number = -1},
    [7] = {name = "sand", number = -1},
    [8] = {name = "snow", number = -1}
}

inventory.selected = 1

function inventory.add(itemToAdd, numberToAdd)
	inventory.FirstEmpty = nil
    for i, item in ipairs(inventory.list) do
    	if not item.name and not inventory.FirstEmpty then
     		inventory.FirstEmpty = i
       end
        if itemToAdd == item.name then
            inventory.list[i].number = inventory.list[i].number + numberToAdd
            return
        end
    end

    inventory.list[inventory.FirstEmpty or #inventory.list + 1] = {name = itemToAdd, number = numberToAdd}
end


function inventory.clear()
    inventory.list = {}
end



return inventory
