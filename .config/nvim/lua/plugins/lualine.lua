return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' }, -- 名前を修正しました
  config = function()
    require('lualine').setup({
      options = {
        theme = 'auto', -- 特定のテーマを指定せず auto にするのが最も安定します
        globalstatus = true, -- あなたのモダンなUIにはこれがおすすめです
      }
    })
  end
}
