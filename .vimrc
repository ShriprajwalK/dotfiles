set nocompatible  " be iMproved, required, makes it incompatible with vim. needed for vundle

set shortmess+=I "Disable vim startup message
set shell=/bin/bash
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Plugin 'L9'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

Plugin 'mattn/emmet-vim'  " html and css autocompletion

Plugin 'ycm-core/YouCompleteMe'  " autocomplete

Plugin 'python-mode/python-mode'  " makes python cool
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'mileszs/ack.vim'

Plugin 'preservim/nerdtree'  "file manager

Plugin 'vimwiki/vimwiki'
Plugin 'godlygeek/tabular'  " for vim-markdown
Plugin 'plasticboy/vim-markdown'
Plugin 'jtratner/vim-flavored-markdown' " Github flavored markdown(gfm) extension to vim-markdown
Plugin 'suan/vim-instant-markdown', {'rtp': 'after'} " for .md to .html. Mainly for vimwiki

Plugin 'easymotion/vim-easymotion'
Plugin 'JuliaEditorSupport/julia-vim'  " for julia

Plugin 'tpope/vim-surround' " replacing and inserting brackets, among other stuff
Plugin 'tpope/vim-repeat' " making . work for tpope plugins
Plugin 'tpope/vim-fugitive' " git plugin for vim/ vim plugin for git.
Plugin 'tpope/vim-commentary' " commenting stuff out in vim. tpope is a beast.
Plugin 'tpope/vim-unimpaired' " shortcuts for adding blank lines above/below the current line or exchanging them etcetra

Plugin 'flazz/vim-colorschemes' "cool colorschemes

Plugin 'doums/coBra' " Manages brackets. No need for () on ( keybindings anymore

Plugin 'itchyny/lightline.vim' " makes statusbar cool
Plugin 'itchyny/landscape.vim' " cool colorscheme
" All of your Plugins must be added before the following line
call vundle#end()            " required
" filetype plugin indent on    " required
"
" commented plugin indent on to solve the python indenting issue
"
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


imap jk <ESC>
filetype plugin indent on
syntax on
set encoding=utf-8
set clipboard=unnamedplus " Makes copy pasting right.


set number
set relativenumber
set ts=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
set cursorline
set showmatch
set modeline
set background=dark
let python_highlight_all = 1
im :<CR> :<CR><TAB>
autocmd BufWritePre *.py normal m`:%s/\s\+$//e ``

colorscheme molokai " landscape/elflord looks better than molokai?
set showcmd
set cursorline
set wildmenu
set lazyredraw
set incsearch
set hlsearch
set foldenable
set foldlevelstart=10
set foldnestmax=10
nnoremap <space> za
set foldmethod=indent

set laststatus=2 " for lightline
let g:lightline = {
      \ 'colorscheme': 'one',
      \ } " landscape colorscheme for lightline


" Put () when you type (
":inoremap ( ()<Esc>i
"":inoremap { {}<Esc>i Now that there's the coBra plugin, there should not be
"":inoremap [ []<Esc>i any need for these keybindings.
"":inoremap ' ''<Esc>i
"":inoremap " ""<Esc>i
""

nnoremap gV `[v`]
" Super undo of sorts. In vim, undos are a tree. Lets you view tree
nnoremap <F5> :GundoToggle<CR>

"emmet
let g:user_emmet_leader_key=',' " to use emmet's completion by typing ,,

"vimwiki
let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}] " for vimwiki to use .wiki as the extension but markdown syntax

"Instant markdown plugin
let g:instant_markdown_autostart = 0 " To prevent autostart
map <leader>md :InstantMarkdownPreview<CR>

" allows cursor change in tmux mode
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

filetype plugin on " for vimwiki
syntax on "for vimwiki
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

" disabiling arrow keys
nmap <down> <Nop> 
imap <down> <Nop>
nmap <up> <Nop>
imap <up> <Nop>
nmap <right> <Nop>
imap <right> <Nop>
nmap <left> <Nop>
imap <left> <Nop>

let mapleader = ","

" to auto centre things
nmap G Gzz
nmap n nzz
nmap N Nzz


" Clear highlighting on escape in normal mode
nnoremap <esc> :noh<return><esc>
nnoremap <esc>^[ <esc>^["

" NERDTree
map <C-n> :NERDTreeToggle<CR>

" Navigating splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" make is fussy about tabs.
autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab

" The scratch aka preview window that ycm sometimes opens is annoying.
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
