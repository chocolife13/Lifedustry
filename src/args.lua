local SceneManager = require("src.scene_manager")

local args = {}

--- Parses launch arguments and configures the initial scene and global flags.
---@param arg string[]
function args.start(arg)
    for i = 1, #arg do
        if arg[i] == "--scene" and arg[i + 1] then
            SceneManager.current = arg[i + 1]
        end
        if arg[i] == "--dev" then
            _G.DEV = true
        end
    end
end

return args
