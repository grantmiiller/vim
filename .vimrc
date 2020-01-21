syntax enable           " enable syntax processing

" Unmap spacebar in normal mode and remap it as the leader key
nnoremap <Space> <nop>
map <Space> <Leader>

if (empty($TMUX))
  if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
endif

set tabstop=8
set softtabstop=2
set shiftwidth=2
set expandtab

autocmd Filetype css setlocal tabstop=4 shiftwidth=4
autocmd Filetype scss setlocal tabstop=4 shiftwidth=4

set autoindent 

" UI fun
set number              " show line numbers
set relativenumber      " start with relative numbers
set showcmd             " show command in bottom bar
set cursorline          " highlight current line
set wildmenu            " visual autocomplete for command menu
set showmatch           " highlight matching [{()}]
set splitright          " i like my new splits to the right

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" So we can switch buffers without saving
set hidden

" Configuration for NETRW
" Don't show the netrw banner
let g:netrw_banner = 0
" Shows netrw in a tree-like view
let g:netrw_liststyle = 3

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm
" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=2
" keep more context when scrolling off the end of a buffer
set scrolloff=3

" Searching
set incsearch           " search as characters are entered
set hlsearch            " highlight matches

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.tar.gz     " MacOSX/Linux

" Get rid of annoying backups
set nobackup
set nowritebackup

" toggle between number and relativenumber
function! ToggleNumber()
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else
        set relativenumber
    endif
endfunc

" START mapping land

" toggles relative numbers on and off
nnoremap <C-n> :call ToggleNumber()<cr>
" Turn off highlighting from search
nnoremap <Leader>c :nohlsearch<Cr>

" Reload Vimrc file
nnoremap <Leader>r :so $MYVIMRC<Cr>
" Edit vimrc in newtab (I use old vimrc instead of neovims)
nnoremap <Leader>tev :tabedit ~/.vimrc<Cr>
" Edit vimrc in current tab (I use old vimrc instead of neovims)
nnoremap <Leader>ev :edit ~/.vimrc<Cr>

" Quick open for :Ex
nnoremap <Leader>o :Ex<Cr>

" List buffers
nnoremap <Leader>l :ls<Cr>

" Next buffer
nnoremap <Leader>n :bn<Cr>
" Previous buffer
nnoremap <Leader>p :bp<Cr>
" Close Buffer
nnoremap <Leader>d :bd<Cr>

" Vertical split a file
nnoremap <Leader>\ :vsplit 
" Vertical split a new file
nnoremap <Leader>s :vnew<Cr>

" START plugin config

if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

let g:ctrlp_working_path_mode = 'w'
" END plugin config
