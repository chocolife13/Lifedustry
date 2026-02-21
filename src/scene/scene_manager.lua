scene_manager = {}

scene_manager.list = {
    loading = require("src.scene.loading")
}


function scene_manager.load()
     local s = scene_manager.list[scene_manager.scene]

    if s and s.load then
        print("Scene_manager: loading the " .. scene_manager.scene .. " scene" ) 
        s.load()
    else
        print('Error : This scene dosnt exist or not in << the scene_manager.list >> in ./src/scene/scenemanager :" ' .. tostring(scene_manager.scene) .. " n'existe pas !")
    end
end


function scene_manager.draw()
     local s = scene_manager.list[scene_manager.scene]

    if s and s.draw then
        s.draw()
    else
        print('Error : This scene dosnt exist or not in << the scene_manager.list >> in ./src/scene/scenemanager :" ' .. tostring(scene_manager.scene) .. " n'existe pas !")
    end
end

function scene_manager.update()
     local s = scene_manager.list[scene_manager.scene]

    if s and s.update then
        s.update()
    else
        print('Error : This scene dosnt exist or not in << the scene_manager.list >> in ./src/scene/scenemanager :" ' .. tostring(scene_manager.scene) .. " n'existe pas !")
    end
end

