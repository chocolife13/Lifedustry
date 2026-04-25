local api = {}

function api.print_centered(text, x, y, rotation, scale_width, scale_height, text_offset_width, text_offset_height)
    local font = love.graphics.getFont()
	local text_width = font:getWidth(text)
	local text_height = font:getHeight()

    rotation = rotation or 0
    scale_width = scale_width or 1
    scale_height = scale_height or scale_width 
    local text_offset_width = text_offset_width or 0
    local text_offset_height = text_offset_height or 0
	love.graphics.print(text, x, y, rotation, scale_width, scale_height, (text_width/2)+ text_offset_width, (text_height/2)+ text_offset_height)
end

return api