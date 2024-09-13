return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      "windwp/nvim-ts-autotag",
    },
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "python", "go", "javascript", "c", "lua", "rust", "html" },
        sync_install = false,
        auto_install = true,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        indent = { enable = false },
        autotag = { enable = true },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<C-space>",
            node_incremental = "<C-space>",
            scope_incremental = false,
            node_decremental = "<BS>",
          },
        },
        textobjects = {
          select = {
            enable = true,
            lookahead = true,
            keymaps = {
              -- assignement
              ["a="] = "@assignment.outer",
              ["i="] = "@assignment.inner",
              ["l="] = "@assignment.lhs",
              ["r="] = "@assignment.rhs",

              -- parameter
              ["aa"] = "@parameter.outer",
              ["ia"] = "@parameter.inner",

              -- condition
              ["ii"] = "@conditional.inner",
              ["ai"] = "@conditional.outer",

              -- loop
              ["il"] = "@loop.inner",
              ["al"] = "@loop.outer",

              -- function / method
              ["af"] = "@call.outer",
              ["if"] = "@call.inner",
              ["am"] = "@function.outer",
              ["im"] = "@function.inner",

              -- class
              ["ac"] = "@class.outer",
              ["ic"] = "@class.inner",

              -- comment
              ["at"] = "@comment.outer",
            },
          },
          move = {
            enable = true,
            set_jumps = true,
            goto_next_start = {
              ["]f"] = "@call.outer",
              ["]m"] = "@function.outer",
              ["]c"] = "@class.outer",
              ["]i"] = "@conditional.outer",
              ["]l"] = "@loop.outer",

              ["]s"] = "@scope",
              ["]z"] = "@fold",
            },
            goto_next_end = {
              ["]F"] = "@call.outer",
              ["]M"] = "@function.outer",
              ["]C"] = "@class.outer",
              ["]I"] = "@conditional.outer",
              ["]L"] = "@loop.outer",
            },
            goto_previous_start = {
              ["[f"] = "@call.outer",
              ["[m"] = "@function.outer",
              ["[c"] = "@class.outer",
              ["[i"] = "@conditional.outer",
              ["[l"] = "@loop.outer",
            },
            goto_previous_end = {
              ["[F"] = "@call.outer",
              ["[M"] = "@function.outer",
              ["[C"] = "@class.outer",
              ["[I"] = "@conditional.outer",
              ["[L"] = "@loop.outer",
            },
          },
        },
      })
    end,
  },
}
