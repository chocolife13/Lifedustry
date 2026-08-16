local time = {}
time.timer = 10000
local direction = 1
function time.update(dt)
    time.timer = time.timer + (50 * dt * direction)

    if time.timer >= 10000 then
        time.timer = 10000
        direction = -1
    elseif time.timer <= 0 then
        time.timer = 0
        direction = 1
    end
end

return time