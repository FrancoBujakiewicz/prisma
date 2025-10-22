
 local color = "#EC1622"

 local color0 = "#C21018"
 local color1 = "#FF333E"
 local color2 = "#FF454F"
 local color3 = "#FF7A82"

 hl("@string", { fg = color })
 hl("@number", { fg = color })
 hl("@boolean", { fg = color })
 hl("@function", { fg = color_light, bold = true })
 hl("@function.call", { fg = color_light })
 hl("@keyword", { fg = color0, bold = true })
 hl("@type", { fg = color, bold = true })
 hl("@variable", { fg = color2 })
 hl("@parameter", { fg = color_light, italic = true })

 hl("SpecialComment", { fg = color_light, bold = true })
 hl("Debug", { fg = color_light })

 hl("Underlined", { underline = true })
 hl("Ignore", { fg = color })
 hl("Error", { fg = color_lighter, bg = bg, bold = true })
 hl("Todo", { fg = color_lighter, bg = bg_darker, bold = true })

 hl("Operator", { fg = color_light3 })
 hl("Exception", { fg = color_light })

 hl("Type", { fg = color_lighter, bold = true })
 hl("StorageClass", { fg = color })
 hl("Structure", { fg = color_lighter })
 hl("Typedef", { fg = color_lighter })

 -- Preprocessor
 hl("PreProc", { fg = color_light })
 hl("Include", { fg = color })
 hl("Define", { fg = color })
 hl("Macro", { fg = color })
  
 -- Special characters & markup
 hl("Special", { fg = color2 })
 hl("SpecialChar", { fg = color2 })
 hl("Tag", { fg = color_light })
 hl("Delimiter", { fg = color3 })

 hl("String", { fg = color_dark })
 hl("Character", { fg = color_dark })
 hl("Number", { fg = color_lighter })
 hl("Boolean", { fg = color_lighter })
 hl("Float", { fg = color_lighter })

 hl("Identifier", { fg = color_lighter })
 hl("Function", { fg = color_light, bold = true })
 hl("Keyword", { fg = color_light, bold = true })
 hl("Statement", { fg = color_light })
 hl("Conditional", { fg = color_light })
 hl("Repeat", { fg = color_light })
 hl("Label", { fg = color_light })

