require('mason').setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "→",
      package_uninstalled = "×",
    }
  }
})

require('mason-lspconfig').setup {
  ensure_installed = {
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
  }
}

-- auto lspconfig setting
require('mason-lspconfig').setup_handlers {
  function(server_name)
    -- ref: https://github.com/NvChad/NvChad/blob/v2.5/lua/nvchad/configs/lspconfig.lua
    local M = {}
    local map = vim.keymap.set

    -- export on_attach & capabilities
    M.on_attach = function(_, bufnr)
      local function opts(desc)
        return { buffer = bufnr, desc = "LSP " .. desc }
      end

      map("n", "gD", vim.lsp.buf.declaration, opts "Go to declaration")
      map("n", "gd", vim.lsp.buf.definition, opts "Go to definition")
      map("n", "gi", vim.lsp.buf.implementation, opts "Go to implementation")
      map("n", "<leader>sh", vim.lsp.buf.signature_help, opts "Show signature help")
      map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts "Add workspace folder")
      map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts "Remove workspace folder")

      map("n", "<leader>wl", function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end, opts "List workspace folders")

      map("n", "<leader>D", vim.lsp.buf.type_definition, opts "Go to type definition")
      -- map("n", "<leader>ra", require "nvchad.lsp.renamer", opts "NvRenamer")

      map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts "Code action")
      map("n", "gr", vim.lsp.buf.references, opts "Show references")
    end

    require('lspconfig')[server_name].setup(M)
  end,
}
