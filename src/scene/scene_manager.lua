require("src.screen")
require("src.scene.splash_screen")

scene_manager = {}


function scene_manager.load()
    if scene_manager.scene == "splash_screen" then
        splash_screen.load()
    end
end


