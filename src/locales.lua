locales = {} --public
local lang = "en"

function locales.load()
    locales.texts = require("src.data.locales." .. lang)
end

return locales