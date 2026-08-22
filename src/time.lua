local time = {}
time.timer = 10000
time.direction = 1
time.speed = 50

function time.update(dt)
    time.timer = time.timer + (time.speed * dt * time.direction)

    if time.timer >= 10000 then
        time.timer = 10000
        time.direction = -1
    elseif time.timer <= 0 then
        time.timer = 0
        time.direction = 1
    end
end

return time