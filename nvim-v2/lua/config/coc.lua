-- COC (Conquer of Completion) """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vim.g.coc_global_extensions = {
  'coc-tsserver',   -- Suporte para TypeScript/JavaScript
  'coc-json',       -- Suporte para JSON
  'coc-html',       -- Suporte para HTML
  'coc-css',        -- Suporte para CSS
  'coc-pyright',    -- Suporte para Python
  'coc-snippets',   -- Snippets
  'coc-explorer',   -- Explorer
  'coc-yaml',       -- Suporte yaml
  -- 'coc-java',       -- Suporte para Java
  -- 'coc-java-debug'
}

vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.updatetime = 300
vim.opt.signcolumn = "yes"

function _G.check_back_space()
  local col = vim.fn.col('.') - 1
  return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

function _G.show_docs() -- Use K to show documentation in preview window
  local cw = vim.fn.expand('<cword>')
  if vim.fn.index({'vim', 'help'}, vim.bo.filetype) >= 0 then
      vim.api.nvim_command('h ' .. cw)
  elseif vim.api.nvim_eval('coc#rpc#ready()') then
      vim.fn.CocActionAsync('doHover')
  else
      vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
  end
end

local keyset = vim.keymap.set
local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}
local opts1 = {silent = true, nowait = true, expr = true}
local opts2 = {silent = true, nowait = true}

keyset("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
keyset("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)
keyset("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)
keyset("i", "<c-j>", "<Plug>(coc-snippets-expand-jump)") -- Use <c-j> to trigger snippets
keyset("i", "<c-space>", "coc#refresh()", {silent = true, expr = true}) -- Use <c-space> to trigger completion
keyset("i", "<C-f>", 'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(1)<cr>" : "<Right>"', opts1)
keyset("i", "<C-b>", 'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(0)<cr>" : "<Left>"', opts1)


keyset("n", "[g", "<Plug>(coc-diagnostic-prev)", {silent = true}) -- Use `[g` and `]g` to navigate diagnostics. Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
keyset("n", "]g", "<Plug>(coc-diagnostic-next)", {silent = true})
keyset("n", "gd", "<Plug>(coc-definition)", {silent = true}) -- GoTo code navigation
keyset("n", "gy", "<Plug>(coc-type-definition)", {silent = true})
keyset("n", "gi", "<Plug>(coc-implementation)", {silent = true})
keyset("n", "gr", "<Plug>(coc-references)", {silent = true})
keyset("n", "K", '<CMD>lua _G.show_docs()<CR>', {silent = true})
keyset("n", "<C-f>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', opts1)
keyset("n", "<C-b>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', opts1)
keyset("n", "<C-s>", "<Plug>(coc-range-select)", {silent = true})  -- Use CTRL-S for selections ranges

--keyset("n", "<leader>rn", "<Plug>(coc-rename)", {silent = true})  -- Symbol renaming
--keyset("n", "<leader>f", "<Plug>(coc-format-selected)", {silent = true})
--keyset("n", "<leader>a", "<Plug>(coc-codeaction-selected)", opts2)
--keyset("n", "<leader>ac", "<Plug>(coc-codeaction-cursor)", opts2) -- Remap keys for apply code actions at the cursor position.
--keyset("n", "<leader>as", "<Plug>(coc-codeaction-source)", opts2) -- Remap keys for apply source code actions for current file.
--keyset("n", "<leader>qf", "<Plug>(coc-fix-current)", opts2) -- Apply the most preferred quickfix action on the current line.
--keyset("n", "<leader>re", "<Plug>(coc-codeaction-refactor)", { silent = true }) -- Remap keys for apply refactor code actions.
--keyset("n", "<leader>r", "<Plug>(coc-codeaction-refactor-selected)", { silent = true })
--keyset("n", "<leader>cl", "<Plug>(coc-codelens-action)", opts) -- Run the Code Lens actions on the current line

keyset("x", "<leader>f", "<Plug>(coc-format-selected)", {silent = true}) -- Formatting selected code
keyset("x", "<leader>a", "<Plug>(coc-codeaction-selected)", opts2)
keyset("x", "<leader>r", "<Plug>(coc-codeaction-refactor-selected)", { silent = true })
keyset("x", "if", "<Plug>(coc-funcobj-i)", opts2)  -- Map function and class text objects
keyset("x", "af", "<Plug>(coc-funcobj-a)", opts2)
keyset("x", "ic", "<Plug>(coc-classobj-i)", opts2)
keyset("x", "ac", "<Plug>(coc-classobj-a)", opts2)

keyset("o", "if", "<Plug>(coc-funcobj-i)", opts2)
keyset("o", "af", "<Plug>(coc-funcobj-a)", opts2)
keyset("o", "ic", "<Plug>(coc-classobj-i)", opts2)
keyset("o", "ac", "<Plug>(coc-classobj-a)", opts2)

---@diagnostic disable-next-line: redefined-local
--keyset("n", "<space>a", ":<C-u>CocList diagnostics<cr>", opts2) -- Show all diagnostics
--keyset("n", "<space>e", ":<C-u>CocList extensions<cr>", opts2) -- Manage extensions
--keyset("n", "<space>c", ":<C-u>CocList commands<cr>", opts2) -- Show commands
--keyset("n", "<space>o", ":<C-u>CocList outline<cr>", opts2) -- Find symbol of current document
--keyset("n", "<space>s", ":<C-u>CocList -I symbols<cr>", opts2) -- Search workspace symbols
--keyset("n", "<space>j", ":<C-u>CocNext<cr>", opts2) -- Do default action for next item
--keyset("n", "<space>k", ":<C-u>CocPrev<cr>", opts2) -- Do default action for previous item
--keyset("n", "<space>p", ":<C-u>CocListResume<cr>", opts2) -- Resume latest coc list


keyset("v", "<C-f>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', opts1)
keyset("v", "<C-b>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', opts1)

keyset("x", "<C-s>", "<Plug>(coc-range-select)", {silent = true})


vim.api.nvim_create_augroup("CocGroup", {})  -- Highlight the symbol and its references on a CursorHold event(cursor is idle)
vim.api.nvim_create_autocmd("CursorHold", {
    group = "CocGroup",
    command = "silent call CocActionAsync('highlight')",
    desc = "Highlight symbol under cursor on CursorHold"
})

vim.api.nvim_create_autocmd("FileType", { -- Setup formatexpr specified filetype(s)
    group = "CocGroup",
    pattern = "typescript,json",
    command = "setl formatexpr=CocAction('formatSelected')",
    desc = "Setup formatexpr specified filetype(s)."
})

vim.api.nvim_create_autocmd("User", { -- Update signature help on jump placeholder
    group = "CocGroup",
    pattern = "CocJumpPlaceholder",
    command = "call CocActionAsync('showSignatureHelp')",
    desc = "Update signature help on jump placeholder"
})

-- Mapeamento do <TAB> no modo Insert
vim.api.nvim_set_keymap('i', '<TAB>',
     'coc#pum#visible() ? coc#_select_confirm() : ' ..
     'coc#expandableOrJumpable() ? "<C-r>=coc#rpc#request(\'doKeymap\', [\'snippets-expand-jump\',\'\'])<CR>" : ' ..
     'v:lua.check_back_space() ? "<TAB>" : coc#refresh()',
     { noremap = true, silent = true, expr = true })

vim.api.nvim_create_user_command("Format", "call CocAction('format')", {}) -- Add `:Format` command to format current buffer
vim.api.nvim_create_user_command("Fold", "call CocAction('fold', <f-args>)", {nargs = '?'}) -- " Add `:Fold` command to fold current buffer
vim.api.nvim_create_user_command("OR", "call CocActionAsync('runCommand', 'editor.action.organizeImport')", {}) -- Add `:OR` command for organize imports of the current buffer
vim.opt.statusline:prepend("%{coc#status()}%{get(b:,'coc_current_function','')}")  -- Add (Neo)Vim's native statusline support

-- Coc-Snippets """""""""""""""""""""""""""""""""""""""""""""""""""""
-- Definir o <TAB> como tecla para avançar para o próximo snippet
vim.g.coc_snippet_next = '<tab>'
vim.g.coc_snippet_next = '<c-j>' -- Use <C-j> para pular para o próximo placeholder (padrão do coc.nvim)
vim.g.coc_snippet_prev = '<c-k>' -- Use <C-k> para pular para o placeholder anterior (padrão do coc.nvim)


