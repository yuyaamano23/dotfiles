vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- 基本設定
vim.opt.clipboard = "unnamedplus"
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.background = "dark"
vim.opt.termguicolors = true

-- インデントをスペース2に固定
vim.opt.expandtab = true   -- Tab をスペースに変換
vim.opt.shiftwidth = 2     -- 自動インデント幅
vim.opt.tabstop = 2        -- 表示上の Tab 幅
vim.opt.softtabstop = 2    -- <Tab>/<BS> の幅


-- WezTermと共通の直感的な画面分割設定
vim.keymap.set('n', '<Leader>\\', ':vsplit<CR>', { silent = true, desc = 'Split window vertically' })
vim.keymap.set('n', '<Leader>-', ':split<CR>', { silent = true, desc = 'Split window horizontally' })

-- 削除・変更でヤンクしない設定 (Blackhole Register)
vim.keymap.set({'n', 'x'}, 'd', '"_d', { noremap = true })
vim.keymap.set('n', 'D', '"_D', { noremap = true })
vim.keymap.set({'n', 'x'}, 'c', '"_c', { noremap = true })
vim.keymap.set('n', 'C', '"_C', { noremap = true })
vim.keymap.set('n', 's', '"_s', { noremap = true })
vim.keymap.set('n', 'S', '"_S', { noremap = true })

-- 先にプラグインとカラースキームを読み込む
require("config.lazy")
require("colorscheme")

vim.cmd([[
  highlight Normal guibg=NONE ctermbg=NONE
  highlight NonText guibg=NONE ctermbg=NONE
  highlight LineNr guibg=NONE ctermbg=NONE
  highlight SignColumn guibg=NONE ctermbg=NONE
  highlight EndOfBuffer guibg=NONE ctermbg=NONE
  highlight CursorLine guibg=#222222
]])
