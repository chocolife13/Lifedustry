local assets = require("src.assets")
local items = require("src.data.items")
local screen = require("src.display.screen")
local inventory = require("src.inventory")
local itemType = require("src.data.itemType")
local hotbar = {}



function hotbar.draw()
    love.graphics.draw(assets.textures.inventory, screen.pct_x(50), screen.height - 20, 0, 1, 1,assets.textures.inventory:getWidth() / 2, assets.textures.inventory:getHeight())
    for i, item in ipairs(inventory.list) do
    	if item.name then
        	if i == inventory.selected then
            	love.graphics.draw(items[inventory.list[i].name].texture, screen.mouse.x, screen.mouse.y, 0, 0.5, 0.5)
             	love.graphics.setColor(0.5, 0.5, 0.5)
         	end
          	love.graphics.draw(items[inventory.list[i].name].texture, screen.pct_x(50) - ((assets.textures.inventory:getWidth() / 2)) + (i * 64) - 64, (screen.height - 20) - assets.textures.inventory:getHeight())
           	if i == inventory.selected then
            	love.graphics.setColor(1, 1, 1)
            end
			if inventory.list[i].number > 1 then --drawing the number of item only if not 1 (4 seeing negative item)
            	love.graphics.print(tostring(inventory.list[i].number), screen.pct_x(50) - ((assets.textures.inventory:getWidth() / 2)) + (i * 64) - 12, (screen.height - 20) - assets.textures.inventory:getHeight())
			end
     	end
    end
end


function hotbar.update(dt)
	function love.keypressed(key)-- Item selection with number
		key = tonumber(key)
        if key then
			if key == 0 then
				inventory.selected = 10
			end
			inventory.selected = key
		end
	end
	function love.wheelmoved(x, y) -- Item selection with scroll
        if y > 0 then
        	if inventory.selected < #inventory.list then
         		while inventory.list[inventory.selected + 1] and not inventory.list[inventory.selected + 1].name do
                	inventory.selected = inventory.selected + 1
                end
                inventory.selected = inventory.selected + 1
            else
                inventory.selected = 1
           	end
        end

        if y < 0 then
            if inventory.selected > 1 then
          		while inventory.list[inventory.selected - 1] and not inventory.list[inventory.selected - 1].name do
            		inventory.selected = inventory.selected - 1
             	end
            	inventory.selected = inventory.selected - 1
            else
                inventory.selected = #inventory.list
            end
     	end
	end


    function love.mousepressed(x, y, button, istouch, presses) --item use with click
        if button == 1 then
        	local usedItem = inventory.list[inventory.selected]
        	if usedItem and usedItem.name then
                local type = items[inventory.list[inventory.selected].name].type
				if type then
					if type == "custom" then
						if items[inventory.list[inventory.selected].name].onUse then
                 			items[inventory.list[inventory.selected].name].onUse(screen.mouse.x, screen.mouse.y)
						else
							print("no custom script for custom type in src/data/items for the item " .. usedItem.name)
						end
                	else
						if itemType[type] then
                			itemType[type].onUse(inventory.list[inventory.selected].name)
						else
							print("this type of item doesnt exist look in src/data/itemsTypes -->" .. type)
						end
					end
				else
					print("no type of item def in src/data/items on " .. usedItem.name)
				end
            end
            if items[inventory.list[inventory.selected].name].isConsumable then -- only cosum consumabvle item
				inventory.list[inventory.selected].number = inventory.list[inventory.selected].number - 1
                if inventory.list[inventory.selected].number == 0 then
                	inventory.list[inventory.selected] = {}
                end
         	end
        end
    end

end
return hotbar
