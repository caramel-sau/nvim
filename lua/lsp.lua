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
  "vue_ls",
  "emmet_language_server",
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

require("mason-lspconfig").setup({
  ensure_installed = lsp_servers,
  capabilities = require("cmp_nvim_lsp").default_capabilities(),
})

vim.lsp.enable(lsp_servers)
