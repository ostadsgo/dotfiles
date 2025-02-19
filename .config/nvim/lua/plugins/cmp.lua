return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "L3MON4D3/LuaSnip",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    local cmp = require("cmp")
    cmp.setup({
      completion = { autocomplete = false },
      snippet = {
        expand = function(args)
          local luasnip = require("luasnip")
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        -- `Enter` key to confirm completion
        ["<CR>"] = cmp.mapping.confirm({ select = true }),

        -- Ctrl+Space to trigger completion menu
        ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),

        -- Navigate between snippet placeholder
        ["<A-j>"] = cmp.mapping.select_next_item(),
        ["<A-k>"] = cmp.mapping.select_prev_item(),
        ["<Tab>"] = cmp.mapping.select_next_item(),
        ["<S-Tab>"] = cmp.mapping.select_prev_item(),

        -- Scroll up and down in the completion documentation
        ["<C-u>"] = cmp.mapping.scroll_docs(-4),
        ["<C-d>"] = cmp.mapping.scroll_docs(4),

        ["<C-y>"] = cmp.config.disable,
        ["<C-e>"] = cmp.mapping({
          i = cmp.mapping.abort(),
          c = cmp.mapping.close(),
        }),
      }),

      sources = {
        { name = "nvim_lsp" },
        { name = "buffer" },
        { name = "cmdline" },
        { name = "path" },
        -- { name = "luasnip" },
      },
    })
  end,
}
