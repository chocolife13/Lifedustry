locales = {} --public
local lang = "fr"

function locales.load()
    locales.texts = require("src.data.locales." .. lang)
end

return locales