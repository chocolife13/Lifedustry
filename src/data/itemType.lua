local items = require("src.data.items")
local itemType = {
    stat = {
        onUse = function(item)
            local player = require("src.player")
            local inventory = require("src.inventory")
            local assets = require("src.assets")

            stat = items[inventory.list[inventory.selected].name].stat
            amount = items[inventory.list[inventory.selected].name].amount
            assets.audios.sfx.bell:stop()
        	assets.audios.sfx.bell:play()
            
            player[stat] = player[stat] + amount
        end
    },
    block = {
        onUse = function(item)
            local map = require("src.map")
            local blocks = require("src.data.blocks")
            local camera = require("src.camera")
            local screen = require("src.display.screen")
            

            local world_x = (screen.mouse.x - screen.width / 2) / camera.zoom + camera.x
            local world_y = (screen.mouse.y - screen.height / 2) / camera.zoom + camera.y
            local x_place = math.floor(world_x / 64)
            local y_place = math.floor(world_y / 64)
            print( x_place .. "," .. y_place )
            map.world[ x_place .. "," .. y_place ] = blocks[item].texture
        end
    }
}



return itemType