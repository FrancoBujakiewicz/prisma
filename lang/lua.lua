
 local color = "#383894"

 local color_light0 = "#0000FF"
 local color_light1 = "#4040FF"
 local color_light2 = "#7373FF"
 local color_light3 = "#A3A3FF"

 hl("@string", { fg = color_light0 })
 hl("@number", { fg = color_light0 })
 hl("@boolean", { fg = color_light0 })
 hl("@function", { fg = color })
 hl("@function.call", { fg = color_light })
 hl("@keyword", { fg = color_light2, bold = true })
 hl("@type", { fg = color, bold = true })
 hl("@variable", { fg = color_light1 })
 hl("@parameter", { fg = color_light, italic = true })

 hl("SpecialComment", { fg = color_light, bold = true })
 hl("Debug", { fg = color_light })

 hl("Underlined", { underline = true })
 hl("Ignore", { fg = color })
 hl("Error", { fg = color_light, bold = true })
 hl("Todo", { fg = color_light, bold = true })

 hl("Operator", { fg = color_light3 })
 hl("Exception", { fg = color_light })

 hl("Type", { fg = color_light, bold = true })
 hl("StorageClass", { fg = color })
 hl("Structure", { fg = color_light })
 hl("Typedef", { fg = color_light })

 -- Preprocessor
 hl("PreProc", { fg = color_light })
 hl("Include", { fg = color })
 hl("Define", { fg = color })
 hl("Macro", { fg = color })
 
 -- Special characters & markup
 hl("Special", { fg = color_light3 })
 hl("SpecialChar", { fg = color_light3 })
 hl("Tag", { fg = color_light })
 hl("Delimiter", { fg = color_light3 })

 hl("String", { fg = color })
 hl("Character", { fg = color })
 hl("Number", { fg = color_light })
 hl("Boolean", { fg = color_light })
 hl("Float", { fg = color_light })

 hl("Identifier", { fg = color_light })
 hl("Function", { fg = color_light, bold = true })
 hl("Keyword", { fg = color_light, bold = true })
 hl("Statement", { fg = color_light })
 hl("Conditional", { fg = color_light })
 hl("Repeat", { fg = color_light })
 hl("Label", { fg = color_light })

