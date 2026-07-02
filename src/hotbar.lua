local assets = require("src.assets")
local screen = require("src.display.screen")
local items = require("src.data.items")
local inventory = require("src.inventory")


local hotbar = {}



function hotbar.draw()
    love.graphics.draw(assets.textures.inventory, screen.pct_x(50), screen.height - 20, 0, 1, 1,assets.textures.inventory:getWidth() / 2, assets.textures.inventory:getHeight())
    for i, item in ipairs(inventory.list) do
    	if item.name then
        	if i == inventory.selected then
            	love.graphics.draw(assets.textures.item[inventory.list[inventory.selected].name], screen.mouse.x, screen.mouse.y, 0, 0.5, 0.5)
             	love.graphics.setColor(0.5, 0.5, 0.5)
         	end
          	love.graphics.draw(assets.textures.item[inventory.list[i].name], screen.pct_x(50) - ((assets.textures.inventory:getWidth() / 2)) + (i * 64) - 64, (screen.height - 20) - assets.textures.inventory:getHeight())
           	if i == inventory.selected then
            	love.graphics.setColor(1, 1, 1)
            end

            love.graphics.print(tostring(inventory.list[i].number), screen.pct_x(50) - ((assets.textures.inventory:getWidth() / 2)) + (i * 64) - 12, (screen.height - 20) - assets.textures.inventory:getHeight())
     	end
    end
end


function hotbar.update(dt)
	function love.wheelmoved(x, y)
        if y > 0 then
        	if inventory.selected < #inventory.list then
                while not inventory.list[inventory.selected + 1].name do
                	inventory.selected = inventory.selected + 1
                end
                inventory.selected = inventory.selected + 1
            else
                inventory.selected = 1
           	end
        end

        if y < 0 then
            if inventory.selected > 1 then
           		while not inventory.list[inventory.selected - 1].name do
            		inventory.selected = inventory.selected - 1
             	end
            	inventory.selected = inventory.selected - 1
            else
                inventory.selected = #inventory.list
            end
     	end
	end

    function love.mousepressed(x, y, button, istouch, presses)
        if button == 1 then
        	local usedItem = inventory.list[inventory.selected]
        	if usedItem and usedItem.name then
                	if items[inventory.list[inventory.selected].name].onUse then
                 		items[inventory.list[inventory.selected].name].onUse(screen.mouse.x, screen.mouse.y)
                   	else
                   		print("No action are defined in src/data/items for the item: " .. inventory.list[inventory.selected].name)
                   	end
                    inventory.list[inventory.selected].number = inventory.list[inventory.selected].number - 1
                    if inventory.list[inventory.selected].number == 0 then
                    	inventory.list[inventory.selected] = {}
                    end
         	end
        end
    end

end

return hotbar
