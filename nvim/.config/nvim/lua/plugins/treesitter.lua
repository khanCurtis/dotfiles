return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").setup({
        ensure_installed = {
          "bash",
          "c",
          "cpp",
          "diff",
          "html",
          "css",
          "lua",
          "luadoc",
          "markdown",
          "markdown_inline",
          "query",
          "vim",
          "vimdoc",
          "rust",
          "python",
          "typescript",
          "javascript",
        },
        auto_install = true,
      })

      -- Enable treesitter-based highlighting and indentation
      vim.api.nvim_create_autocmd("FileType", {
        callback = function()
          pcall(vim.treesitter.start)
        end,
      })
    end,
  },
}
