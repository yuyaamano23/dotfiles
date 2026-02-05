return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("nvim-tree").setup({
      -- 背景色を反映させるため、あえて sync_root_with_cwd を有効にするのが安定します
      sync_root_with_cwd = true,
      renderer = {
        indent_markers = { enable = true },
        icons = {
          glyphs = {
            folder = { arrow_closed = "⏵", arrow_open = "⏷" },
          },
        },
      },
      update_focused_file = {
        enable = true,
        update_root = true,
      },
      actions = {
        open_file = {
          window_picker = {
            enable = true, -- どのウィンドウで開くか選択可能にする
          },
        },
      },
      view = {
        width = 40,
        side = "left",
      },
      filters = {
        -- gitignore にあるファイルも表示する
        git_ignored = false,
        -- ドットファイル（.env など）を表示する
        dotfiles = false, 
        -- 特定のカスタムファイルを隠したい場合はここに追加（例: .git など）
        custom = {
          "^.git$",
          "^.DS_Store$"
        },
      },
      git = {
        -- 表示はするが、アイコンの色などで ignore されていることを判別したい場合
        ignore = false,
      },
    })

    -- setup の後に実行することで、プラグインのデフォルト設定を確実に上書きします
    local function set_tree_hl()
      -- 背景を「なし(none)」に設定することで、WezTermの背景（透過0.85）をそのまま透かします
      -- 完全に透明だと文字が見づらい場合、'none' の代わりに文字色とのコントラストを調整します
      vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = "none", ctermbg = "none" })
      vim.api.nvim_set_hl(0, "NvimTreeNormalNC", { bg = "none", ctermbg = "none" })
      
      -- 境界線を薄いグレーまたは透過設定に合わせる
      -- 背景が透過なので、境界線は少しだけ見えるようにしておくと境界が分かりやすいです
      vim.api.nvim_set_hl(0, "NvimTreeWinSeparator", { fg = "#333333", bg = "none" })
      
      -- 下部の余白（チルダなどが並ぶ場所）も透過
      vim.api.nvim_set_hl(0, "NvimTreeEndOfBuffer", { bg = "none" })
    end

    -- 即時反映
    set_tree_hl()

    -- カラースキームが後から読み込まれても色が消えないように自動コマンドを設定
    vim.api.nvim_create_autocmd("ColorScheme", {
      callback = set_tree_hl,
    })

    vim.keymap.set('n', '<Leader>e', ':NvimTreeToggle<CR>', { silent = true, desc = 'Toggle File Explorer' })
  end,
}
