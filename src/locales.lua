locales = {} --public


local lang = select(2, pcall(os.setlocale, "", "all"))
lang = lang:match("([a-z]+)") or "en"


print(languageCode)
function locales.load()
    locales.texts = require("src.data.locales." .. lang)
end

return locales