return {
  -- Gitの差分をグラフィカルに表示
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewFileHistory" },
    keys = {
      { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Git Diff" },
      { "<leader>gh", "<cmd>DiffviewFileHistory %<cr>", desc = "Git File History" },
    },
  },
  -- 行ごとの変更点表示 & Blame表示
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require('gitsigns').setup({
        current_line_blame = true, -- これで Git Blame が行末に薄く出ます
        current_line_blame_opts = {
          delay = 500,
        },
      })
    end
  }
}
