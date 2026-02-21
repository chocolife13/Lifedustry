-- this scipt load all assets

print("loading assets")
assets = {}
assets.textures = {}

function assets.perload()

end

love.graphics.setDefaultFilter("nearest", "nearest")
assets.textures.splash_screen = love.graphics.newImage("/assets/textures/splash_screen.png")