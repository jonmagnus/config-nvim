set number

" vim-plug
" Specify a directory for plugins
call plug#begin('~/.local/share/nvim/plugged')

" vim-markdown-composer
function! BuildComposer(info)
  if a:info.status != 'unchanged' || a:info.force
    if has('nvim')
      !cargo build --release
    else
      !cargo build --release --no-default-features --features json-rpc
    endif
  endif
endfunction

Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }
Plug 'dracula/vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-scripts/Conque-GDB'
Plug 'xuhdev/vim-latex-live-preview'
Plug 'lervag/vimtex'

" Initialize plugin system
call plug#end()

" dracula
syntax on
color dracula

" markdown-composer
let g:markdown_composer_external_renderer='pandoc -f markdown -t html'
let g:livepreview_previewer='evince'
let g:livepreview_engine='pdflatex'
let g:spellfile_URL = 'http://ftp.vim.org/vim/runtime/spell'
