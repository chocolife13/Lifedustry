---@class Assets
---@field textures AssetTextures
local assets = {}

---@class AssetTextures
---@field block         table<string, love.Image>
---@field ui            table<string, love.Image>
---@field item          table<string, love.Image>
---@field player        love.Image
---@field splash_screen love.Image
assets.audios = {sfx = {},music = {}}
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
    local items = require("src.data.items")
    local blocks = require("src.data.blocks")
    print("assets: loading")
    love.graphics.setDefaultFilter("nearest", "nearest")
    
    blocks.grass.texture, items.grass.texture = love.graphics.newImage("assets/textures/block/grass.png", {mipmaps = true}), love.graphics.newImage("assets/textures/block/grass.png", {mipmaps = true})
    blocks.stone.texture, items.stone.texture = love.graphics.newImage("assets/textures/block/stone.png", {mipmaps = true}), love.graphics.newImage("assets/textures/block/stone.png", {mipmaps = true})
    blocks.sand.texture, items.sand.texture = love.graphics.newImage("assets/textures/block/sand.png", {mipmaps = true}), love.graphics.newImage("assets/textures/block/sand.png", {mipmaps = true})
    blocks.water.texture, items.water.texture = love.graphics.newImage("assets/textures/block/water.png", {mipmaps = true}), love.graphics.newImage("assets/textures/block/water.png", {mipmaps = true})
    blocks.snow.texture, items.snow.texture = love.graphics.newImage("assets/textures/block/snow.png", {mipmaps = true}), love.graphics.newImage("assets/textures/block/snow.png", {mipmaps = true})
    --assets.textures.splash_screen = love.graphics.newImage("assets/textures/splash_screen.png", {mipmaps = true})
    --assets.textures.player = love.graphics.newImage("assets/textures/player.png", {mipmaps = true})
    --assets.textures.bg = love.graphics.newImage("assets/textures/bg.png", {mipmaps = true})
    assets.textures.god = love.graphics.newImage("assets/textures/entity/god.png", {mipmaps = true})
    assets.textures.chicken = love.graphics.newImage("assets/textures/entity/chicken.png", {mipmaps = true})
    assets.textures.fish = love.graphics.newImage("assets/textures/entity/fish.png", {mipmaps = true})
    assets.textures.ball = love.graphics.newImage("assets/textures/entity/ball.png", {mipmaps = true})
    assets.textures.snowman = love.graphics.newImage("assets/textures/entity/snowman.png", {mipmaps = true})
    assets.textures.snowball = love.graphics.newImage("assets/textures/entity/snowball.png", {mipmaps = true})
    assets.textures.inventory = love.graphics.newImage("assets/textures/ui/inventory.png", {mipmaps = true})
    
    items.apple.texture = love.graphics.newImage("assets/textures/item/apple.png", {mipmaps = true})
    items.stone.texture = love.graphics.newImage("assets/textures/block/stone.png", {mipmaps = true})
    items.rock.texture = love.graphics.newImage("assets/textures/entity/god.png", {mipmaps = true})
    items.mushroom.texture = love.graphics.newImage("assets/textures/item/mushroom.png", {mipmaps = true})
    items.turnip.texture = love.graphics.newImage("assets/textures/item/turnip.png", {mipmaps = true})
    items.slingshot.texture = love.graphics.newImage("assets/textures/item/slingshot.png", {mipmaps = true})
    items.pumpkin.texture = love.graphics.newImage("assets/textures/item/pumpkin.png", {mipmaps = true})
    items.snowflake.texture = love.graphics.newImage("assets/textures/item/snowflake.png", {mipmaps = true})
    items.sword.texture = love.graphics.newImage("assets/textures/item/sword.png", {mipmaps = true})
    
    assets.textures.ui.button = love.graphics.newImage("assets/textures/ui/button.png", { mipmaps = true })
    assets.textures.ui.annoying_cat = love.graphics.newImage("assets/textures/ui/annoying_cat.jpg", { mipmaps = true })
    assets.audios.sfx.bell = love.audio.newSource("assets/audios/sfx/bell.wav", "static")
    assets.audios.sfx.swing = love.audio.newSource("assets/audios/sfx/swing.wav", "static")
    assets.audios.sfx.click = love.audio.newSource("assets/audios/sfx/click.ogg", "static")
    assets.audios.music.menu = love.audio.newSource("assets/audios/music/menu.wav", "stream")
    assets.audios.sfx.crunch = love.audio.newSource("assets/audios/sfx/crunch.wav", "static")
    assets.audios.sfx.hit = love.audio.newSource("assets/audios/sfx/hit.wav", "static")


    for i, file in ipairs(love.filesystem.getDirectoryItems("assets/textures/")) do
        if love.filesystem.getInfo("assets/textures/" .. file).type == "file" then
            local name, endname = file:match("(.+)%.(%w+)$")
         	if endname == "png" then
                print("loading" .. "assets/textures/" .. file .. " | " .. i .. "/"  .. (#love.filesystem.getDirectoryItems("assets/textures/") .. " | ".. math.floor((i/#love.filesystem.getDirectoryItems("assets/textures/"))*100) .. "%"))
          		assets.textures[name] = love.graphics.newImage("assets/textures/" .. file, {mipmaps = true})
            end
        end
    end
    print("ended loading all assets")
end

return assets
