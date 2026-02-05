return {
  -- 1. 背景透過設定
  {
    "xiyaowong/transparent.nvim",
    config = function()
      require("transparent").setup({
        extra_groups = {
          "NormalFloat", -- フローティングウィンドウ（Noiceの入力欄など）も透過
          "NvimTreeNormal",
          "NoiceCmdlinePopup", -- Noiceのコマンド入力ポップアップを透過
          "NoiceCmdlinePopupBorder",
        },
      })
    end
  },

  -- 2. コマンドライン・通知の改善 (noice.nvim)
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify", -- きれいな通知ポップアップ
    },
    opts = {
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.set_hl_from_vsep_with_copy"] = true,
          ["skip_url_parse"] = true,
        },
      },
      presets = {
        bottom_search = true,    -- 検索バーを下に配置
        command_palette = true,  -- コマンド入力を中央にポップアップ
        long_message_to_split = true,
      },
    },
  },

  -- 3. キーガイド (which-key.nvim)
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300 -- ガイドが出るまでの時間（ミリ秒）
    end,
    opts = {
      -- ここに詳細設定を書けますが、まずはデフォルトで十分便利です
    },
  },
}