-- Coc Explorer  """"""""""""""""""""""""""""""""""""""""""""""""""""
vim.g.coc_explorer_global_presets = {
  ['.vim'] = {
    ['root-uri'] = '~/.vim',
  },
  ['cocConfig'] = {
    ['root-uri'] = '~/.config/coc',
  },
  ['tab'] = {
    ['position'] = 'tab',
    ['quit-on-open'] = true,
  },
  ['tab:$'] = {
    ['position'] = 'tab:$',
    ['quit-on-open'] = true,
  },
  ['floating'] = {
    ['position'] = 'floating',
    ['open-action-strategy'] = 'sourceWindow',
  },
  ['floatingTop'] = {
    ['position'] = 'floating',
    ['floating-position'] = 'center-top',
    ['open-action-strategy'] = 'sourceWindow',
  },
  ['floatingLeftside'] = {
    ['position'] = 'floating',
    ['floating-position'] = 'left-center',
    ['floating-width'] = 50,
    ['open-action-strategy'] = 'sourceWindow',
  },
  ['floatingRightside'] = {
    ['position'] = 'floating',
    ['floating-position'] = 'right-center',
    ['floating-width'] = 50,
    ['open-action-strategy'] = 'sourceWindow',
  },
  ['simplify'] = {
    ['file-child-template'] = '[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]',
  },
  ['buffer'] = {
    ['sources'] = {{['name'] = 'buffer', ['expand'] = true}},
  },
}

