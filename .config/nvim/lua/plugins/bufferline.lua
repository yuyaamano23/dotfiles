return {
  -- 1. Bufferline の設定
  {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      require("bufferline").setup({
        options = {
          mode = "buffers",
          numbers = "none",
          -- Bdelete を使うように修正
          close_command = "Bdelete! %d",
          right_mouse_command = "Bdelete! %d",
          always_show_bufferline = false,
          offsets = {
            {
              filetype = "NvimTree",
              text = "File Explorer",
              text_align = "left",
              separator = true
            }
          },
          separator_style = "slant",
          show_buffer_close_icons = false,
          show_close_icon = false,
        },
        highlights = {
          fill = { bg = 'none' },
          background = { bg = 'none' },
          tab_selected = { bg = 'none' },
          separator = { fg = '#000000', bg = 'none' },
        },
      })

      -- キーバインド
      vim.keymap.set("n", "<C-[>", ":BufferLineCyclePrev<CR>", { silent = true })
      vim.keymap.set("n", "<C-]>", ":BufferLineCycleNext<CR>", { silent = true })
      
      -- ウィンドウを維持してバッファだけ消す魔法のコマンド
      vim.keymap.set("n", "<Leader>x", "<cmd>Bdelete<CR>", { silent = true, desc = "Close buffer" })
    end,
  },

  -- 2. ウィンドウ維持のためのプラグイン
  {
    "famiu/bufdelete.nvim",
    event = "VeryLazy",
  },
}
