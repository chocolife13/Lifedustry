local api = {}

api.list = {
    loading = require("src.scene.loading")
}


function api.load()
     local s = api.list[api.scene]

    if s and s.load then
        print("api: loading the " .. api.scene .. " scene" ) 
        s.load()
    else
        print('Error : This scene dosnt exist or not in << the api.list >> in ./src/scene/scenemanager :" ' .. tostring(api.scene) .. " n'existe pas !")
    end
end


function api.draw()
     local s = api.list[api.scene]

    if s and s.draw then
        s.draw()
    else
        print('Error : This scene dosnt exist or not in << the api.list >> in ./src/scene/scenemanager :" ' .. tostring(api.scene) .. " n'existe pas !")
    end
end

function api.update()
     local s = api.list[api.scene]

    if s and s.update then
        s.update()
    else
        print('Error : This scene dosnt exist or not in << the api.list >> in ./src/scene/scenemanager :" ' .. tostring(api.scene) .. " n'existe pas !")
    end
end

return api