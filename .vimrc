if has('python3')
    silent! python3 1
endif
set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin('$HOME/.vim/bundle')

Plugin 'VundleVim/Vundle.vim'

" Programming
" git
Plugin 'tpope/vim-fugitive'
"Plugin 'airblade/vim-gitgutter'

" Comment with gcc
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-sensible'

" Automatic closing
Plugin 'Raimondi/delimitMate'
Plugin 'vim-syntastic/syntastic'
Plugin 'Valloric/YouCompleteMe'
Plugin 'sirver/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'kien/rainbow_parentheses.vim'

" Utility
Plugin 'vim-scripts/CmdlineComplete'
Plugin 'tpope/vim-surround'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
"Plugin 'itchyny/lightline.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'junegunn/vim-easy-align'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'sjl/gundo.vim'
Plugin 'VisIncr'
Plugin 'alfredodeza/pytest.vim'
Plugin 'rking/ag.vim'
Plugin 'tmux-plugins/vim-tmux'
Plugin 'tmux-plugins/vim-tmux-focus-events'
Plugin 'edkolev/tmuxline.vim'
Plugin 'nvie/vim-flake8'

" Format
Plugin 'jeffkreeftmeijer/vim-numbertoggle'
"Plugin 'Mark--Karkat'
"Plugin 'FavEx'
"Plugin 'thinca/vim-visualstar'
"Plugin 'tpope/vim-unimpaired'
"Plugin 'itchyny/calendar.vim'
"Plugin 'DrawIt'

" Color Theme
"Plugin 'powerline/fonts'
"Plugin 'pdf/vim-railscasts'
"Plugin 'jpo/vim-railscasts-theme'
"Plugin 'altercation/vim-colors-solarized'

call vundle#end()

" filetype plugin on
syntax enable
filetype plugin indent on

" Basic Setting {
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
" }

" cool settings without plugins {
" 1. Search down into sub-folders
set path+=**
set wildmenu
" 2. Make Tags inner vim
command! MakeTags !ctags -R .
" 3. Don't forget ^x^.
" }
" 4. Tweaks for browsing
let g:netrw_branner=0
let g:netrw_browser_split=4
let g:netrw_altv=1
let g:netrw_liststyle=3
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
set expandtab
set tabpagemax=20
set shiftround
set noshowmode
set mouse-=a
set nowrap
set number
set relativenumber
set ruler
set pastetoggle=<F3>

set cursorline
set cursorcolumn
set colorcolumn=80
set textwidth=80
set hlsearch
set incsearch
set backspace=indent,eol,start
set laststatus=2
set autoindent
set formatoptions=trocq
set noswapfile
set hidden
set complete=k,.,w,b,u,t,i

" Allow saving of files when I forgot to start vim with sudo.
cmap w!! w !sudo tee > /dev/null %

let mapleader=','
" }

" Diff Options {
set diffopt+=algorithm:patience
set diffopt+=indent-heuristic
" }

" Fold {
set foldmethod=indent
set foldnestmax=999
set foldminlines=200
let python_highlight_all = 1
"set foldcolumn=5
" }

" Color {
"colorscheme default
"colorscheme desert256
set background=light
colorscheme evening
hi ColorColumn cterm=None ctermbg=darkred guibg=black
hi CursorColumn cterm=None ctermbg=black guibg=black
hi CursorLine cterm=UnderLine ctermbg=NONE guibg=NONE
hi Normal guibg=NONE ctermbg=NONE
set term=screen-256color
" }

" SpellBad {
setlocal spell spelllang=en_us
hi clear SpellBad
hi SpellBad cterm=underline
" }
"
" Undo {
nnoremap <F5> :GundoToggle<CR>
set undodir=/Users/liuxc/.vim/undo/
set undofile
let g:gundo_width = 60
let g:gundo_preview_height = 40
let g:gundo_right = 1
" }

