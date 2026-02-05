return {
  'mrjones2014/smart-splits.nvim',
  lazy = false,
  config = function()
    local ss = require('smart-splits')

    -- Ctrl + j を起点とした移動
    -- これにより、nvim-tree にフォーカスがあっても Ctrl + j -> l で編集画面に戻れます
    vim.keymap.set('n', '<C-j>h', ss.move_cursor_left)
    vim.keymap.set('n', '<C-j>j', ss.move_cursor_down)
    vim.keymap.set('n', '<C-j>k', ss.move_cursor_up)
    vim.keymap.set('n', '<C-j>l', ss.move_cursor_right)
  end
}
