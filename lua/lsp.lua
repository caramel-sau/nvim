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
  "vtsls",
  "marksman",
  "pylsp",
  "intelephense",
  "vue_ls",
  "emmet_language_server",
  "eslint",
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

-- vue_ls は事前に ts_ls と vtsls を設定しておく必要がある
vim.lsp.config('ts_ls', {
  filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" },
})
vim.lsp.config('vtsls', {
  filetypes = { "javascript", "typescript", "vue" },
})

vim.lsp.enable(lsp_servers)
