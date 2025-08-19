return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      explorer = {
        enabled = false,
        -- replace_netrw will open explorer when a directory is opened
        replace_netrw = true,
      },
      picker = {
        sources = {
          explorer = {
            -- Explorer picker specific configuration
            layout = {
              layout = { position = "left" },
            },
            follow_file = true,
            tree = true,
            focus = "list",
            jump = {
              close = false,
            },
            auto_close = false,
          },
        },
      },
    },
    keys = {
      -- Keep your existing keybinding for toggling explorer
      {
        "<leader>e",
        function()
          require("snacks").explorer()
        end,
        desc = "File Explorer",
      },
      {
        "<leader>E",
        function()
          require("snacks").explorer({ cwd = vim.uv.cwd() })
        end,
        desc = "File Explorer (cwd)",
      },
    },
  },
}
