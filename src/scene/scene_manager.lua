local api = {}

api.list = {
    test = require("src.scene.test"),
    loading = require("src.scene.loading"),
    main_menu = require("src.scene.main_menu")
}


function api.load()
     local s = api.list[api.scene]

    if s and s.load then
        print("scene manager: loading the " .. api.scene .. " scene" ) 
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

function api.update(dt)
     local s = api.list[api.scene]

    if s and s.update then
        s.update(dt)
    else
        print('Error : This scene dosnt exist or not in << the api.list >> in ./src/scene/scenemanager :" ' .. tostring(api.scene) .. " n'existe pas !")
    end
end

return api