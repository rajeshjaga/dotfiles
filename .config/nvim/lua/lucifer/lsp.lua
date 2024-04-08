return {
    "neovim/nvim-lspconfig",
    dependencies = {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        'WhoIsSethDaniel/mason-tool-installer.nvim',
        { 'j-hui/fidget.nvim', opts = {} },
        { 'folke/neodev.nvim', opts = {} },
        'hrsh7th/nvim-cmp',
        'mfussenegger/nvim-lint',
    },
    config = function()
        local tBuiltins = require('telescope.builtin')
        vim.api.nvim_create_autocmd('LspAttach', {
            group = vim.api.nvim_create_augroup('lucifer-lsp-attach', { clear = true }),
            callback = function(event)
                local map = function(keymaps, func, desc)
                    vim.keymap.set('n', keymaps, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
                end

                map("gI", tBuiltins.lsp_implementations, '[g]oto [I]mplementation')
                map("gr", tBuiltins.lsp_references, '[g]oto [R]eferences')
                map("gd", tBuiltins.lsp_definitions, '[g]oto [D]efinition')
                map("<leader>ds", tBuiltins.lsp_document_symbols, "[D]ocument [S]ymbols")
                map("<leader>ws", tBuiltins.lsp_workspace_symbols, "[W]orkspace [S]ymbols")
                map("<leader>gD", tBuiltins.lsp_type_definitions, "[T]ype [D]efinition")

                map("gD", vim.lsp.buf.declaration, '[G]oto [D]eclaration')
                map("<leader>s", vim.lsp.buf.format, '[f]ormat buffer')
                map("K", vim.lsp.buf.hover, "Hover on the word")
                map("<leader>r", vim.lsp.buf.rename, "Rename the variable under Cursor")
                map("<leader>ca", vim.lsp.buf.code_action, '[c]ode [a]ctions')

                local client = vim.lsp.get_client_by_id(event.data.client_id)
                if client and client.server_capabilities.documentHighlightProvider then
                    vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHold' }, {
                        buffer = event.buf,
                        callback = vim.lsp.buf.document_highlight,
                    })
                    vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMoved' }, {
                        buffer = event.buf,
                        callback = vim.lsp.buf.clear_references,
                    })
                end
            end
        })

        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

        local servers = {
            lua_ls = {
                settings = {
                    Lua = {
                        completion = {
                            callSnippet = 'Replace'
                        }
                    }
                }
            },
            rust_analyzer = {},
            clangd = {},
            tsserver = {},
            tailwindcss = {},
            prettier = {},
            isort = {},
            pyright = {},
            black = {},
            gopls = {},
            goimports = {},
            bashls = {},
            beautysh = {},
        }
        require('mason').setup()
        local ensure_installed = vim.tbl_keys(servers or {})
        vim.list_extend(ensure_installed, {
            'stylua',
        })
        require('mason-tool-installer').setup { ensure_installed = ensure_installed }
        require('mason-lspconfig').setup {
            automatic_installation = true,
            handlers = {
                function(server_name)
                    local server = servers[server_name] or {}
                    server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
                    require('lspconfig')[server_name].setup(server)
                end
            }
        }
    end
}
