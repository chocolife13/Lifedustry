local events = require("src.data.events")
event = {}


event.actual = {}

function event.update(dt)
    if event.actual.name then
        if events[event.actual.name].timer < events[event.actual.name].duration then
            events.winter.update(dt)
            events.winter.timer = events.winter.timer + 1
        else
            event.actual = {}
        end
    end
end

function event.draw()
    if event.actual.name then
        if events[event.actual.name].timer < events[event.actual.name].duration then
            events[event.actual.name].draw()
        end
    end
end





return event