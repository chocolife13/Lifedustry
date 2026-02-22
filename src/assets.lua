local api = {}
api.textures = {}

function api.preload()
    print("loading assets")
    love.graphics.setDefaultFilter("nearest", "nearest")
    
    api.textures.splash_screen = love.graphics.newImage("assets/textures/splash_screen.png")
end


return api