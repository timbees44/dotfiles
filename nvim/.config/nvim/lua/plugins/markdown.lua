local Util = require("tokyonight.util")

return {
  "MeanderingProgrammer/render-markdown.nvim",
  enabled = true,
  dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
  event = { "BufReadPre *.md", "BufNewFile *.md" },
  ---@module 'render-markdown'
  ---@type render.md.UserConfig
  opts = {
    render_modes = true,
    file_types = { "markdown", "quarto" },
    anti_conceal = {
      enabled = true,
      -- Which elements to always show, ignoring anti conceal behavior. Values can either be booleans
      -- to fix the behavior or string lists representing modes where anti conceal behavior will be
      -- ignored. Possible keys are:
      --  head_icon, head_background, head_border, code_language, code_background, code_border
      --  dash, bullet, check_icon, check_scope, quote, table_border, callout, link, sign
      ignore = {
        code_background = true,
        sign = true,
      },
      above = 0,
      below = 0,
    },
    bullet = { right_pad = 1 },
    heading = {
      position = "inline",
      width = "block",
    },
    checkbox = {
      right_pad = 5,
    },
    highlights = function(c, opts) -- Add your highlights here
      local ret = {
        RenderMarkdownBullet = { fg = c.orange },
        RenderMarkdownCode = { bg = c.bg_dark },
        RenderMarkdownDash = { fg = c.orange },
        RenderMarkdownTableHead = { fg = c.red },
        RenderMarkdownTableRow = { fg = c.orange },
        RenderMarkdownCodeInline = "@markup.raw.markdown_inline",
      }
      for i, color in ipairs(c.rainbow) do
        ret["RenderMarkdownH" .. i .. "Bg"] = { bg = Util.blend_bg(color, 0.1) }
        ret["RenderMarkdownH" .. i .. "Fg"] = { fg = color, bold = true }
      end
      return ret
    end,
  },
}
