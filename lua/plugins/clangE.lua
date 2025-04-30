return {
  "p00f/clangd_extensions.nvim",
  lazy = true,
  config = function()
    -- Set up clangd_extensions with the given options
    require("clangd_extensions").setup({
      inlay_hints = {
        inline = false, -- Disable inline inlay hints
      },
      ast = {
        -- Role icons for AST elements (requires codicons)
        role_icons = {
          type = "",
          declaration = "",
          expression = "",
          specifier = "",
          statement = "",
          ["template argument"] = "",
        },
        kind_icons = {
          Compound = "",
          Recovery = "",
          TranslationUnit = "",
          PackExpansion = "",
          TemplateTypeParm = "",
          TemplateTemplateParm = "",
          TemplateParamObject = "",
        },
        highlights = {
          detail = "Comment", -- Highlight the detail field in comments
        },
      },
      memory_usage = {
        border = "none", -- No border for memory usage info
      },
      symbol_info = {
        border = "none", -- No border for symbol info
      },
    })
  end,
  opts = {},
}
