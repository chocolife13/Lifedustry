local api = {}

function api.cerp(a, b, t)
    local f=(1-math.cos(t*math.pi)) 
    return a*(1-f)+b*f 
end

function api.lerp(a, b, t)
    return a +(b - a) * t
end

return api



