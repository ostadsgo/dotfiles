return {
  -- core
  { "nvim-lua/plenary.nvim" },
  {
    "ostadsgo/darkland",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd("colorscheme " .. "darkland")
    end,
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
}
