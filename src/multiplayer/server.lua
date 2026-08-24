local enet = require "enet"
local host = enet.host_create("0.0.0.0:9111")
print("server starting at 0.0.0.0:9111")
print("seed = 123")
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
    event.peer:send(serialize({seed = 123})) --seed
    if event.type == "connect" then
      print(event.peer, "is connected")
    end
    event = host:service()
  end
end