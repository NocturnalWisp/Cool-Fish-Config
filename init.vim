syntax enable
filetype plugin indent on

" alge
let g:ale_disable_lsp = 1

" rust
let g:rustfmt_emit_files = 1
let g:rustfmt_fail_silently = 0
let g:rainbow_active = 1
let g:gitgutter_terminal_reports_focus=0
let g:termdebugger="rust-gdb"
let g:rooter_patterns = ['.git', 'Makefile', 'package.json']

let g:ag_working_path_mode="r"

let g:winresizer_start_key = '<A-r>'

call plug#begin('C:\Users\helmt\AppData\Local\nvim\autoload\plugged')

Plug 'OmniSharp/omnisharp-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'rust-lang/rust.vim'

Plug 'ryanoasis/vim-devicons'
Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}

Plug 'dense-analysis/ale'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'https://tpope.io/vim/fugitive.git'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'https://github.com/airblade/vim-gitgutter.git'

Plug 'EdenEast/nightfox.nvim'

" Plug 'mhinz/vim-startify'
Plug 'frazrepo/vim-rainbow'
Plug 'https://tpope.io/vim/commentary.git'
Plug 'karb94/neoscroll.nvim'
Plug 'https://tpope.io/vim/surround.git'

Plug 'anuvyklack/pretty-fold.nvim'
Plug 'anuvyklack/nvim-keymap-amend'

Plug 'cohama/agit.vim'
Plug 'airblade/vim-rooter'
Plug 'simeji/winresizer'

Plug 'Lenovsky/nuake'

call plug#end()

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" For remembering folds
augroup SaveManualFolds
    autocmd!
    au BufWinLeave, BufLeave ?* silent! mkview
    au BufWinEnter           ?* silent! loadview
augroup END

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-codeaction)
nmap ghp <Plug>(GitGutterPreviewHunk)

nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

nmap <A-F> ;Ag<cr>
nmap <F1> ;CHADopen<CR>
" nmap <F2> ;below 20sp <CR> \| ;term<CR> \| <Esc>i
nmap <C-P> ;GFiles<CR>
nnoremap <C-a-c> ;source C:/Users/helmt/AppData/Local/nvim/init.vim<cr>
:imap jj <Esc>
:colorscheme nightfox

nnoremap <F2> :Nuake<CR>
inoremap <F2> :Nuake<CR>
tnoremap <F2> <C-\><C-n>

set number
set relativenumber
set tabstop=4
set shiftwidth=4
set expandtab
set hidden
set autoread
set clipboard=unnamedplus

let g:chadtree_settings = { 'theme.icon_glyph_set': "devicons" }

lua require('neoscroll').setup()
lua require('pretty-fold').setup()

let g:ale_linters = {
\ 'cs': ['OmniSharp']
\}
