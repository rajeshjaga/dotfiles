return{
    "nvim-treesitter/nvim-treesitter",
     build = ":TSUpdate",
    config = function () 
      local configs = require("nvim-treesitter.configs")

      configs.setup({
          ensure_installed = { "c", "lua", "typescript", "vim", "vimdoc", "javascript", "html" },
          auto_installed = true,
          sync_install = false,
          highlight = { enable = true },
          indent = { enable = true },  
        })
    end
}
