set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'L9'
Plugin 'Valloric/YouCompleteMe'
Plugin 'rust-lang/rust.vim'
Plugin 'phildawes/racer'
Plugin 'fatih/vim-go'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'Lokaltog/vim-powerline'
Plugin 'majutsushi/tagbar'
Plugin 'SirVer/ultisnips'
Plugin 'tpope/vim-commentary'
Plugin 'scrooloose/syntastic'
Plugin 'vim-scripts/bufexplorer.zip'
Plugin 'magic-dot-files/TagHighlight'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'vim-scripts/taglist.vim'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'vim-scripts/matchit.zip'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Raimondi/delimitMate'
Plugin 'godlygeek/tabular'
Plugin 'hdima/python-syntax'
Plugin 'vim-scripts/TaskList.vim' "TODO List
"Plugin 'artur-shaik/vim-javacomplete2'
"Plugin 'vim-scripts/javacomplete'
Plugin 'rhysd/vim-clang-format'
Plugin 'kana/vim-operator-user'

call vundle#end()

filetype plugin indent on

set nu
syntax enable
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set incsearch
set ignorecase
set wildmenu


fun! SaveFile()
    exec "w"
endfunc

map <leader>s :call SaveFile()<CR>
imap <leader>s <ESC>:call SaveFile()<CR>
vmap <leader>s <ESC>:call SaveFile()<CR>

":autocmd BufWritePost $MYVIMRC source $MYVIMRC

set ruler
set cursorline
"set cursorcolumn
set hlsearch

if has("gui_running")
	set background=light
    colorscheme solarized
else
	set background=dark
    colorscheme molokai
endif
"colorscheme molokai
let g:rehash256 = 1
let g:molokai_original = 1
let g:solarized_termcolors=256
set gcr=a:block-blinkon0

"multiple file operation
let g:miniBufExplMapWindowNavVim=1
let g:miniBufExplMapWindowNavArrows=1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget =1 
"avoid FileExplorer windows become smaller
let g:miniBufExplForceSynataxEnable = 1
let g:miniBufExplorerMoreThanOne = 2
let g:miniBufExplCycleArround = 1
"set the shortcut for switch buffer
map <S-Tab> :MBEbn<CR>
map <C-S-Tab> :MBEbp<CR>


fun! ToggleFullscreen()
    call system("wmctrl -ir" . v:windowid . "-b toggle,fullscreen")
endfunc

map <silent> <F11> :call ToggleFullscreen()<CR> "fullscreen switch
autocmd VimEnter * call ToggleFullscreen() "enter fullscreen while startup

set completeopt=longest,menu


nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gd :YcmCompleter GoToDeclaration<CR>

let g:EclimCompletionMethod = 'omnifunc'
let g:ycm_collect_identifiers_from_tag_fles=1
let g:ycm_min_num_of_chars_for_completion=2
let g:ycm_cache_omnifunc=0
let g:ycm_seed_identifiers_with_syntax=1
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>

let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '>*'
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_collect_identifiers_from_comments_add_strings=1

let g:ycm_confirm_extra_conf=0
let g:ycm_key_invoke_completion='<C-a>'
if has("mac")
    let g:ycm_rust_src_path='/Users/xiaoxi/Source/rust/src'
elseif has("unix")
    let g:ycm_rust_src_path='/home/xiaoxi/Source/rust/src'
else
    let g:ycm_rust_src_path='E:/Source/rust/src'
endif

autocmd FileType c,cpp,objc ClangFormatAutoEnable

"let g:ycm_rust_racer_path='/home/xiaoxi/.cargo/bin/racer'

"ultisnips
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

"nerdcommenter
let NERDSpaceDelims = 1

set hidden

set guifont=Monaco:h16


if has("mac")
    nmap <silent> <C-k> :wincmd k<CR>
    nmap <silent> <C-j> :wincmd j<CR>
    nmap <silent> <C-h> :wincmd h<CR>
    nmap <silent> <C-l> :wincmd l<CR>
else
    nmap <silent> <C-Up> :wincmd k<CR>
    nmap <silent> <C-Down> :wincmd j<CR>
    nmap <silent> <C-Left> :wincmd h<CR>
    nmap <silent> <C-Right> :wincmd l<CR>
endif

"let g:racer_cmd = "/home/xiaoxi/.cargo/bin/racer"
"let $RUST_SRC_PATH="/home/xiaoxi/Source/rust/src"

"let g:ycm_python_binary_path = 'ipython'

""NERDTRee
let NERDTreeHighlightCursorline=1
let NERDTreeIgnore=['\.pyc$', '\.pyo$','\.git$','\.o$','\.obj$','\.so$','\.svn$','\.hg$']
autocmd vimenter * NERDTree
autocmd bufenter * if (winnr("$") == 1 &&  exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <F2> :NERDTreeToggle<CR>

let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

"Taglist
map <silent> <F7> :Tlist<CR><c-l>

let Tlist_Show_One_File = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_Show_Use_Right_Window = 1
let Tlist_File_Fold_Auto_Close = 1

""powerline
set laststatus=2
set t_Co=256   
set encoding=utf-8  
"set fillchars+=stl:\ ,stlnc:\
let g:Powerline_colorscheme="solarized256"

"tagbar
nmap <F8> :TagbarToggle<CR>
let g:tagbar_autofocus = 1

"ctrlp
let g:ctrlp_map='<leader>ff'
let g:ctrlp_cmd='CtrlP'
map <leader>fp :CtrlPMRU<CR>
let g:ctrlp_working_path_mode = 0
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=15
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrl_follow_symlinks=1


"match parenthese
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 40
let g:rbpt_loadcmd_toggle = 0


let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1

:nmap <silent> <Leader>i <Plug>IndentGuidesToggle

set foldmethod=syntax
set nofoldenable

"auto pair
au FileType python let b:delimitMate_nesting_quotes = ['"']

"code alignment
nmap <leader>bb :Tab /=<CR>
nmap <leader>bn :Tab /

"synatic
let g:syntastic_error_symbol = '✗'  "set error or warning signs
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_check_on_open=1
let g:syntastic_enable_highlighting = 0
"let g:syntastic_python_checker="flake8,pyflakes,pep8,pylint"
let g:syntastic_python_checkers=['pyflakes']
"highlight SyntasticErrorSign guifg=white guibg=black

let g:syntastic_cpp_include_dirs = ['/usr/include/']
let g:syntastic_cpp_remove_include_errors = 1
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = '-std=c++11 -stdlib=libstdc++'
let g:syntastic_enable_balloons = 1 "whether to show balloons

"TaskList
map <leader>td <Plug>TaskList

"multi cursor
let g:multi_cursor_use_default_mapping=0
" Default mapping
let g:multi_cursor_next_key='<C-m>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

"Python syntax highlight
let python_highlight_all = 1

"vim-go

au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)

au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)

au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <Leader>gb <Plug>(go-doc-browser)

au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>e <Plug>(go-rename)

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

let g:go_fmt_command = "goimports"
let g:go_fmt_fail_silently = 1

let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }

