return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
        "3rd/image.nvim",
    },
    config = function()
        require("neo-tree").setup({
            enable_git_status = true,
            enable_diagnostics = true,
            filesystem = {
                filtered_items = {
                    visible = true,
                    hide_dotfiles = true,
                    hide_hidden = true,
                    never_show = { ".git" },
                },
            },
            window = {
                width = 30,
                position = "right",
                mapping = {
                    ["T"] = "open"
                }
            },
        })
        vim.keymap.set("n", "<C-N>", ":Neotree filesystem reveal right<CR>", {})
        vim.keymap.set("n", "<C-E>", ":Neotree toggle<CR>", {})
        -- vim.keymap.set("n", "<C-S-E>", ":Neotree close<CR>", {})
    end
}
