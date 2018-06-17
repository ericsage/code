" ----------------------------------------------------------------- "
" -V----------V--- SSSSSSS AAAAAAA GGGGGGG EEEEEEE ---V----------V- "
" ---------------- S       A     A G       E       ---------------- "
" -I----------I--- SSSSSSS AAAAAAA GGGGGGG EEEEEEE ---I----------I- "
" ----------------       S A     A G     G E       ---------------- "
" -M----------M--- SSSSSSS A     A GGGGGGG EEEEEEE ---M----------M- "
" ----------------------------------------------------------------- "

" ----> CONTENTS <---- "
" 1. Plugins
" 2. Settings
" 3. Mappings
" 4. Language Specifics
" 6. Plugin Customizations
" 5. Functions
" 6. Colorscheme
" -------------------- "

" ----------------------------------- "
" ---------> P L U G I N S <--------- "
" ----------------------------------- "

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

" ----------------------------------- "

call plug#begin('~/.vim/plugged')

" ----> STARTUP <---- "
" > Reopen files at the last edit position
Plug 'farmergreg/vim-lastplace'
" > Custom start screen with file picker
Plug 'mhinz/vim-startify'

" ----> APPEARANCE <---- "
" > Marks and removes all trailing spaces
Plug 'ntpeters/vim-better-whitespace'
" > Show fancy indent markers
Plug 'nathanaelkane/vim-indent-guides'

" ----> STATUS LINE <---- "
" > Customizes the status line
Plug 'vim-airline/vim-airline'
" > Show buffers bar
Plug 'bling/vim-bufferline'

" ----> BROWSERS <---- "
" > File browser
Plug 'scrooloose/nerdtree'
" > Tag browser
Plug 'majutsushi/tagbar'
" > Undo browser
Plug 'mbbill/undotree'

" ----> VERSION CONTROL <---- "
" > Adds VCS markings in the gutter
Plug 'mhinz/vim-signify'
" > Git markings for nerdtree
Plug 'Xuyuanp/nerdtree-git-plugin'
" > Mercurial markings for nerdtree
Plug 'f4t-t0ny/nerdtree-hg-plugin'

" ----> LINTING <---- "
" > Multilingual Linter
Plug 'w0rp/ale'
" > Autoformater
Plug 'Chiel92/vim-autoformat'

" ----> SEACRCH <---- "
" > Fuzzy finder
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf',
      \  { 'dir': '~/.fzf', 'do': './install --all' }

" ----> LANGUAGE SERVER CLIENT <---- "
" > Dependancy for vim-lsp
Plug 'prabirshrestha/async.vim'                                                     
" > Core langugage server client
Plug 'prabirshrestha/vim-lsp'                                                       
" > Multilingual autocomplete
Plug 'prabirshrestha/asyncomplete.vim'                                              
" > Hook autocomplete into language server client
Plug 'prabirshrestha/asyncomplete-lsp.vim'  

call plug#end()

" ------------------------------------- "
" ---------> S E T T I N G S <--------- "
" ------------------------------------- "

" ----> COMPATABILITY <---- "
" > Turn vi compatability mode off
set nocompatible

" ----> INDENTS <---- "
" > Indent using filetype files if they exist/end Vundle
filetype plugin indent on
" > Copy the indentation from the previous line
set autoindent
" > Insert an extra indent level in some cases
set smartindent

" ----> INTERFACE <---- "
" > Do not display syntax highlighting
syntax off
" > Hide the intro message
set shortmess=I
" > Show line numbers
set number
" > Use at least two columns to display line numbers
set numberwidth=2

" ----> STATUS LINE <---- "
" > Show line number on status line
set ruler
" > Use two rows to display the status line
set laststatus=2

" ----> FILE WATCHING <---- "
" > Reread the file when an external change is detected
set autoread
" > Write the file when a buffer switch occurs
set autowrite

" ----> WINDOWING <---- "
" > Create horizontal splits below the current window
set splitbelow
" > Create vertical splits to the right of the current window
set splitright

