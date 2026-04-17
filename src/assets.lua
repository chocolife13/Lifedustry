local api = {}
api.textures = {}
api.textures.block = {}
api.textures.ui = {}
function api.preload()
    print("preloading assets")
    love.graphics.setDefaultFilter("nearest", "nearest")
    
    api.textures.splash_screen = love.graphics.newImage("assets/textures/splash_screen.png")
end

function api.load()
    print("loading assets")
    love.graphics.setDefaultFilter("nearest", "nearest")
    api.textures.block.grass = love.graphics.newImage("assets/textures/block/grass.png")
    api.textures.ui.logo = love.graphics.newImage("assets/textures/ui/logo.png")
    api.textures.player = love.graphics.newImage("assets/textures/player.png")
    
    
end
api.load()
return api