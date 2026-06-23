local inventory = {}

inventory.list = { rock = 1, stick = 6 }

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

return inventory
