local args = {}
args.target_scene = nil

--- Parses launch arguments and configures the initial scene and global flags.
---@param arg string[]
function args.start(arg)
    for i = 1, #arg do
        if arg[i] == "--scene" and arg[i + 1] then
            args.target_scene = arg[i + 1]
        end
        if arg[i] == "--dev" then
            _G.DEV = true
        end
    end
end

return args
