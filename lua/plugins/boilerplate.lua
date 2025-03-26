return {
    "cvigilv/esqueleto.nvim",
    config = function()
        require("esqueleto").setup({
            autouse = true,                                                -- whether to auto-use a template if it's the only one for a pattern
            directories = { vim.fn.stdpath("config") .. "/lua/plugins/templates" }, -- template directories
            patterns = function(dir)
                return vim.fn.readdir(dir)
            end,
        })
    end,
}
