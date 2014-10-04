-- при подгрузке модуля через require выполняется весь код модуля,
-- и переменной присваивается значение, возвращаемое модулем
-- (похоже на node.js)
local config = require("config")

-- Устанвка темы и обоев --
config.set_theme("pro-medium-dark")
config.set_wallpaper("path/to/image")

-- Теги --
config.set_tags({"www", "dev", "etc"})

-- Панели --
config.add_panel(position, size,
                 {"left", "aligned", "widgets"},
                 {"right", "aligned", "widgets"})
