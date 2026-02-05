return {
  "shellRaining/hlchunk.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("hlchunk").setup({
      chunk = {
        enable = true,
        use_treesitter = true,
        style = "#E2B84B", -- 視認性の高い金
      },
      indent = {
        -- 背景線は indent-blankline に任せるため、こちらはオフ
        enable = false, 
      },
    })
  end
}
