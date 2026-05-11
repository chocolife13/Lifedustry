local M = {}

--- Cosine interpolation between `a` and `b` by factor `t`.
---@param a number
---@param b number
---@param t number
---@return number
function M.cerp(a, b, t)
    local f = (1 - math.cos(t * math.pi))
    return a * (1 - f) + b * f
end

--- Linear interpolation between `a` and `b` by factor `t`.
---@param a number
---@param b number
---@param t number
---@return number
function M.lerp(a, b, t)
    return a + (b - a) * t
end

return M
