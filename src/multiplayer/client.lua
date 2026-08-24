local client = {}
local enet = require "enet"
local map = require("src.map")

function client.connect(ip)
    client.host = enet.host_create()
    client.server = client.host:connect(ip .. ":9111")
end

function client.update()
    client.event = client.host:service(0)
    if client.event then
        if client.event.type == "receive" then
            --print("Got message: ", client.event.data, client.event.peer)
            local data = client.event.data
            print(data)
            map.seed = tonumber(data)
        end
    end
end

return client