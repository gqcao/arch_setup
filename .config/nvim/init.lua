-- Enable filetype detection, plugins, and indentation
vim.cmd [[
  filetype indent on
  syntax enable
]]

-- Set indentation
vim.opt.autoindent = true

-- Turn on line numbering
vim.opt.number = true

-- Set syntax highlighting
vim.cmd 'syntax on'

-- Case insensitive search
vim.opt.ignorecase = true

-- Highlight search
vim.opt.hlsearch = true

-- Line break (wrap at word boundaries)
vim.opt.linebreak = true

-- For Python files, set extra options via autocmd
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'python',
  callback = function()
    vim.opt_local.expandtab = true
    vim.opt_local.shiftwidth = 4
    vim.opt_local.smarttab = true
    -- Map <F2> to save and run python file
    vim.api.nvim_buf_set_keymap(0, 'n', '<F2>', ':w<bar>!python %<CR>', { noremap = true, silent = true })
  end
})
