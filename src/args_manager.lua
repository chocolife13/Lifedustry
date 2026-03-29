local scene_manager = require("src.scene.scene_manager")
local api = {}

function api.start_scene(args)
    if args[1] == "--scene" then
        scene_manager.scene = args[2]
    else
        scene_manager.scene = "loading"
    end
end

return api 