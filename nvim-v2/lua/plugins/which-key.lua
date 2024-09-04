return {
  "folke/which-key.nvim",
  
  config = function()
    local wk = require("which-key")

    wk.setup {
      ignore_missing = true,  -- Ignorar mapeamentos que não foram explicitamente registrados
      plugins = {
        marks = false,  -- Desativa o suporte automático para marks
        registers = false,  -- Desativa o suporte automático para registers
        spelling = {
          enabled = false,  -- Desativa sugestões de ortografia automáticas
        },
      },
      key_labels = {},
      window = {
        border = "single",
      },
      layout = {
        height = { min = 4, max = 25 },
        width = { min = 20, max = 50 },
        spacing = 3,
        align = "left",
      },
      show_help = false,  -- Não mostrar a ajuda automática
      triggers = "auto",
      hidden = {
        "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ ",
        "<Plug>",
        "^<C-U>",
        "^:Coc",
        "<C-U>CocList",
        "<C-U>CocAction",
        "<C-U>CocCommand",
      },
      triggers_blacklist = {
          -- Ignorar triggers automáticos para esses modos
          i = { "j", "k" },  -- No modo de inserção, ignore "j" e "k"
          v = { "j", "k" },  -- No modo visual, ignore "j" e "k"

        -- Excluir qualquer coisa mapeada pelo Coc
        n = { "<C-U>", "<Plug>" },
        i = { "<C-U>", "<Plug>" },
        v = { "<C-U>", "<Plug>" },
      },
    }
  end
}
