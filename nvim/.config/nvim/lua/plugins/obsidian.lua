return {
  "epwalsh/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = "markdown",
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  -- event = {
  --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
  --   "BufReadPre path/to/my-vault/**.md",
  --   "BufNewFile path/to/my-vault/**.md",
  -- },
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",

    -- see below for full list of optional dependencies 👇
  },
  opts = {
    workspaces = {
      {
        name = "personal",
        path = "~/Documents/second_brain",
      },
    },
    -- Daily note config
    daily_notes = {
      -- Optional, if you keep daily notes in a separate directory.
      folder = "daily",
      -- Optional, if you want to change the date format for the ID of daily notes.
      date_format = "/%Y/%m-%B/%Y-%m-%d-%A",
      -- Optional, if you want to change the date format of the default alias of daily notes.
      alias_format = "%B %-d, %Y",
      -- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
      template = "Daily.md",
    },

    -- Optional, for templates (see below).
    templates = {
      subdir = "templates",
      date_format = "%Y-%m-%d",
      time_format = "%H:%M",
      -- A map for custom variables, the key should be the variable and the value a function
      substitutions = {},
    },

    config = function()
      local function create_obsidian_note_with_date()
        local date = os.date("%Y-%m-%d")
        vim.ui.input({ prompt = "Enter note name: " }, function(note_name)
          if note_name == nil or note_name == "" then
            print("Note creation cancelled")
            return
          end

          local formatted_name = date .. "_" .. note_name:gsub("%s+", "-")
          vim.cmd("ObsidianNew " .. formatted_name)
        end)
      end

      vim.keymap.set("n", "<leader>on", create_obsidian_note_with_date, { noremap = true, silent = true })
    end,
  },
}
