set shell=/bin/zsh
set shiftwidth=2
set tabstop=2
set expandtab
set expandtab
set clipboard=unnamed

" インサートからノーマルに移動
inoremap jk <ESC>

" ターミナルのインサートモードを抜ける
:tnoremap <Esc> <C-\><C-n>
" TerminalをVSCodeのように現在のウィンドウの下に開く
command! -nargs=* T split | wincmd j | resize 20 | terminal <args>
" 常にインサートモードでTerminalを開く
autocmd TermOpen * startinsert

call plug#begin()
  Plug 'preservim/nerdtree'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" NERDTree ShortCuts
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>

" git-gutter 
let g:gitgutter_highlight_lines = 1

" coc-solargraphでの補完機能
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

