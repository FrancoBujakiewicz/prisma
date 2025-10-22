
 local M = {}

 require('default')

 local function set_theme()

    local ft = vim.bo.filetype
    if ft == '' then return end

    package.loaded['default'] = nil
    require('default')

    local theme = 'lang.' .. ft

    package.loaded[theme] = nil

    local ok, err = pcall(require, theme)

 end

 vim.api.nvim_create_autocmd('FileType', { callback = set_theme })
 vim.api.nvim_create_autocmd('BufEnter', { callback = set_theme })

 return M