" ----> CURSORS <---- "
" > The number of lines kept above and below the cursor
set scrolloff=5
" > The number of lines to scroll at a time
set scrolljump=5
" > Highlight line with cursor in insert mode
autocmd InsertEnter * set cursorline
" > Remove cursor line highlight in command mode
autocmd InsertLeave * set cursorline&

" ----> COMMANDS <---- "
" > Show partial commands as they are typed
set showcmd
" > Show a completion menu for commands with Tab
set wildmenu
" > Always choose the longest match for the completion menu
set wildmode=longest:full

" ----> DELIMITERS MATCHING <---- "
" Briefly move the cursor to the matching brace when insertings a brace
set showmatch
" Move the cursor to the matched braced for a tenth of a second
set matchtime=1

" ----> INDENTATION <---- "
" > Insert two spaces of indentation with reindent (>> <<)
set shiftwidth=2
" > Insert spaces when the Tab key is pressed
set expandtab
" > Insert two spaces when the Tab key is pressed
set tabstop=2

" ----> FOLDING <---- "
" > Sets folds using the method defined in the current filetype syntax file
set foldmethod=syntax
" > Make all folds closed when a file is opened
set foldlevelstart=20

" ----> ENCODING <---- "
" > Set vim's default encoding to utf-8
set encoding=utf-8
" > Set the default encoding of files to utf-8
set fileencoding=utf-8

" ----> KEYMAPS OPTIONS <---- "
" > Time out on key codes
set ttimeout
" > The time in milliseconds that is waited for a key code sequence to complete
set ttimeoutlen=100

" ----> SEARCHING <---- "
" > Highlight all matches for a previous search pattern
set hlsearch
" > Search as characters are entered
set incsearch
" > Ignore the case of normal letters when searching
set ignorecase
" > Ignore case when the pattern contains lowercase letters only
set smartcase
" > When completing a name (<C-n> <C-p>), match with current and included file
set complete-=i
" > Show a menu when completing a name when there is more than one match
set completeopt=menu

" ----> UTILITY FILES <---- "
" > Create a backup of any opened files, overwriting any old backups
set backup
" > Backup files location, use complete path as backup file name (//)
set backupdir=~/.vim/backup//
" > Swap files location, use complete path as swap file name (//)
set directory=~/.vim/tmp//
" > Undo files location, use complete path as undo file name (//)
set undodir=~/.vim/undo//
" > Keep a history of undos
set undofile

" ----> FILETYPES <---- "
" > Enable filetype detection
filetype on
" > Enable filetype-specific indenting
filetype indent on
" > Enable filetype-specific plugins
filetype plugin on

" ------------------------------------- "
" ---------> M A P P I N G S <--------- "
" ------------------------------------- "

" ----> COMMAND <---- "
" > Use ; as :
nnoremap ; :

" ----> LEADER KEYS <---- "
" > Use comma as the leader and local leader
let mapleader = ","
let g:mapleader = ","
let maplocalleader = ","
let g:maplocalleader = ","

" ----> QUICK ACCESS <---- "
" > Edit vimrc
:nnoremap <leader>ev :vsplit $MYVIMRC<CR>
" > Reload vimrc
:nnoremap <leader>sv :source $MYVIMRC<CR>

" ----> WINDOWING <---- "
" > Use movement keys to jump between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" ----> REDOS <---- "
" > Undo a redo with U
nnoremap U :redo<CR>

" ----> ABBREVIATIONS <---- "
" > Shortcuts for viewing registers and buffers
command Reg registers
command Buf buffers

" ----> PASTE <---- "
nnoremap <leader>p :set paste<CR>
nnoremap <leader>np :set nopaste<CR>

