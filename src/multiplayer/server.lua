local enet = require "enet"
local host = enet.host_create("0.0.0.0:9111")
print("server starting at 0.0.0.0:9111")
print("seed = 123")

server = {}
server.player = {}

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


while true do
  local event = host:service(100)
  while event do
    local seed = 123
    event.peer:send(serialize({seed = 123}))
     if event then
        if event.type == "receive" then
            local data = deserialize(event.data)
            server.player[event.peer] = {x = data.x, y = data.y}
            for player, _ in pairs(server.player) do
                for _, _ in pairs(server.player[player]) do
                    print("player = " .. tostring(player), i, v)
                end
            end
        end
    end 
    if event.type == "connect" then
        --print("players: ")
        table.insert(server.player, event.peer)
        for i, v in pairs(server.player) do
            print("players" .. i)
        end
    end
    event = host:service()
  end
end