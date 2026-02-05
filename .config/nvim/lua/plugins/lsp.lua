return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      -- 1. Mason本体の起動
      require("mason").setup()

      -- 2. ホバーウィンドウの見た目を「金色の枠」にカスタマイズ
      vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
        vim.lsp.handlers.hover, {
          border = "rounded", -- 角丸の枠
        }
      )
      -- 枠線の色をあなたのアクセントカラー（金）に設定
      vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#ae8b2d" })

      -- 3. 共通の設定
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      local on_attach = function(_, bufnr)
        local opts = { buffer = bufnr, silent = true }
        
        -- K (Shift + k) で型情報を表示
        -- Vim標準のヘルプ機能をLSPのホバー表示で上書きします
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

        -- Esc の挙動を完全に制御する
        vim.keymap.set("n", "<Esc>", function()
          -- 1. フローティングウィンドウ（型表示など）があれば閉じる
          local found_float = false
          for _, win in ipairs(vim.api.nvim_list_wins()) do
            if vim.api.nvim_win_get_config(win).relative ~= "" then
              vim.api.nvim_win_close(win, false)
              found_float = true
            end
          end

          -- 2. 検索ハイライトを消す
          vim.cmd("noh")

          -- 3. もしフローティングウィンドウを閉じたら、そこで処理を終了（他へ連鎖させない）
          if found_float then
            return
          end
          
          -- 4. それ以外の場合は、標準の Esc 信号を送信
          return "<Esc>"
        end, { expr = true, buffer = bufnr, silent = true })

        -- 定義ジャンプ (gd)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        -- 参照表示 (gr)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
      end

      -- 4. Mason-lspconfig経由で各サーバーを自動起動
      require("mason-lspconfig").setup({
        ensure_installed = { "ts_ls", "gopls", "lua_ls" },
        handlers = {
          function(server_name)
            require("lspconfig")[server_name].setup({
              on_attach = on_attach,
              capabilities = capabilities,
            })
          end,
          ["lua_ls"] = function()
            require("lspconfig").lua_ls.setup({
              on_attach = on_attach,
              capabilities = capabilities,
              settings = {
                Lua = {
                  diagnostics = { globals = { 'vim' } },
                  workspace = { checkThirdParty = false },
                },
              },
            })
          end,
        },
      })
    end,
  },

  -- 補完エンジン本体
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip",
    },
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        snippet = {
          expand = function(args) require("luasnip").lsp_expand(args.body) end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-p>"] = cmp.mapping.select_prev_item(),
          ["<C-n>"] = cmp.mapping.select_next_item(),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "buffer" },
          { name = "path" },
        }),
      })
    end,
  },
}
