return {
  "utilyre/barbecue.nvim",
  name = "barbecue",
  version = "*",
  dependencies = {
    "SmiteshP/nvim-navic",
    "nvim-tree/nvim-web-devicons", -- アイコン用
  },
  opts = {
    -- 透過設定を活かすため背景を none に
    theme = {
      normal = { bg = "none" },
    },
    show_modified = true, -- 編集済みマークを表示
  },
}
