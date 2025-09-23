local lsp_servers = {
  "lua_ls",
  "bashls",
  "clangd",
  "cmake",
  "cssls",
  "dockerls",
  "docker_compose_language_service",
  "html",
  "jsonls",
  "ts_ls",
  "marksman",
  "pylsp",
  "intelephense",
  "vuels",
}

require("mason").setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "→",
      package_uninstalled = "×",
    },
  },
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()
require("mason-lspconfig").setup({
  ensure_installed = lsp_servers,
  capabilities = capabilities,
})

vim.lsp.enable(lsp_servers)
