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
    if love.keyboard.isScancodeDown(keys.inventory.swapto["1"]) then
        inventory.selected = 1
    end

    if love.keyboard.isScancodeDown(keys.inventory.swapto["2"]) then
        inventory.selected = 2
    end

    if love.keyboard.isScancodeDown(keys.inventory.swapto["3"]) then
        inventory.selected = 3
    end

    function love.mousepressed(x, y, button, istouch, presses)
        -- button 1 correspond au clic gauche
        if button == 1 then
        	if inventory.list[inventory.selected] and inventory.list[inventory.selected].number > 0 then
                print(inventory.list[inventory.selected].name .. " is comsumed")
                if inventory.list[inventory.selected].number == 1 then
                	inventory.list[inventory.selected] = {}
                else
                	inventory.list[inventory.selected].number = inventory.list[inventory.selected].number - 1
         		end
         	end
        end
    end

end

return hotbar
