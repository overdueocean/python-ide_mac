" .vimrc file modified by Dan Sheffner

" Lots of credit to:
" Sample .vimrc file by Martin Brochhaus
" Presented at PyCon APAC 2012
"
runtime ~/.vim/bundle/pathogen/autoload/pathogen.vim

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" map ctrl n to line numbers
:nmap <C-N><C-N> :set invnumber<CR>

" Mouse and backspace
" set mouse=a " on OSX press ALT and click
set bs=2 " make backspace behave like normal again

" Rebind <Leader> key
" I like to have it here becuase it is easier to reach than the default and
" it is next to ``m`` and ``n`` which I use for navigating between tabs.
let mapleader = ","

"Try to disable arrow keys for navigation
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>



"Snippets variables
"------------------ 
let g:snips_author='OverDueOcean'
let g:author='OverDueOcean'
let g:snips_email='overdueocean@gmail.com'
let g:email='overdueocean@gmail.com'
let g:snips_github='https://github.com/overdueocean'
let g:github='https://github.com/overdueocean'


" Plasticboy/Vim-markdown
" "-------------------------
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_folding_style_pythonic = 1

let g:vim_markdown_folding_level = 6

let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_emphasis_multiline = 0

set conceallevel=2
let g:vim_markdown_fenced_languages = ['csharp=cs']
let g:vim_markdown_math = 1
let g:vim_markdown_frontmatter = 1
""-------------------------


" Bind nohl
" Removes highlight of your last search
" ``<C>`` stands for ``CTRL`` and therefore ``<C-n>`` stands for ``CTRL+n``
nmap <silent> ./ :nohlsearch<CR>
noremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>
inoremap <C-n> :nohl<CR>

" Quicksave command
noremap <C-Z> :update<CR>
vnoremap <C-Z> <C-C>:update<CR>
inoremap <C-Z> <C-O>:update<CR>

" Quick quit command
noremap <Leader>e :quit<CR> " Quit current window
noremap <Leader>E :qa!<CR> " Quit all windows

" bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w + <movement>
" Every unnecessary keystroke that can be saved is good for your health :)
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" easier moving between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>

" map sort function to a key
vnoremap <Leader>s :sort<CR>

" easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
vnoremap < <gv " better indentation
vnoremap > >gv " better indentation

" Show whitespace
" MUST be inserted BEFORE the colorscheme command
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/

" Color scheme
" mkdir -p ~/.vim/colors && cd ~/.vim/colors
" wget -O wombat256mod.vim http://www.vim.org/scripts/download_script.php?src_id=13400
set t_Co=256
color wombat256mod

" Enable syntax highlighting
" You need to reload this file for the change to apply
"

" Pathogen load
filetype off

call pathogen#infect()
call pathogen#helptags()

filetype plugin indent on
syntax on

set nocompatible
set nocp

" Showing line numbers and length
set number " show line numbers
set tw=79 " width of document (used by gd)
set nowrap " don't automatically wrap on load
set fo-=t " don't automatically wrap text when typing
set colorcolumn=80
highlight ColorColumn ctermbg=233


" easier formatting of paragraphs
vmap Q gq
nmap Q gqap

" Useful settings
set history=700
set undolevels=700

"==============================================
" Added Recently from RealPython.com article.:
"==============================================

" For full stack development,use another au command for each filetype:

"Need to fix the following sysntax :
"au BufNewFile,BufRead *.py
"    \ set tabstop=4
"    \ set softtabstop=4
"    \ set shiftwidth=4
"    \ set textwidth=79
"    \ set expandtab
"    \ set autoindent
"    \ set fileformat=unix

" Flagging Unnecessary Whitespace
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" UTF-8 Support
set encoding=utf-8

" Real programmers don't use TABs but spaces
set softtabstop=4
set shiftwidth=4
set shiftround
set tabstop=4
set expandtab

" Added - 3 following Settings for PEP8
set textwidth=79
"set autoindent
set fileformat=unix


" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase

" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
set nobackup
set nowritebackup
set noswapfile

" Settings - block of code comment/uncomment with just Shift+v
"vnoremap <silent> # :s/^/#/<cr>:noh<cr>
"vnoremap <silent> -# :s/^#//<cr>:noh<cr>


