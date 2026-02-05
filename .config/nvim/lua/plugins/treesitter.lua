return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" }, -- ファイルを開いた時に読み込む
    config = function()
      -- モジュールが存在するかチェックしてから実行する安全策
      local status, configs = pcall(require, "nvim-treesitter.configs")
      if not status then return end

      configs.setup({
        ensure_installed = { "tsx", "typescript", "go", "lua", "vim", "vimdoc", "markdown" },
        highlight = {
          enable = true,
        },
        indent = {
          enable = true, -- インデント自体の解析も有効化
        },
      })
    end,
  },
}
