local funfact = {}

function funfact.random()
    return love.math.random(1, #locales.texts.funfact)
end

return funfact
