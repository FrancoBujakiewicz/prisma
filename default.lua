
 local white = "#FFFFFF"
 local gray = "#949494"

 -- Abbreviating it in a global function
 _G.hl = function(group, opts) vim.api.nvim_set_hl(0, group, opts) end

 hl("Normal", { fg = white })
 hl("NormalFloat", { fg = white })
 hl("FloatBorder", { fg = white })

 hl("LineNr", { fg = white })
 hl("CursorLineNr", { fg = white })
 hl("CursorLine", {})
 hl("CursorColumn", {})

 hl("SignColumn", {})
 hl("FoldColumn", { fg = white })

 hl("Visual", { fg = white })
 hl("VisualNOS", { fg = white })

 hl("StatusLine", { fg = white })

 -- Command line
 hl("ModeMsg", { fg = white })
 hl("MoreMsg", { fg = white })
 hl("WarningMsg", { fg = white })
 hl("ErrorMsg", { fg = white })

 -- Search & Replace
 hl("Search", { fg = white, bg = white })
 hl("IncSearch", { fg = white, bg = white, bold = true })
 hl("Substitute", { fg = white, bg = white })

 -- Syntax Highlighting
 hl("Comment", { fg = gray })
 hl("String", { fg = white })
 hl("Character", { fg = white })
 hl("Number", { fg = white })
 hl("Boolean", { fg = white })
 hl("Float", { fg = white })

 hl("Identifier", { fg = white })
 hl("Function", { fg = white, bold = true })
 hl("Keyword", { fg = white, bold = true })
 hl("Statement", { fg = white })
 hl("Conditional", { fg = white })
 hl("Repeat", { fg = white })
 hl("Label", { fg = white })
 hl("Operator", { fg = white })
 hl("Exception", { fg = white })

 hl("Type", { fg = white, bold = true })
 hl("StorageClass", { fg = white })
 hl("Structure", { fg = white })
 hl("Typedef", { fg = white })

 -- Preprocessor
 hl("PreProc", { fg = white })
 hl("Include", { fg = white })
 hl("Define", { fg = white })
 hl("Macro", { fg = white })

 -- Special characters & markup
 hl("Special", { fg = white })
 hl("SpecialChar", { fg = white })
 hl("Tag", { fg = white })
 hl("Delimiter", { fg = white })
 hl("SpecialComment", { fg = white, bold = true })
 hl("Debug", { fg = white })

 -- Underline
 hl("Underlined", { underline = true })
 hl("Ignore", { fg = white })
 hl("Error", { fg = white, bold = true })
 hl("Todo", { fg = white, bg = white, bold = true })

 -- Diagnostics
 hl("DiagnosticError", { fg = white })
 hl("DiagnosticWarn", { fg = white })
 hl("DiagnosticInfo", { fg = white })
 hl("DiagnosticHint", { fg = white })

 hl("DiagnosticVirtualTextError", { fg = white, italic = true })
 hl("DiagnosticVirtualTextWarn", { fg = white, italic = true })
 hl("DiagnosticVirtualTextInfo", { fg = white, italic = true })
 hl("DiagnosticVirtualTextHint", { fg = white, italic = true })

 hl("DiagnosticUnderlineError", { underline = true, sp = white })
 hl("DiagnosticUnderlineWarn", { underline = true, sp = white })
 hl("DiagnosticUnderlineInfo", { underline = true, sp = white })
 hl("DiagnosticUnderlineHint", { underline = true, sp = white })

 -- Diff
 hl("DiffAdd", { fg = white })
 hl("DiffChange", { fg = white })
 hl("DiffDelete", { fg = white })
 hl("DiffText", { fg = white, bold = true })

 -- Git signs
 hl("GitSignsAdd", { fg = white })
 hl("GitSignsChange", { fg = white })
 hl("GitSignsDelete", { fg = white })

 -- Completion menu (blink.cmp)
 hl("Pmenu", { fg = white, bg = white })
 hl("PmenuSel", { fg = white, bg = white, bold = true })
 hl("PmenuSbar", { bg = white })
 hl("PmenuThumb", { bg = white })

 -- Folding
 hl("Folded", { fg = white, bg = white })
 hl("FoldColumn", { fg = white })

 -- Spelling
 hl("SpellBad", { underline = true, sp = white })
 hl("SpellCap", { underline = true, sp = white })
 hl("SpellLocal", { underline = true, sp = white })
 hl("SpellRare", { underline = true, sp = white })

 -- Tabs & Buffers
 hl("TabLine", { fg = white })
 hl("TabLineSel", { fg = white, bold = true })
 hl("TabLineFill", {})

 -- Telescope (fuzzy finder)
 hl("TelescopeNormal", { fg = white })
 hl("TelescopeSelection", { fg = white, bg = white, bold = true })
 hl("TelescopeMatching", { fg = white, bold = true })
 hl("TelescopePromptPrefix", { fg = white })
 hl("TelescopeSelection", { fg = white })

 -- Treesitter highlights
 hl("@comment", { fg = gray })
 hl("@string", { fg = white })
 hl("@number", { fg = white })
 hl("@boolean", { fg = white })
 hl("@function", { fg = white, bold = true })
 hl("@function.call", { fg = white })
 hl("@keyword", { fg = white, bold = true })
 hl("@type", { fg = white, bold = true })
 hl("@variable", { fg = white })
 hl("@parameter", { fg = white, italic = true })

 hl("MiniStatuslineFilename", { fg = white })
 hl("MiniStatuslineFileinfo", { fg = white })
 hl("MiniStatuslineModeNormal", { fg = white })
 hl("MiniStatuslineModeInsert", { fg = white })
 hl("MiniStatuslineModeVisual", { fg = white })
 hl("MiniStatuslineModeReplace", { fg = white })
 hl("MiniStatuslineModeCommand", { fg = white })
 hl("MiniStatuslineModeOther", { fg = white })

 -- Todo-comments highlights
 hl("TodoFgTODO", { fg = white, bold = true })
 hl("TodoFgNOTE", { fg = white, bold = true })
 hl("TodoFgHACK", { fg = white, bold = true })
 hl("TodoFgFIXME", { fg = white, bold = true })

