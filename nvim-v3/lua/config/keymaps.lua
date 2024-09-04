-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- No seu arquivo keymaps.lua ou init.lua
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- ToggleTerm Configurações
map("n", "<leader>t", ":ToggleTerm direction=float<CR>", opts)
map("n", "<leader>v", ":ToggleTerm size=70 direction=vertical<CR>", opts)
map("n", "<leader>h", ":ToggleTerm size=20 direction=horizontal<CR>", opts)

-- Buffer Manager Configurações
map("n", "<leader>bm", ":lua require('buffer_manager.ui').toggle_quick_menu()<CR>", opts)
map("n", "<leader>bc", ":lua require('buffer_manager').close_buffer()<CR>", opts)
map("n", "<leader>bn", ":lua require('buffer_manager').next_buffer()<CR>", opts)
map("n", "<leader>bp", ":lua require('buffer_manager').prev_buffer()<CR>", opts)

-- Keymap para esconder o terminal no modo terminal
map("t", "<Esc>", "<C-\\><C-n>:ToggleTerm<CR>", { noremap = true, silent = true, desc = "Hide Terminal" })

-- Opcionalmente, adicionar descrições se estiver usando uma configuração mais avançada
-- com uma função para adicionar keymaps que inclua as descrições:
local keymap_opts = {
  { key = "<leader>t", cmd = ":ToggleTerm direction=float<CR>", desc = "Floating Terminal" },
  { key = "<leader>v", cmd = ":ToggleTerm size=70 direction=vertical<CR>", desc = "Vertical Terminal" },
  { key = "<leader>h", cmd = ":ToggleTerm size=20 direction=horizontal<CR>", desc = "Horizontal Terminal" },
  {
    key = "<leader>bm",
    cmd = ":lua require('buffer_manager.ui').toggle_quick_menu()<CR>",
    desc = "Toggle Buffer Menu",
  },
  { key = "<leader>bc", cmd = ":lua require('buffer_manager').close_buffer()<CR>", desc = "Close Buffer" },
  { key = "<leader>bn", cmd = ":lua require('buffer_manager').next_buffer()<CR>", desc = "Next Buffer" },
  { key = "<leader>bp", cmd = ":lua require('buffer_manager').prev_buffer()<CR>", desc = "Previous Buffer" },
}

for _, map in ipairs(keymap_opts) do
  vim.api.nvim_set_keymap("n", map.key, map.cmd, { noremap = true, silent = true, desc = map.desc })
end
