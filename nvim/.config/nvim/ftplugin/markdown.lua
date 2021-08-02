require('note.markdown')
require('note.markdown_vimwiki')

vim.b.coc_pairs_disabled = { '<' }

-- disable mapping for ge
vim.api.nvim_buf_del_keymap(0, 'n', 'ge')
vim.api.nvim_buf_del_keymap(0, 'v', 'ge')

local success, wk = pcall(require, 'which-key')
if not success then
  return
end

wk.register({
  ['<leader>cL'] = { "<cmd>lua require('xx.toggles').toggle_left_equation()<cr>", 'Toggle left equation' },
  ['<leader>op'] = { '<cmd>MarkdownPreview<cr>', 'Open markdown preview' },
  ['[h'] = { '<Plug>Markdown_MoveToCurHeader', 'Move to current header' }
}, { buffer = vim.api.nvim_get_current_buf() })

wk.register({
  b = { '****<space><++><esc>F*hi', 'Bold' },
  d = { '~~~~<space><++><esc>F~hi', 'Delete' },
  i = { '**<space><++><esc>F*i', 'Italic' },
  C = { '```<cr>```<esc>ka', 'Code' },
  p = { '![](<++>)<space><++><esc>F[a', 'Picture' },
  a = { '[](<++>)<space><++><esc>F[a', 'Link' },
  r = { '##<space>Reference<cr><esc>', 'Reference' },
  M = { '$$<cr>$$<esc>O', 'Math block' },
  ['1'] = { '#<space>', 'Header 1' },
  ['2'] = { '##<space>', 'Header 2' },
  ['3'] = { '###<space>', 'Header 3' },
  ['4'] = { '####<space>', 'Header 4' },
}, { mode = 'i', prefix = ';', buffer = vim.api.nvim_get_current_buf() })
