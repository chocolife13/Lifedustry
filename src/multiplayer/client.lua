local client = {}
local enet = require "enet"
local map = require("src.map")
local player = require("src.player")

local function deserialize(str)
    local tbl = {}
    for k, v in str:gmatch("([^;=]+)=([^;=]+)") do
        tbl[k] = tonumber(v) or v
    end
    return tbl
end

local function serialize(tbl)
    local result = {}
    for k, v in pairs(tbl) do
        table.insert(result, k .. "=" .. tostring(v))
    end
    return table.concat(result, ";")
end



function client.connect(ip)
    client.host = enet.host_create()
    client.server = client.host:connect(ip .. ":9111")
end

function client.update()
    client.event = client.host:service(0)
    client.server:send(serialize({ x = player.x, y = player.y }))
    if client.event then
        if client.event.type == "receive" then
            local data = deserialize(client.event.data)
            print(data.seed)
            map.seed = tonumber(data.seed)
        end
    end
end

return client