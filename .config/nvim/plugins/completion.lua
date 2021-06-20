local compe = require("compe")

local function init(paq)
	vim.o.completeopt = "menuone,noselect"

	paq({ "hrsh7th/vim-vsnip" })
	-- paq {"rafamadriz/friendly-snippets"}
	paq({ "winston0410/friendly-snippets" })
	paq({ "hrsh7th/nvim-compe" })
	paq({ "andersevenrud/compe-tmux" })

	compe.setup({
		enabled = true,
		autocomplete = true,
		debug = false,
		min_length = 1,
		preselect = "enable",
		throttle_time = 80,
		source_timeout = 200,
		incomplete_delay = 400,
		max_abbr_width = 100,
		max_kind_width = 100,
		max_menu_width = 100,
		documentation = true,

		source = {
			path = { priority = 80 },
			buffer = { ignored_filetypes = { "sql" }, priority = 90 },
			tags = { ignored_filetypes = { "sql" }, priority = 80 },
			-- calc = { priority = 20 },
			spell = { priority = 20 },
			nvim_lsp = { priority = 95 },
			nvim_lua = { priority = 50 },
			vsnip = { priority = 100 },
			rg = { priority = 70, ignored_filetypes = { "sql" } },
            -- tmux = { priority = 60, ignored_filetypes = { "sql" } },
		},
	})

	vim.api.nvim_set_keymap("i", "<CR>", "compe#confirm('<CR>')", { expr = true, noremap = true, silent = true })

	vim.opt.wildignore = {
		"*.o",
		"*.obj,*~",
		"*.git*",
		"*.meteor*",
		"*vim/backups*",
		"*sass-cache*",
		"*mypy_cache*",
		"*__pycache__*",
		"*cache*",
		"*logs*",
		"*node_modules*",
		"**/node_modules/**",
		"*DS_Store*",
		"*.gem",
		"log/**",
		"tmp/**",
	}
end

return { init = init }
