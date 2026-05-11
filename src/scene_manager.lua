local SceneManager = {}

---@type table<string, table>
SceneManager.list = {}

--- Name of the active scene. Will defaults to "loading".
SceneManager.current = "loading"

--- Sub-folders inside src/scenes/ that are scanned for reading scene files.
local SCENE_DIRS = { "pre", "menu", "game", "" } -- "" = scenes root (e.g. test.lua)

local function get_scene(name)
    local s = SceneManager.list[name]
    if not s then
        error(('SceneManager: scene "%s" not found'):format(tostring(name)))
    end
    return s
end

--- Discovers all scenes across src/scenes/ sub-folders, requiring each one,
--- then calls load() on the currently active scene.
function SceneManager.load()
    SceneManager.current = SceneManager.current or "loading"

    for _, subdir in ipairs(SCENE_DIRS) do
        local path = subdir == "" and "src/scenes" or ("src/scenes/" .. subdir)
        local req_prefix = subdir == "" and "src.scenes." or ("src.scenes." .. subdir .. ".")

        for _, filename in ipairs(love.filesystem.getDirectoryItems(path)) do
            local name = filename:match("(.+)%.lua$")
            if name then
                SceneManager.list[name] = require(req_prefix .. name)
            end
        end
    end

    local s = get_scene(SceneManager.current)
    print(("SceneManager: loading scene '%s'"):format(SceneManager.current))
    if s.load then s.load() end
end

function SceneManager.draw()
    local s = get_scene(SceneManager.current)
    if s.draw then s.draw() end
end

function SceneManager.update(dt)
    local s = get_scene(SceneManager.current)
    if s.update then s.update(dt) end
end

--- Switches to a new scene and immediately calls its load().
---@param name string
function SceneManager.switch(name)
    SceneManager.current = name
    SceneManager.load()
end

return SceneManager
