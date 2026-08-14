ui = {}

function ui.draw(dt)

  if love.keyboard.isDown("t") then
    love.graphics.print("FPS: " .. love.timer.getFPS(), 0, 0)
    love.graphics.print("mouse pos: x:" .. map.selectedTileX()..", y:"..map.selectedTileY()..", z:"..map.selectedTileZ(), 0, 10)
    love.graphics.print("player pos: x:" .. map.player_x ..", y:".. map.player_y ..", z:"..player.z, 0, 20)
  end
end