return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        filtered_items = {
          visible = true, -- Exibe arquivos ocultos
          hide_dotfiles = false, -- Não oculta arquivos que começam com ponto
          hide_gitignored = false, -- Não oculta arquivos ignorados pelo git
          hide_by_name = {
            --"node_modules", -- Adicione nomes de diretórios aqui para ocultá-los, se necessário
          },
          never_show = {
            --"some_file_name", -- Adicione nomes de arquivos aqui para nunca exibi-los, se necessário
          },
        },
        follow_current_file = true, -- Focaliza o arquivo aberto na árvore
        group_empty_dirs = false, -- Não agrupa diretórios vazios
      },
    },
  },
}