" Setup Pathogen to manage your plugins
" mkdir -p ~/.vim/autoload ~/.vim/bundle
" curl -so ~/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/HEAD/autoload/pathogen.vim
" Now you can install any plugin into a .vim/bundle/plugin-name/ folder

" ============================================================================
" Python IDE Setup
" ============================================================================

" Settings for vim-powerline
" cd ~/.vim/bundle
" git clone git://github.com/Lokaltog/vim-powerline.git
set laststatus=2

" Settings for ctrlp
" cd ~/.vim/bundle
" git clone https://github.com/kien/ctrlp.vim.git
let g:ctrlp_max_height = 30
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*

" Settings for -- nvie/vim-flake8
"autocmd BufWritePost *.py call flake8()
"autocmd BufWritePost *.py call flake8#Flake8()

" Settings for the dense-analysis/ale
let g:ale_linters = {'python': ['flake8']} 
"
"disable virtual text appearing at ends of lines?
"let g:ale_virtualtext_cursor = 'current'
"
"disable virtual text completely, apply the following.
let g:ale_virtualtext_cursor = 'disabled'

" Settings for the davidhalter/jedi-vim 
"let g:jedi#environment_path = "/usr/local//bin/python"
"let g:jedi#completion_command = "<C-n>"
"let g:jedi#popup_on_dot = 0
"let g:jedi#use_tabs_not_buffers = 1
"let g:jedi#usages_command = "<leader>n"
"let g:jedi#goto_command = "<leader>d"
"let g:jedi#show_call_signatures_definition = 0

" Support for YCM
"let g:ycm_autoclose_preview_window_after_completion=1
"map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>


" Settings for python-mode
" cd ~/.vim/bundle
" git clone https://github.com/klen/python-mode
 "map <Leader>g :call RopeGotoDefinition()<CR>
 "let ropevim_enable_shortcuts = 1
""
"" Added following line to see if rope is working.
 "let g:pymode_rope_autoimport=1
"" ------------------------------

 "let g:pymode_rope_goto_def_newwin = "vnew"
 "let g:pymode_rope_extended_complete = 1
 "let g:pymode_breakpoint = 0
 "let g:pymode_syntax = 1
 "let g:pymode_syntax_builtin_objs = 0
 "let g:pymode_syntax_builtin_funcs = 0
 "let g:pymode_rope_lookup_project = 0

" --------------------------------------------------------
"  Added new python-mode repo on 20th June 2021 & delete old
" ---------------------------------------------------------
"  https://github.com/python-mode/python-mode
"  git clone --recurse-submodules https://github.com/python-mode/python-mode.git
"
map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

" Better navigating through omnicomplete option list
" See http://stackoverflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim
set completeopt=longest,menuone
function! OmniPopup(action)
  if pumvisible()
    if a:action == 'j'
      return "\<C-N>"
    elseif a:action == 'k'
      return "\<C-P>"
    endif
  endif
  return a:action
endfunction

inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>

" Python folding
" mkdir -p ~/.vim/ftplugin
" wget -O ~/.vim/ftplugin/python_editing.vim http://www.vim.org/scripts/download_script.php?src_id=5492
set nofoldenable

" Neocomplete
" let g:neocomplete#enable_at_startup = 1
"
set wildmenu
set wildmode=list:longest,full


"Checking yanking on macos
"
"set clipboard=
"set clipboard=unnamedplus
set clipboard^=unnamed,unnamedplus

" load up the nerd tree
"autocmd vimenter * NERDTree

" Map NerdTree  to Toggle on Ctrl+n
map <C-n> :NERDTreeToggle<CR>
map <Leader>t <plug>NERDTreeTabsToggle<CR>

" move nerdtree to the right
let g:NERDTreeWinPos = "right"
" " move to the first buffer
autocmd VimEnter * wincmd p

" paste toggle
set pastetoggle=<F2>

"Run The Python Script within Vim added by OverDueocean
"nnoremap <buffer> <F9> :exec '!python' shellescape(@%, 1)<cr>
nnoremap <silent> <F5> :!clear;python %<CR>


" turn off auto complete
" let g:pymode_rope_completion = 0
" let g:pymode_rope_complete_on_dot = 0
