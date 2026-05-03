local scene_manager = require("src.scene.scene_manager")
local api = {}

function api.start_scene(args)
    -- valeur par default
    local scene = "loading"
    dev = false

    -- loop to see each args
    for i=1, #args do
        
        if args[i] == "--scene" and args[i+1] then -- si args scene et un args apres
            scene = args[i+1]
        end

        if args[i] == "--dev" then dev = true end -- met le mode dev si ya l'arg "--dev" (une seule ligne omg)

    end

    scene_manager.scene = scene --application de la scene
end

return api 