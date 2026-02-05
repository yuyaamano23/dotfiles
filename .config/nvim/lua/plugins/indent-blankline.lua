return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    indent = {
      char = "│",
      tab_char = "│",
    },
    scope = {
      -- hlchunk に強調を任せるため、IBL 側の強調はオフにする
      enabled = false, 
    },
    exclude = {
      filetypes = { "help", "nvim-tree", "lazy", "mason" },
    },
  },
}
