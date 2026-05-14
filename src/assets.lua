---@class Assets
---@field textures AssetTextures
local assets = {}

---@class AssetTextures
---@field block  table<string, love.Image>
---@field ui     table<string, love.Image>
---@field player love.Image
---@field splash_screen love.Image
assets.textures = {
	block = {},
	ui = {},
}

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
	assets.textures.splash_screen = love.graphics.newImage("assets/textures/splash_screen.png")
	assets.textures.player = love.graphics.newImage("assets/textures/player.png")
	assets.textures.god = love.graphics.newImage("assets/textures/god.png")
end

return assets