" ----> OPEN DRAWERS <---- "
" > Open Nerdree drawer with Ctrl-\
nnoremap <silent> <C-\> :NERDTreeToggle<CR>
" > Open Tagbar drawer with Ctrl-]
nnoremap <silent> <C-]> :TagbarToggle<CR>
" > Open Undotree drawer with Ctrl-[
nnoremap <silent> <C-J> :UndotreeToggle<CR>

" ----> FINDING <---- "
" > Search files in git
nnoremap <C-f> :GFiles<CR>
" > Search all files
nnoremap <leader>fa :Files<CR>
" > Search lines in all open buffers
nnoremap <leader>fl :Lines<CR>
" > Search command history
nnoremap <leader>fc :History:<CR>
" > Search search history
nnoremap <leader>fs :History/<CR>
" > Search key mappings
noremap <leader>fm :Maps<CR>

" ----> SEARCHING <---- "
" > Clear the search highlighting
nnoremap <silent> . :nohlsearch<CR>

" ------------------------------------------------------ "
" ---------> L A N G U A G E  S P E C F I C S <--------- "
" ------------------------------------------------------ "

" ----> PYTHON <---- "
au BufNewFile,BufRead *.py
      \ set tabstop=4       |
      \ set softtabstop=4   |
      \ set shiftwidth=4    |
      \ set textwidth=79    |
      \ set expandtab       |
      \ set autoindent      |
      \ set fileformat=unix |

let g:formatter_yapf_style = 'facebook'

if executable('pyls')
      au User lsp_setup call lsp#register_server({
             \ 'name': 'pyls',
             \ 'cmd': {server_info->['pyls']},
             \ 'whitelist': ['python'],
             \ })
endif

" --------------------------------------------------------------- "
" ---------> P L U G I N   C U S T O M I Z A T I O N S <--------- "
" --------------------------------------------------------------- "

" ----> STARTIFY <---- "
let g:startify_bookmarks = [ '~/.vimrc', '~/.bashrc', '~/.tmux.conf' ]
let g:startify_custom_header = [
      \ " ----------------------------------------------------------------- ",
      \ " -V----------V--- SSSSSSS AAAAAAA GGGGGGG EEEEEEE ---V----------V- ",
      \ " ---------------- S       A     A G       E       ---------------- ",
      \ " -I----------I--- SSSSSSS AAAAAAA GGGGGGG EEEEEEE ---I----------I- ",
      \ " ----------------       S A     A G     G E       ---------------- ",
      \ " -M----------M--- SSSSSSS A     A GGGGGGG EEEEEEE ---M----------M- ",
      \ " ----------------------------------------------------------------- ",
      \ ]

" ----> AIRLINE <---- "
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#bufferline#enabled = 0

" ----> ALE <---- "
let g:ale_sign_column_always = 1
let g:ale_lint_delay = 1000
let g:ale_fix_on_save = 1

" ----> NERDTREE <---- "
:let g:NERDTreeWinSize = 50

" ----> TAGBAR <---- "
let g:tagbar_width = 50

" ----> UNDOTREE <---- "
let g:undotree_WindowLayout = 4
let g:undotree_SplitWidth = 50

" ----> VIM-AUTOFORMAT <---- "
au BufWrite * :Autoformat
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0

" --------------------------------------- "
" ---------> F U N C T I O N S <--------- "
" --------------------------------------- "

" > Turns on syntax, but keeps vim colors cleared
function SyntaxOn()
  syntax on
  call ClearColors()
endfunction

" > Turns off syntax, keep vim interface colors cleared
function SyntaxOff()
  syntax off
  call ClearColors()
endfunction

