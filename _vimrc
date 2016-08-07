set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'L9'
Plugin 'Valloric/YouCompleteMe'
Plugin 'rust-lang/rust.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'Lokaltog/vim-powerline'
Plugin 'Townk/vim-autoclose'
Plugin 'majutsushi/tagbar'
"Plugin 'SirVer/ultisnips'
Plugin 'tpope/vim-commentary'
Plugin 'scrooloose/syntastic'
Plugin 'vim-scripts/bufexplorer.zip'
Plugin 'magic-dot-files/TagHighlight'
Plugin 'vim-scripts/javacomplete'
Plugin 'altercation/vim-colors-solarized'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'Lokaltog/vim-easymotion'
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
"autocmd BufWritePost $MYVIMRC source $MYVIMRC
set ruler
set cursorline
"set cursorcolumn
set hlsearch
if has("gui_running")
	set background=light
else
	set background=dark
endif
colorscheme solarized
set gcr=a:block-blinkon0


nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_confirm_extra_conf=0
let g:ycm_key_invoke_completion='<C-a>'
let g:ycm_rust_src_path='/Volumes/Second/Source/rust/src'

let g:ycm_python_binary_path = 'python'

""NERDTRee
autocmd vimenter * NERDTree
autocmd bufenter * if (winnr("$") == 1 &&  exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <F2> :NERDTreeToggle<CR>

let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

""powerline
set laststatus=2
set t_Co=256   
set encoding=utf-8  
"set fillchars+=stl:\ ,stlnc:\
let g:Powerline_colorscheme="solarized256"

""tagbar
nmap <F8> :TagbarToggle<CR>

"let g:indent_guides_enable_on_vim_startup=1
"let g:indent_guides_start_level=2
"let g:indent_guides_guide_size=1

":nmap <silent> <Leader>i <Plug>IndentGuidesToggle

set foldmethod=syntax
set nofoldenable
