---@class Assets
---@field textures AssetTextures
local assets = {}

---@class AssetTextures
---@field block         table<string, love.Image>
---@field ui            table<string, love.Image>
---@field item          table<string, love.Image>
---@field player        love.Image
---@field splash_screen love.Image
assets.textures = {block = {}, ui = {}, item = {}}

--- Loads the minimal assets needed for the loading screen.
--- Called once before the loading scene runs.
function assets.preload()
    print("assets: preloading")
    love.graphics.setDefaultFilter("nearest", "nearest")
    assets.textures.ui.logo = love.graphics.newImage("assets/textures/ui/logo.png")
end

--- Loads all remaining game assets.
--- Called from the loading scene before switching to the main menu.
function assets.load()
    print("assets: loading")
    love.graphics.setDefaultFilter("nearest", "nearest")
    assets.textures.block.grass = love.graphics.newImage("assets/textures/block/grass.png")
    assets.textures.block.stone = love.graphics.newImage("assets/textures/block/stone.png")
    assets.textures.block.sand = love.graphics.newImage("assets/textures/block/sand.png")
    assets.textures.block.water = love.graphics.newImage("assets/textures/block/water.png")
    assets.textures.block.snow = love.graphics.newImage("assets/textures/block/snow.png")
    --assets.textures.splash_screen = love.graphics.newImage("assets/textures/splash_screen.png")
    --assets.textures.player = love.graphics.newImage("assets/textures/player.png")
    --assets.textures.bg = love.graphics.newImage("assets/textures/bg.png")
    assets.textures.god = love.graphics.newImage("assets/textures/entity/god.png")
    assets.textures.chicken = love.graphics.newImage("assets/textures/entity/chicken.png")
    assets.textures.fish = love.graphics.newImage("assets/textures/entity/fish.png")
    assets.textures.ball = love.graphics.newImage("assets/textures/entity/ball.png")
    assets.textures.snowman = love.graphics.newImage("assets/textures/entity/snowman.png")
    assets.textures.snowball = love.graphics.newImage("assets/textures/entity/snowball.png")
    assets.textures.inventory = love.graphics.newImage("assets/textures/ui/inventory.png")
    assets.textures.item.apple = love.graphics.newImage("assets/textures/item/apple.png")
    assets.textures.item.rock = love.graphics.newImage("assets/textures/entity/god.png")
    assets.textures.item.mushroom = love.graphics.newImage("assets/textures/item/mushroom.png")
    assets.textures.item.turnip = love.graphics.newImage("assets/textures/item/turnip.png")
    assets.textures.item.slingshot = love.graphics.newImage("assets/textures/item/slingshot.png")
    assets.textures.ui.button = love.graphics.newImage("assets/textures/ui/button.png")



    for i, file in ipairs(love.filesystem.getDirectoryItems("assets/textures/")) do
        if love.filesystem.getInfo("assets/textures/" .. file).type == "file" then
            local name, endname = file:match("(.+)%.(%w+)$")
         	if endname == "png" then
                print("loading" .. "assets/textures/" .. file .. " | " .. i .. "/"  .. (#love.filesystem.getDirectoryItems("assets/textures/") .. " | ".. math.floor((i/#love.filesystem.getDirectoryItems("assets/textures/"))*100) .. "%"))
          		assets.textures[name] = love.graphics.newImage("assets/textures/" .. file)
            end
        end
    end
    print("ended loading all assets")
end

return assets
