local api = {}
api.textures = {}

function api.preload()
    print("preloading assets")
    love.graphics.setDefaultFilter("nearest", "nearest")
    
    api.textures.splash_screen = love.graphics.newImage("assets/textures/splash_screen.png")
end

function api.load()
    print("loading assets")
    love.graphics.setDefaultFilter("nearest", "nearest")
    
    
end

return api