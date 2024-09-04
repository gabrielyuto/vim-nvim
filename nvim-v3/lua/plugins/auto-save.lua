return {
  "Pocco81/auto-save.nvim",
  config = function()
    require("auto-save").setup({
      enabled = true, -- Habilita o autosave por padrão
      trigger_events = { "InsertLeave", "TextChanged" }, -- Salva ao sair do modo de inserção ou modificar o texto
      execution_message = {
        message = function() -- Mensagem exibida ao salvar
          return ("Autosaved at " .. vim.fn.strftime("%H:%M:%S"))
        end,
        dim = 0.18, -- Transparência da mensagem
        cleaning_interval = 1000, -- Tempo para limpar a mensagem
      },
      conditions = {
        exists = true,
        filename_is_not = {},
        filetype_is_not = {},
        modifiable = true,
      },
      write_all_buffers = false, -- Salva todos os buffers ou apenas o atual
      debounce_delay = 135, -- Delay para salvar (em milissegundos)
    })
  end,
}
