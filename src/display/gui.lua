local ui = require("src.display.ui")
local screen = require("src.display.screen")
local assets = require("src.assets")
local M = require("src.core.math")

local gui = {}
gui.list = {}

function gui.add(args)
	local stat = {}

	for k, v in pairs(args) do
        stat[k] = v
    end
	
	table.insert(gui.list, stat)

    
end

function gui.reset()
	gui.list = {}
end

function gui.edit(id, value, key)
	for i, v in ipairs(gui.list) do
		if v.id then
			if v.id == id then
				v[value] = key
			end
		end
	end
end

function gui.delete(id)
	for i, v in ipairs(gui.list) do
		if v.id then
			if v.id == id then
				v = {}
			end
		end
	end
end

function gui.update(dt)
	if gui.list then
		for i, v in ipairs(gui.list) do
			if v.type == "button" then
				
				local x = screen.pct_x(v.x) - (v.width / 2)
				local y = screen.pct_y(v.y) - (v.height / 2)
				if screen.mouse.x > x and screen.mouse.x < x + v.width and screen.mouse.y > y and screen.mouse.y < y + v.height then
					v.height = M.lerp(v.height, (v.h * v.hover), 0.1)
					v.width = M.lerp(v.width, (v.w * v.hover), 0.1)
					function love.mousereleased(_, _, button)
    					if button ~= 0 then
        					v.callback()
    					end
					end
				else
					v.height = M.lerp(v.height, v.h, 0.1)
					v.width = M.lerp(v.width, v.w, 0.1)
				end
			end	
		end
	end
end

function gui.draw()
	if gui.list then
		for i, v in ipairs(gui.list) do
			if v.type == "button" then

				local x = screen.pct_x(v.x) - (v.width / 2)
				local y = screen.pct_y(v.y) - (v.height / 2)

				if _G.DEV then love.graphics.rectangle("line", x, y, v.width, v.height) end
				love.graphics.draw(assets.textures.ui.button, x, y, 0, v.width / assets.textures.ui.button:getWidth(), v.height / assets.textures.ui.button:getHeight())
				ui.print_centered(v.text, x + (v.width / 2), y + (v.height / 2), 0, v.width / v.w, v.height / v.h)
			end
		end
	end
end


return gui





--[[


function gui.mousereleased(x, y, button)
    if button ~= 1 then
        return
    end
	for _, btn in ipairs(buttons) do
        if x > btn.x and x < btn.x + btn.width and y > btn.y and y < btn.y + btn.height then
			if _G.DEV then love.graphics.rectangle("line", bx, by, width, height) end
	love.graphics.draw(assets.textures.ui.button, bx, by, 0, width / assets.textures.ui.button:getWidth(), height / assets.textures.ui.button:getHeight())
	ui.print_centered(text, bx + width / 2, by + height / 2)
        	assets.audios.sfx.click:play()
			btn.callback()
			return
		end
	end
end

function love.mousereleased(x, y, button)
	gui.mousereleased(x, y, button)
end


]]