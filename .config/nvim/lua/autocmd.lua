vim.api.nvim_create_autocmd("TextYankPost", {
    desc="Highlight the yanked text",
    group = vim.api.nvim_create_augroup("Lucifer yanked", { clear = true} ),
    callback = function ()
       vim.highlight.on_yank()
    end
})
