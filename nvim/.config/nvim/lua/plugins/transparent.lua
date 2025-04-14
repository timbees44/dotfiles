return {
  "xiyaowong/transparent.nvim",
  lazy = false, -- load on startup
  config = function()
    require("transparent").setup({
      groups = { -- table: default groups
        "Normal",
        "NormalNC",
        "Comment",
        "Constant",
        "Special",
        "Identifier",
        "Statement",
        "PreProc",
        "Type",
        "Underlined",
        "Todo",
        "String",
        "Function",
        "Conditional",
        "Repeat",
        "Operator",
        "Structure",
        "LineNr",
        "NonText",
        "SignColumn",
        "CursorLineNr",
        "EndOfBuffer",
      },
      extra_groups = {}, -- you can add more highlight groups here
      exclude_groups = {}, -- leave blank or set groups you want to keep opaque
    })

    -- Enable transparency on startup
    vim.cmd("TransparentEnable")
  end,
}
