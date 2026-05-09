local api = {}

--- Function used to display correctly a Boolean
--- @param Bool or Int (1 or 0)
--- @return "On" or "Off"
function api.boolToString(t) 
    if t==true or t==1 then return "On" end
    if t==false or t==0 then return "Off" end
end

return api