" airline {
"let g:tmuxline_theme = 'airline_insert'
set encoding=utf-8
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tmuxline#enabled = 0
let g:airline#extensions#tabline#formatter = 'default'
let g:Powerline_symbols='unicode'
"set guifont=DroidSansMono\ Nerd\ Font
" }

" indent_guides {
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree']
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
hi IndentGuidesOdd  ctermbg=gray
hi IndentGuidesEven ctermbg=darkgray
" }

" SyntasticCheck {
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height=5
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1
let g:syntastic_python_checkers = ['flake8', 'pylint']
let g:syntastic_quiet_messages = {
        \ "!level":  "errors",
        \ "type":    "style",
        \ "regex":   '.*',
        \ "file:p":  '.*' }

map <F3> :SyntasticCheck python<CR>
" }

" pylint{
let g:pymode_lint_write = 0       "turn off running pylint on file save
nnoremap <leader>p :PyLint<cr>    "pressing ,p will run plyint on current buffer"
" }

" Flake8{
let g:PyFlakeOnWrite = 1
let g:PyFlakeCheckers = 'pep8,mccabe,frosted'
let g:pyflakes_use_quickfix = 0
" }

" { Sliver searcher

" }


" UltiSnips {
" Trigger configuration.
" Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<left-shift>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
" }


" YouCompleteMe {
"let g:ycm_global_ycm_extra_conf = '~/liuxc/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
let g:ycm_python_binary_path = 'python'
let g:ycm_confirm_extra_conf = 1
let g:ycm_extra_conf_globlist = ['~/dev/*','!~/*']
let g:ycm_key_list_select_completion = ['<TAB>', '<Down>']
" }

hi LeadingSpace ctermbg=darkblue guibg=Black
match LeadingSpace /^\s\+/
"hi EndingExcess ctermbg=red guibg=Black
"match EndingExcess /\%81v.*/
hi EndingBlank ctermbg=red guibg=Black
match EndingBlank /\s\+$/

" CtrlP {
let g:ctrlp_map = '<c-p>'
let g:ctrlp_prompt_mappings = { 'PrtCurLeft()': ['<left>', '<c-^>'] }
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_max_history = &history
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_arg_map = 1
let g:ctrlp_open_new_file = 'h'
let g:ctrlp_open_multiple_files = 'h'
let g:ctrlp_reuse_window = 'netrw\|help\|quickfix'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/.git/*,*/.hg/*,*/.svn/*
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
" }

" NerdTree {
map <F2> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
" }

" Easy-Align {
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" }

"Easy Motion {
" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)
" " s{char}{char} to move to {char}{char}
 nmap <Leader>s <Plug>(easymotion-overwin-f2)
"" Move to line
map <Leader><Leader>g <Plug>(easymotion-bd-jk)
nmap <Leader><Leader>g <Plug>(easymotion-overwin-line)
" "" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w
" }

" Rainbow Parentheses
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
    \ ['Darkblue',    'firebrick3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
" }

" cscope {
if has("cscope")
    nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    map <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>
endif

" GNU Global
let GtagsCscope_Auto_Load = 1
let GtagsCscope_Auto_Map = 1
let GtagsCscope_Quiet = 1
" }

" gitgutter {
" let g:gitgutter_override_sign_column_highlight = 0
" highlight SignColumn ctermbg=red    " terminal Vim
" highlight SignColumn guibg=darkred  " gVim/MacVim
" if exists('&signcolumn')  " Vim 7.4.2201
"     set signcolumn=yes
" else
"     let g:gitgutter_sign_column_always = 1
" endif
" }

" Pytest {
nmap <silent><Leader>f <Esc>:Pytest file<CR>
"nmap <silent><Leader>c <Esc>:Pytest class<CR>
"nmap <silent><Leader>m <Esc>:Pytest method<CR>
"nmap <silent><Leader>s <Esc>:Pytest session<CR>
" }
