local theme_opts = {
  terminal_colors = true,
  undercurl = true,
  underline = true,
  bold = true,
  italic = {
    strings = false,
    emphasis = true,
    comments = true,
    folds = true,
  },
  strikethrough = true,
  inverse = true,
  transparent = false,
  overrides = function(highlights, colors) end,
}

return theme_opts
