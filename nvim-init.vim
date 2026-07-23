" Neovim 复用现有 Vim 配置；Markdown 使用 Neovim 原生渲染，不创建 Glow 分屏。
set runtimepath^=~/.vim
source ~/.vim/vimrc
runtime! plugin/**/*.lua

lua << EOF
local ok, render_markdown = pcall(require, 'render-markdown')
if ok then
  render_markdown.setup({
    file_types = { 'markdown' },
    heading = { enabled = true },
    code = { enabled = true },
  })
end

vim.keymap.set('n', '<leader>mp', '<cmd>RenderMarkdown toggle<CR>', { silent = true })
EOF
