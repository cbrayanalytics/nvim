return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "folke/neodev.nvim", opts = {} },
		"williamboman/mason-lspconfig.nvim",
	},
	opts = function()
		local lspconfig = require("lspconfig")
		local keymap = vim.keymap

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				local opts = { buffer = ev.buf, silent = true }
				local client = vim.lsp.get_client_by_id(ev.data.client_id)

				-- Helper: always use the correct position encoding for this client
				local function make_position_params()
					return vim.lsp.util.make_position_params(0, client and client.offset_encoding or "utf-16")
				end

				-- Example: Use in a custom keymap (for demonstration)
				keymap.set("n", "<leader>lp", function()
					local params = make_position_params()
					vim.notify(vim.inspect(params), vim.log.levels.INFO, { title = "Position Params" })
				end, vim.tbl_extend("force", opts, { desc = "Show LSP position params (demo)" }))

				-- Your existing keymaps:
				keymap.set(
					"n",
					"gR",
					"<cmd>Telescope lsp_references<CR>",
					vim.tbl_extend("force", opts, { desc = "Show LSP references" })
				)
				keymap.set(
					"n",
					"gD",
					vim.lsp.buf.declaration,
					vim.tbl_extend("force", opts, { desc = "Go to declaration" })
				)
				keymap.set(
					"n",
					"gd",
					"<cmd>Telescope lsp_definitions<CR>",
					vim.tbl_extend("force", opts, { desc = "Show LSP definitions" })
				)
				keymap.set(
					"n",
					"gi",
					"<cmd>Telescope lsp_implementations<CR>",
					vim.tbl_extend("force", opts, { desc = "Show LSP implementations" })
				)
				keymap.set(
					"n",
					"gt",
					"<cmd>Telescope lsp_type_definitions<CR>",
					vim.tbl_extend("force", opts, { desc = "Show LSP type definitions" })
				)
				keymap.set(
					{ "n", "v" },
					"<leader>ca",
					vim.lsp.buf.code_action,
					vim.tbl_extend("force", opts, { desc = "See available code actions" })
				)
				keymap.set(
					"n",
					"<leader>rn",
					vim.lsp.buf.rename,
					vim.tbl_extend("force", opts, { desc = "Smart rename" })
				)
				keymap.set(
					"n",
					"<leader>D",
					"<cmd>Telescope diagnostics bufnr=0<CR>",
					vim.tbl_extend("force", opts, { desc = "Show buffer diagnostics" })
				)
				keymap.set(
					"n",
					"<leader>d",
					vim.diagnostic.open_float,
					vim.tbl_extend("force", opts, { desc = "Show line diagnostics" })
				)
				keymap.set(
					"n",
					"[d",
					vim.diagnostic.goto_prev,
					vim.tbl_extend("force", opts, { desc = "Go to previous diagnostic" })
				)
				keymap.set(
					"n",
					"]d",
					vim.diagnostic.goto_next,
					vim.tbl_extend("force", opts, { desc = "Go to next diagnostic" })
				)
				keymap.set(
					"n",
					"K",
					vim.lsp.buf.hover,
					vim.tbl_extend("force", opts, { desc = "Show documentation for what is under cursor" })
				)
				keymap.set(
					"n",
					"<leader>rs",
					":LspRestart<CR>",
					vim.tbl_extend("force", opts, { desc = "Restart LSP" })
				)
			end,
		})

		-- Diagnostic signs
		vim.diagnostic.config({
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = " ",
					[vim.diagnostic.severity.WARN] = " ",
					[vim.diagnostic.severity.HINT] = "󰠠 ",
					[vim.diagnostic.severity.INFO] = " ",
				},
			},
		})

		return {
			servers = {
				lua_ls = {
					settings = {
						Lua = {
							diagnostics = { globals = { "vim" } },
							completion = { callSnippet = "Replace" },
						},
					},
				},
				bashls = {
					cmd = { "bash-language-server", "start" },
					settings = {
						bashIde = {
							globPattern = vim.env.GLOB_PATTERN or "*@(.sh|.inc|.bash|.command)",
						},
					},
					filetypes = { "bash", "sh" },
					root_dir = require("lspconfig.util").root_pattern(".git"),
				},
				pyright = {
					settings = {
						python = {
							analysis = {
								autoSearchPaths = true,
								diagnosticMode = "openFilesOnly",
								useLibraryCodeForTypes = true,
							},
						},
					},
				},
			},
		}
	end,
	config = function(_, opts)
		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local lspconfig = require("lspconfig")
		local capabilities = cmp_nvim_lsp.default_capabilities()

		require("mason-lspconfig").setup({
			ensure_installed = { "bashls", "lua_ls", "pyright", "gopls" },
			automatic_installation = true,
			handlers = {
				function(server_name)
					local server_opts = opts.servers[server_name] or {}
					lspconfig[server_name].setup(vim.tbl_extend("force", {
						capabilities = capabilities,
					}, server_opts))
				end,
			},
		})
	end,
}
