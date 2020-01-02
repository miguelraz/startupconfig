filetype plugin indent on
set undofile "Maintain undo history between sessions!
set undodir=~/.vim/undodir
syntax on

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'lervag/vimtex'

let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0

Plug 'KeitaNakamura/tex-conceal.vim'
set conceallevel=2
let g:tex_conceal='abdmg'

" LLDB IDE!
Plug 'dbgx/lldb.nvim'



inoremap <C-f> <Esc>: silent exec '.!inkscape-figures create "'.getline('.').'" "'.b:vimtex.root.'/figures/"'<CR><CR>:w<CR>
nnoremap <C-f> : silent exec '!inkscape-figures edit "'.b:vimtex.root.'/figures/" > /dev/null 2>&1 &'<CR><CR>:redraw!<CR>

Plug 'sirver/ultisnips'
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
let g:UltiSnipsEditSplit= 'vertical'

Plug 'dhruvasagar/vim-table-mode'
Plug 'JuliaEditorSupport/julia-vim'
Plug 'itchyny/vim-gitbranch'
Plug 'rust-lang/rust.vim'
Plug 'rust-lang/rust.vim'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'racer-rust/vim-racer'

if executable('rls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'rls',
        \ 'cmd': {server_info->['rustup', 'run', 'nightly', 'rls']},
        \ 'whitelist': ['rust'],
        \ })
endif

" experimental vim setup from Discord
let g:ale_linters= {'c': ['clang','clangd','clangtidy'],'cpp': ['clang','clangd','clangtidy'], 'rust': ['rls']}
let g:ale_fixers= {'*':['remove_trailing_lines', 'trim_whitespace'],'c': ['clang-format'],'cpp': ['clang-format'], 'rust':['rustfmt'],'go':['gofmt']}
let g:ale_cpp_clang_options= '-std=c++17'
let g:ale_c_parse_compile_commands=1
let g:ale_cpp_parse_compile_commands=1
let g:ale_linters_explicit=1
let g:ale_fixers_explicit=1

let g:ale_lint_on_text_changed=0
let g:ale_lint_on_insert_leave=1
let g:ale_lint_on_enter=1
let g:ale_lint_on_save=1
let g:ale_lint_on_filetype_changed=0
let g:ale_completion_enabled = 1
" experiment ends here

Plug 'junegunn/vim-emoji'
set completefunc=emoji#complete

Plug 'skanehira/translate.vim'
let g:translate_source = "de"
let g:translate_target = "en"

Plug 'JuliaEditorSupport/julia-vim' 
Plug 'majutsushi/tagbar' 
Plug 'ctrlpvim/ctrlp.vim'  
 
set tags=./tags,./TAGS,tags,TAGS,~/pkg/src/julia/julia/tags 
 
nmap <F8> :TagbarToggle<CR> 

Plug 'joshdick/onedark.vim'
let g:onedark_termcolors=24
let g:colorscheme = 'onedark'

Plug 'leanprover/lean.vim'

" let g:ale_completion_enabled=1
Plug 'dense-analysis/ale'
set omnifunc=ale#completion#OmniFunc
let b:ale_linters = {
\ 'rust': [ 'cargo', 'rls', 'rustc', 'clippy', 'rustfmt' ]
\ }

let g:ale_linters_explicit = 1
let g:ale_fixers=['prettier', 'remove_trailing_lines', 'trim_whitespace', 'eslint', 'rustfmt']
let g:ale_fix_on_save=1
let g:ale_sign_column_always=0
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
let g:airline#extensions#ale#enabled=1
nmap <F7> <Plug>(ale_fix)
nmap <silent> <leader>je :ALENext<cr>
nmap <silent> <leader>ke :ALEPrevious<cr>
" Plug 'ycm-core/YouCompleteMe'

" MPI
Plug 'jiangxincode/mpi.vim'
Plug 'jiangxincode/TagCollection'
Plug 'vim-scripts/OmniCppComplete'
Plug 'https://github.com/adelarsq/vim-matchit'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
let g:airline_theme='onedark'
" air-line
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

runtime macros/matchit.vim

call plug#end()

setlocal spell
set spelllang=en_us,es
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
inoremap <Leader>fb :call julia#toggle_function_blockassign()<CR>

set rnu nu
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
colorscheme onedark
