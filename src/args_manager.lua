local scene_manager = require("src.scene.scene_manager")
local api = {}

function api.start_scene(args)
    dev = false

    -- loop to see each args
    for i=1, #args do
        
        if args[i] == "--scene" and args[i+1] then -- set the default scene with --scene
            scene_manager.scene = args[i+1]
        end

        if args[i] == "--dev" then dev = true end 

    end

end

return api 