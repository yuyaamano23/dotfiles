return { "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
  },

  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
    { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
    { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
    { "<leader>fB", "<cmd>Telescope file_browser<cr>", desc = "File Browser" },
    { "<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Document Symbols" },
    { "<leader>ld", "<cmd>Telescope diagnostics<cr>", desc = "Diagnostics" },
  },

  config = function()
    local telescope = require("telescope")

    telescope.setup({
      defaults = {
        file_ignore_patterns = { "node_modules", ".git/" },

        border = true,
        borderchars = {
    	  prompt  = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
  	  results = { "─", "│", "─", "│", "├", "┤", "╯", "╰" },
  	  preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
        },

        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
	    override_file_sorter = true,
	    case_mode = "smart_case",
	  },
	},
      }
    })

    vim.api.nvim_set_hl(0, "FloatBorder",     { fg = "#5f5f5f", bg = "NONE" })
    vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = "#5f5f5f", bg = "NONE" })

    telescope.load_extension("file_browser")
    telescope.load_extension("fzf")
  end,
}

