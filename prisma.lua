
 local M = {}

 -- Loads default theme.
 require('default')

 local function set_theme()

    -- Getting the file type
    local ft = vim.bo.filetype
    if ft == '' then return end

    -- Reloading default theme, because
    -- there combines the default theme
    -- with the styles langs themes override.
    package.loaded['default'] = nil
    require('default')

    -- Package name e.g. 'lang.lua'
    local theme = 'lang.' .. ft

    -- Reloading the language theme
    package.loaded[theme] = nil

    -- Imports 'lang.lua' for example
    pcall(require, theme)

 end

 -- Detects automatically when we enters into a file,
 -- switching between tabs or the file type is loaded.
 vim.api.nvim_create_autocmd({'FileType', 'BufEnter'}, { callback = set_theme })

 return M

