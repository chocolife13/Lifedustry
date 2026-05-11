-- Entity definitions.

-- i don't know much what this file actually does. doesn't seem to be referenced anywhere.
-- NOTE: assets.textures.entities is not yet wired up in assets.lua.
--       add the texture load there, then uncomment the texture field below.

---@class EntityDef
---@field name    string
---@field speed   number
-- ---@field texture love.Image   (uncomment once the asset is loaded)

---@type table<string, EntityDef>
local entities = {
    sheep = {
        name  = "sheep",
        speed = 10,
        -- texture = assets.textures.entities.mobs.sheep,
    },
}

return entities
