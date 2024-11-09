local highlights = {
  override = {
    Comment = {
      italic = true,
    },
    CursorLine = {
      bg = "line",
    },
    -- imports
    Include = {
      italic = true,
    },
    -- for, while loops
    Repeat = {
      italic = true,
    },
    -- if statements
    Conditional = {
      italic = true,
    },
    Keyword = {
      italic = true,
    },
    Function = {
      italic = true,
    },
    Statement = {
      italic = true,
      bold = true,
    },
    Type = {
      italic = true,
    },
    Structure = {
      italic = true,
    },
    ["@constant.builtin"] = {
      italic = true,
    },
    ["@variable.builtin"] = {
      italic = true,
    },
    ["@constructor"] = {
      italic = true,
    },
    ["@function"] = {
      italic = true,
    },
    ["@type.typeParameter"] = {
      italic = true,
    },
    -- builtin types
    ["@type.builtin"] = {
      italic = true,
    },
    -- class, with, as keywords
    ["@keyword"] = {
      italic = true,
    },
    ["@keyword.builtin"] = {
      italic = true,
    },
    -- function keyword
    ["@keyword.function"] = {
      italic = true,
    },
    -- return, yield keywords
    ["@keyword.return"] = {
      bold = true,
      italic = true,
    },
    -- class methods
    ["@method"] = {
      italic = true,
    },
    ["@method.call"] = {
      italic = true,
    },
    -- function names
    ["@function.call"] = {
      italic = true,
    },
    ["@function.builtin"] = {
      italic = true,
    },
    ["@function.macro"] = {
      italic = true,
    },
    -- symbolic
    ["@operator"] = {
      bold = true,
    },
    -- logical keywords
    ["@keyword.operator"] = {
      italic = true,
      bold = true,
    },
    -- function parameters
    ["@parameter"] = {
      italic = false,
    },
  },
}

return highlights
