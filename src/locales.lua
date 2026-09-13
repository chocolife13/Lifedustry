locales = {} --public


locales.lang = select(2, pcall(os.setlocale, "", "all"))
locales.lang = locales.lang:match("([a-z]+)") or "en"


function locales.load(languageCode)
    locales.texts = require("src.data.locales." .. languageCode)
end

return locales