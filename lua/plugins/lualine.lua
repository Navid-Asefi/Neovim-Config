-- Set lualine as statusline
return {
	"nvim-lualine/lualine.nvim",
	config = function()
		local colors = {
			gray = "#44475a",
			lightgray = "#5f6a8e",
			orange = "#ffb86c",
			purple = "#bd93f9",
			red = "#ff5555",
			yellow = "#f1fa8c",
			green = "#50fa7b",
			white = "#f8f8f2",
			black = "#282a36",
		}

		local dracula = {
			normal = {
				a = { bg = colors.purple, fg = colors.black, gui = "bold" },
				b = { bg = colors.lightgray, fg = colors.white },
				c = { bg = colors.gray, fg = colors.white },
			},
			insert = {
				a = { bg = colors.green, fg = colors.black, gui = "bold" },
				b = { bg = colors.lightgray, fg = colors.white },
				c = { bg = colors.gray, fg = colors.white },
			},
			visual = {
				a = { bg = colors.yellow, fg = colors.black, gui = "bold" },
				b = { bg = colors.lightgray, fg = colors.white },
				c = { bg = colors.gray, fg = colors.white },
			},
			replace = {
				a = { bg = colors.red, fg = colors.black, gui = "bold" },
				b = { bg = colors.lightgray, fg = colors.white },
				c = { bg = colors.gray, fg = colors.white },
			},
			command = {
				a = { bg = colors.orange, fg = colors.black, gui = "bold" },
				b = { bg = colors.lightgray, fg = colors.white },
				c = { bg = colors.gray, fg = colors.white },
			},
			inactive = {
				a = { bg = colors.gray, fg = colors.white, gui = "bold" },
				b = { bg = colors.lightgray, fg = colors.white },
				c = { bg = colors.gray, fg = colors.white },
			},
		}
		-- Import color theme based on environment variable NVIM_THEME
		local env_var_nvim_theme = os.getenv("NVIM_THEME") or "drac"

		-- Define a table of themes
		local themes = {
			drac = dracula,
		}

		local mode = {
			"mode",
			fmt = function(str)
				-- return ' ' .. str:sub(1, 1) -- displays only the first character of the mode
				return " " .. str
			end,
		}

		local filename = {
			"filename",
			file_status = true, -- displays file status (readonly status, modified status)
			path = 0, -- 0 = just filename, 1 = relative path, 2 = absolute path
		}

		local hide_in_width = function()
			return vim.fn.winwidth(0) > 100
		end

		local diagnostics = {
			"diagnostics",
			sources = { "nvim_diagnostic" },
			sections = { "error", "warn" },
			symbols = { error = " ", warn = " ", info = " ", hint = " " },
			colored = false,
			update_in_insert = false,
			always_visible = false,
			cond = hide_in_width,
		}

		local diff = {
			"diff",
			colored = false,
			symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
			cond = hide_in_width,
		}

		require("lualine").setup({
			options = {
				icons_enabled = true,
				theme = dracula, -- Set theme based on environment variable
				-- Some useful glyphs:
				-- https://www.nerdfonts.com/cheat-sheet
				--        
				section_separators = { left = "", right = "" },
				component_separators = { left = "", right = "" },
				disabled_filetypes = { "alpha", "neo-tree", "Avante" },
				always_divide_middle = true,
			},
			sections = {
				lualine_a = { mode },
				lualine_b = { "branch" },
				lualine_c = { filename },
				lualine_x = {
					diagnostics,
					diff,
					{ "encoding", cond = hide_in_width },
					{ "filetype", cond = hide_in_width },
				},
				lualine_y = { "location" },
				lualine_z = { "progress" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { { "filename", path = 1 } },
				lualine_x = { { "location", padding = 0 } },
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {},
			extensions = { "fugitive" },
		})
	end,
}
