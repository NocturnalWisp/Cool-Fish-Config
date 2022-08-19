syntax enable
filetype plugin indent on

" alge
let g:ale_disable_lsp = 1

" rust
nnoremap <SPACE> <Nop>
nnoremap <tab> <Nop>
let mapleader=" "
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

Plug 'ryanoasis/vim-devicons'
Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}

Plug 'dense-analysis/ale'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'https://github.com/airblade/vim-gitgutter.git'

Plug 'EdenEast/nightfox.nvim'

" Plug 'mhinz/vim-startify'
Plug 'frazrepo/vim-rainbow'
Plug 'https://tpope.io/vim/commentary.git'
Plug 'karb94/neoscroll.nvim'

Plug 'anuvyklack/nvim-keymap-amend'

Plug 'airblade/vim-rooter'
Plug 'simeji/winresizer'

Plug 'Lenovsky/nuake'

call plug#end()

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
inoremap <silent><expr> <C-x><C-z> coc#pum#visible() ? coc#pum#stop() : "\<C-x>\<C-z>"
    " remap for complete to use tab and <cr>
    inoremap <silent><expr> <TAB>
        \ coc#pum#visible() ? coc#pum#next(1):
        \ <SID>check_back_space() ? "\<Tab>" :
        \ coc#refresh()
    inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
    inoremap <silent><expr> <c-space> coc#refresh()

    hi CocSearch ctermfg=12 guifg=#18A3FF
    hi CocMenuSel ctermbg=109 guibg=#13354A

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

nmap <F1> ;CHADopen<CR>
" nmap <F2> ;below 20sp <CR> \| ;term<CR> \| <Esc>i
nnoremap <C-a-c> ;source C:/Users/helmt/AppData/Local/nvim/init.vim<cr>
:imap jj <Esc>
:colorscheme nightfox

nnoremap <F2> :Nuake<CR>
inoremap <F2> :Nuake<CR>
tnoremap <F2> <C-\><C-n>

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

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

let g:ale_linters = {
\ 'cs': ['OmniSharp']
\}
