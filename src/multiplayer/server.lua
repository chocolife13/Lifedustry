local enet = require "enet"
local host = enet.host_create("0.0.0.0:9111")
print("server starting at 0.0.0.0:9111")
while true do
  local event = host:service(100)
  while event do
    event.peer:send("123") --seed
    if event.type == "connect" then
      print(event.peer, "is connected")
    end
    event = host:service()
  end
end