" > Sets all of vims highlights to none
function ClearColors()
  highlight ModeMsg cterm=reverse
  highlight LineNr ctermbg=none ctermfg=none
  highlight Question ctermbg=none ctermfg=none
  highlight SpecialKey ctermbg=none ctermfg=none
  highlight DiffAdd ctermbg=none ctermfg=none
  highlight NonText cterm=bold ctermbg=none ctermfg=none
  highlight Directory ctermbg=none ctermfg=none
  highlight PmenuSel ctermbg=none ctermfg=none
  highlight DiffChange cterm=reverse ctermbg=none ctermfg=none
  highlight DiffDelete cterm=reverse ctermbg=none ctermfg=none
  highlight DiffText cterm=reverse ctermbg=none ctermfg=none
  highlight DiffText cterm=reverse ctermbg=none ctermfg=none
  highlight Pmenu cterm=reverse ctermbg=none ctermfg=none
  highlight PmenuSbar cterm=reverse ctermbg=none ctermfg=none
  highlight PmenuThumb cterm=reverse ctermbg=none ctermfg=none
  highlight Search cterm=reverse ctermbg=none ctermfg=none
  highlight CursorLine cterm=reverse ctermbg=none ctermfg=none
  highlight CursorLineNr cterm=reverse ctermbg=none ctermfg=none
  highlight Title cterm=reverse ctermbg=none ctermfg=none
  highlight MoreMsg cterm=reverse ctermbg=none ctermfg=none
  highlight ErrorMsg cterm=reverse ctermbg=none ctermfg=none
  highlight Warningmsg cterm=reverse ctermbg=none ctermfg=none
  highlight WildMenu cterm=reverse ctermbg=none ctermfg=none
  highlight Folded cterm=reverse ctermbg=none ctermfg=none
  highlight MatchParen cterm=reverse ctermbg=none ctermfg=none
  highlight ExtraWhitespace cterm=reverse ctermbg=none ctermfg=none
  highlight TabLineFill cterm=reverse ctermbg=none ctermfg=none
  highlight FoldColumn cterm=reverse ctermbg=none ctermfg=none
  highlight SignColumn cterm=bold ctermbg=none ctermfg=none
  highlight ColorColumn cterm=reverse ctermbg=none ctermfg=none
  highlight CursorColumn cterm=reverse ctermbg=none ctermfg=none
  highlight TabLine cterm=reverse,underline ctermbg=none ctermfg=none
  highlight SpellBad cterm=reverse,underline,bold ctermbg=none ctermfg=none
  highlight SpellCap cterm=reverse,underline,italic ctermbg=none ctermfg=none
  highlight SpellRare cterm=reverse,underline ctermbg=none ctermfg=none
  highlight SpellLocal cterm=reverse,underline ctermbg=none ctermfg=none
  highlight airline_warnings cterm=reverse ctermbg=none ctermfg=none
  highlight airline_warning_bold cterm=reverse ctermbg=none ctermfg=none
  highlight airline_warning_red cterm=reverse ctermbg=none ctermfg=none
  highlight airline_tablabel cterm=reverse ctermbg=none ctermfg=none
  highlight airline_tab cterm=reverse ctermbg=none ctermfg=none
  highlight airline_tabsel cterm=reverse ctermbg=none ctermfg=none
  highlight airline_tabtype cterm=reverse ctermbg=none ctermfg=none
  highlight airline_z cterm=reverse ctermbg=none ctermfg=none
  highlight airline_z_bold cterm=reverse ctermbg=none ctermfg=none
  highlight airline_z_red cterm=reverse ctermbg=none ctermfg=none
  highlight airline_tabsel_right ctermbg=none ctermfg=none
  highlight airline_tabsel_right ctermbg=none ctermfg=none
  highlight airline_tabmod_unsel ctermbg=none ctermfg=none
  highlight airline_tabmod_unsel_right ctermbg=none ctermfg=none
endfunction

" > Highlights all columns past 80
function HighlightLineBoundryWall()
  let &colorcolumn=join(range(81,999),",")
endfunction

" > Highlights column 81
function HighlightLineBoundryColumn()
  let &colorcolumn=join(range(81,84),",")
endfunction

" ------------------------------------------- "
" ---------> C O L O R S C H E M E <--------- "
" ------------------------------------------- "

colorscheme default

call SyntaxOn()
call HighlightLineBoundryColumn()

" ----------------------------------------------------------------- "
