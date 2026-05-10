function love.conf(t)
	t.window.title = "Lifedustry" -- the main windows title
  t.window.icon = "/assets/textures/player.png" --window icon
	t.window.width = 640	      
  t.window.height = 480
  t.window.minwidth = 640 --minimum width of the window
  t.window.minheight = 480 --minimum height of the window
  t.console = true -- activate the console
  t.window.resizable = true -- allow the windows to be resizable
  t.window.vsync = 1 -- V-Sync
end

