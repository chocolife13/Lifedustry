local api = {}

--this is the list of all scene avaible
api.list = {}

-- these 3 function run the function load update draw of the scene if exist
function api.load()
    api.scene = api.scene or "loading"

    sceneNameTable = love.filesystem.getDirectoryItems("src/scene") --Table containing the raw file name in src/scene
    --Search for every scene in src/scene and loads them
    for _, name in ipairs(sceneNameTable) do
        -- Grabs the files name without the ".lua"
        local cleanName = name:match("(.+)%.lua$")
        
        if cleanName and not (cleanName == "scene_manager") then
            api.list[cleanName] = require("src.scene." .. cleanName)
        end
    end

    local s = api.list[api.scene]
    if s and s.load then
        print("scene manager: loading the " .. api.scene .. " scene" ) 
        s.load()
    else
       error('Error : The "' .. tostring(api.scene) .. '" scene not found in ./src/scene/')
    end
end


function api.draw()
     local s = api.list[api.scene]

    if s and s.draw then
        s.draw()
    else
        error('Error : The "' .. tostring(api.scene) .. '" scene not found in ./src/scene/')
    end
end

function api.update(dt)
     local s = api.list[api.scene]

    if s and s.update then
        s.update(dt)
    else
        error('Error : The "' .. tostring(api.scene) .. '" scene not found in ./src/scene/')
    end
end

return api