# scenes

scenes is managed by the scene manager (PS: its fucking logic)

```lua
local api = {}

-- plzzzz set 
function api.load()
 --first code to run when the scene is loaded
end

function api.draw()
 --code for drawing the scene
end

function api.update(dt) --dt is deltatime the time since the last frame
 --code for updating the scene
end

return api
```

look at this example of scene
