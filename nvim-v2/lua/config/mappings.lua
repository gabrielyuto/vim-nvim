local wk = require("which-key")

wk.add({
  -- Modo normal
  { "<C-h>", "<C-w>h", desc = "Move to left split", mode = "n" },
  { "<C-j>", "<C-w>j", desc = "Move to down split", mode = "n" },
  { "<C-k>", "<C-w>k", desc = "Move to up split", mode = "n" },
  { "<C-l>", "<C-w>l", desc = "Move to right split", mode = "n" },
  { "<C-a>", ":NvimTreeToggle<CR>", desc = "Toggle NvimTree", mode = "n" },
  { "op", "o<Esc>k", desc = "Insert line below", mode = "n" },
  { "oi", "O<Esc>j", desc = "Insert line above", mode = "n" },
  { "oo", "A<CR>", desc = "Append new line at end", mode = "n" },
  { "te", ":tabe<CR>", desc = "New tab", mode = "n" },
  { "ty", ":bn<CR>", desc = "Next buffer", mode = "n" },
  { "tr", ":bp<CR>", desc = "Previous buffer", mode = "n" },
  { "td", ":bd<CR>", desc = "Delete buffer", mode = "n" },
  { "sh", ":split<CR>", desc = "Horizontal split", mode = "n" },
  { "sv", ":vsplit<CR>", desc = "Vertical split", mode = "n" },
  { "tt", ":q<CR>", desc = "Close tab", mode = "n" },
  { "tc", ":!", desc = "Run command", mode = "n" },
  { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find File", mode = "n" },
  { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep", mode = "n" },
  { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "List Buffers", mode = "n" },
  { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Find Help", mode = "n" },
  { "<leader>t", ":ToggleTerm direction=float<CR>", desc = "Floating Terminal", mode = "n" },
  { "<leader>v", ":ToggleTerm size=70 direction=vertical<CR>", desc = "Vertical Terminal", mode = "n" },
  { "<leader>h", ":ToggleTerm size=20 direction=horizontal<CR>", desc = "Horizontal Terminal", mode = "n" },
  { "<leader>bm", ":lua require('buffer_manager.ui').toggle_quick_menu()<CR>", desc = "Toggle Buffer Menu", mode = "n" },
  { "<leader>bc", ":lua require('buffer_manager').close_buffer()<CR>", desc = "Close Buffer", mode = "n" },
  { "<leader>bn", ":lua require('buffer_manager').next_buffer()<CR>", desc = "Next Buffer", mode = "n" },
  { "<leader>bp", ":lua require('buffer_manager').prev_buffer()<CR>", desc = "Previous Buffer", mode = "n" },
  { "<space>q", "<cmd>quit<cr>", desc = "Quit", mode = "n" },
  { "<space>w", "<cmd>update<cr>", desc = "Save file", mode = "n" },
  { "<space>a", ":qa<CR>", desc = "Quit all", mode = "n" },
  { "<space>q", ":q<CR>", desc = "Quit", mode = "n" },
  { "<space>ed", "<Cmd>CocCommand explorer --preset .vim<CR>", desc = "Vim Preset Explorer", mode = "n" },
  { "<space>ef", "<Cmd>CocCommand explorer --preset floating<CR>", desc = "Floating Explorer", mode = "n" },
  { "<space>ec", "<Cmd>CocCommand explorer --preset cocConfig<CR>", desc = "CocConfig Explorer", mode = "n" },
  { "<space>eb", "<Cmd>CocCommand explorer --preset buffer<CR>", desc = "Buffer Explorer", mode = "n" },
  { "<space>el", "<Cmd>CocList explPresets<CR>", desc = "List Explorer Presets", mode = "n" },
  { "<space>.", "<Plug>(coc-codeaction)", desc = "Import", mode = "n" },
 
  -- Modo terminal
  { "<Esc>", "<C-\\><C-n>:ToggleTerm<CR>", desc = "Hide Terminal", mode = "t" },
  -- { "<leader>q", "<C-\\><C-n><cmd>q<CR>", desc = "Close Terminal", mode = "t" },
  
  -- Modo insercao
  { "<C-l>", "<Plug>(coc-snippets-expand)", desc = "Expand Snippet", mode = "i" },
  { "<C-j>", "<Plug>(coc-snippets-expand-jump)", desc = "Expand or Jump Snippet", mode = "i" },
  
  -- Modo visual
  { "<C-j>", "<Plug>(coc-snippets-select)", desc = "Select Snippet", mode = "v" },
  { "<C-c>", ":w !pbcopy<CR><Esc>", desc = "Copy to transfer area", mode = "v" },
  
  -- Modo visual linha
  { "<leader>x", "<Plug>(coc-convert-snippet)", desc = "Convert to Snippet", mode = "x" },
})
