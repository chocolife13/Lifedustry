assets = require("src.assets")
api = {}
api.grass = {name = "grass", texture = assets.textures.block.grass} -- stocking name in locales for the future
api.stone = {name = "stone", texture = assets.textures.block.stone}
api.sand = {name = "sand", texture = assets.textures.block.sand}
api.water = {name = "water", texture = assets.textures.block.water}
api.snow = {name = "snow", texture = assets.textures.block.snow}
return api