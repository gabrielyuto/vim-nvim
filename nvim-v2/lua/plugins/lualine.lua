return {
  {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }, -- Para ícones opcionais
    
    config = function()
      require('lualine').setup({
        options = {
          theme = 'dracula', -- Escolha o tema (use 'dracula' ou outro se preferir)
          section_separators = {'', ''}, -- Separadores das seções
          component_separators = {'', ''}, -- Separadores dos componentes
          icons_enabled = true, -- Usar ícones se disponíveis
        },
        sections = {
          lualine_a = {'mode'},
          lualine_b = {'branch', 'diff', 'diagnostics'},
          lualine_c = {'filename'},
          lualine_x = {'encoding', 'fileformat', 'filetype'},
          lualine_y = {'progress'},
          lualine_z = {'location'}
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {'filename'},
          lualine_x = {'location'},
          lualine_y = {},
          lualine_z = {}
        },
        tabline = {},
        extensions = {'fugitive', 'nerdtree'} -- Adicionar extensões para suporte a plugins específicos
      })
    end
  }
}
