local api = {}
api.textures = {}
api.textures.block = {}
api.textures.ui = {}



function api.preload() --loding the loading screen assets
    print("preloading assets")
    love.graphics.setDefaultFilter("nearest", "nearest")
    api.textures.ui.logo = love.graphics.newImage("assets/textures/ui/logo.png")
    
end

function api.load() --loading the assets until loading sceen
    print("loading assets")
    love.graphics.setDefaultFilter("nearest", "nearest")
    api.textures.block.grass = love.graphics.newImage("assets/textures/block/grass.png")
    api.textures.block.stone = love.graphics.newImage("assets/textures/block/stone.png")
    api.textures.block.sand = love.graphics.newImage("assets/textures/block/sand.png")
    api.textures.block.water = love.graphics.newImage("assets/textures/block/water.png")
    api.textures.block.snow = love.graphics.newImage("assets/textures/block/snow.png")
    api.textures.splash_screen = love.graphics.newImage("assets/textures/splash_screen.png")
    api.textures.player = love.graphics.newImage("assets/textures/player.png")
    
    
end
api.load()
return api