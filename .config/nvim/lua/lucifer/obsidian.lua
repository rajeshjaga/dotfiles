return {
    "epwalsh/obsidian.nvim",
    version = "*",
    lazy = true,
    ft = "markdown",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "hrsh7th/nvim-cmp",
        "nvim-telescope/telescope.nvim",
        "nvim-treesitter/nvim-treesitter"
    },
    opts = {
        workspaces = {
            {
                name = "Personal",
                path = "~/Code/Obsidian/"
            }
        },
        daily_notes = {
            folder = "daily/dailies",
            date_format = "%Y-%m-%d",
            template = nil
        },
        completion = {
            nvim_cmp = true,
            min_chars = 2
        }
    }
}
