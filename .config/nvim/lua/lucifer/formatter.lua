return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
        {
            "<leader>f",
            function()
                require("conform").format({ async = true, lsp_fallback = true })
            end,
            mode = "",
            desc = "[f]ormat using formatter"
        },
    },
    config = function()
        require("conform").setup({
            formatters_by_fts = {
                javascript = { "prettier" },
                typescript = { "prettier" },
                html = { "prettier" },
                lua = { "stylua" },
                python = { "black", "isort" },
                bash = { "beautysh" },
                go = { "go-imports" },
            },
            format_on_save = {
                timeout_ms = 500,
                lsp_fallback = true,
            },
            notify_on_error = true,
        })
        vim.api.nvim_create_autocmd("BufWritePre", {
            pattern = "*",
            callback = function(args)
                require("conform").format({ bufnr = args.buf })
            end
        })
    end
}
