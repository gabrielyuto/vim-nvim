return {
  {
    'neovim/nvim-lspconfig',

    dependencies = {
      'mfussenegger/nvim-jdtls',
    },

    config = function()
      local jdtls = require('jdtls')

      local home = os.getenv('HOME')
      local workspace_dir = home .. "/workspace/" .. vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")

      -- Configuração básica do jdtls
      local config = {
        cmd = {
          '/usr/local/opt/openjdk/bin/java',  -- ou simplesmente 'java' se estiver no PATH
          '-Declipse.application=org.eclipse.jdt.ls.core.id1',
          '-Dosgi.bundles.defaultStartLevel=4',
          '-Declipse.product=org.eclipse.jdt.ls.core.product',
          '-Dlog.protocol=true',
          '-Dlog.level=ALL',
          '-Xms1g',
          '--add-modules=ALL-SYSTEM',
          '--add-opens', 'java.base/java.util=ALL-UNNAMED',
          '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
          '-jar', '/usr/local/opt/jdtls/libexec/plugins/org.eclipse.equinox.launcher_1.6.900.v20240613-2009.jar',  -- Certifique-se de verificar a versão correta
          '-configuration', '/usr/local/opt/jdtls/libexec/config_mac',  -- Use config_linux para Linux
          '-data', workspace_dir
        },
        root_dir = require('jdtls.setup').find_root({'.git', 'mvnw', 'gradlew', 'pom.xml', 'build.gradle'}),
        settings = {
          java = {
            eclipse = {
              downloadSources = true,
            },
            configuration = {
              updateBuildConfiguration = "interactive"
            },
            maven = {
              downloadSources = true,
            },
            implementationsCodeLens = {
              enabled = true
            },
            referencesCodeLens = {
              enabled = true
            },
            references = {
              includeDecompiledSources = true
            },
            format = {
              enabled = true
            },
            inlayHints = {
              parameterNames = {
                enabled = "all"
              }
            }
          }
        },
        init_options = {
          extendedClientCapabilities = {     
            resolveAdditionalTextEditsSupport = false,
          },
          bundles = {},
          autostart = true,
        }
      }

      -- Auto comando para iniciar o jdtls ao abrir um arquivo Java
      vim.api.nvim_create_autocmd({"FileType"}, {
          pattern = {"java"},
          callback = function()
              jdtls.start_or_attach(config)
          end,
      })
    end
  }
}

-- cmd = { '/usr/local/opt/jdtls/bin' },