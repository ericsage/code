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
" 4. Plugin Customizations
" 5. Functions
" 6. Colorscheme
" -------------------- "

" ----------------------------------- "
" ---------> P L U G I N S <--------- "
" ----------------------------------- "
" > Plugins are loaded using https://github.com/junegunn/vim-plug. When Vim
" > starts for the first time, it will automatically install Plug and try to
" > install plugins and their dependancies.

" > Autoloads the plugin manager Plug if it does not exist, and then installs
" > plugins.
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.vim/plugged')

" ----> STARTUP <---- "
" > Intelligently reopens files at the last edit position. Ignores commit
" > messages, works with new file templates that jump to specific lines, and
" > maximizes availabe content during restore.
Plug 'farmergreg/vim-lastplace'

" > A start screen that provides configurable lists to show recently used or
" > bookmarked files and persistent sessions.
Plug 'mhinz/vim-startify'
" ------------------- "

" ----> APPEARANCE <---- "
" > Highlights all trailing whitespace characters, except for whitespace on
" > the current line in insert mode. Also provides a helper function to strip
" > whitespace (:StripWhitespace).
Plug 'ntpeters/vim-better-whitespace'

" > Shows visual markers for indent levels, alternating colors for each level.
" > Detects both tab and space indent styles.
Plug 'nathanaelkane/vim-indent-guides'
" ---------------------- "

" > A distraction free writing mode that also centers the current buffer in
" > the terminal.
Plug 'junegunn/goyo.vim'

" ----> STATUS LINE <---- "
" > Draws a sectional statusline that provides more information and plugin
" > integration than the default statusline.
Plug 'vim-airline/vim-airline'

" > Displays the buffer list in the statusline or the command bar.
Plug 'bling/vim-bufferline'
" ------------------------ "

" ----> SIDEBARS <---- "
" > A sidebar file system browser that provides basic file system operations.
Plug 'scrooloose/nerdtree'

" > A sidebar tag browser that displays scope ordered tags for the current
" > file. Tags are generated on demand.
Plug 'majutsushi/tagbar'

" > A sidebar undo branch visualizer that allows selecting and restoring
" > branchs. Also provides a live diff panel.
Plug 'mbbill/undotree'
" -------------------- "

" ----> VERSION CONTROL <---- "
" > Adds VCS markings in the sign column, and supports many VCS systems
" > including git, mercurial, bazaar, and subversion.
Plug 'mhinz/vim-signify'
" --------------------------- "

" ----> LINTING <---- "
" > An asynchronous linting and fixer that also provides LSP support. LSP
" > support provides various IDE like features such as omnicomplete and go to
" > decleration.
Plug 'w0rp/ale'
" ------------------- "

" ----> SEARCH <---- "
" > A fuzzy finder that supports searching through history, buffers, files,
" > tags, and much more.
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf',
      \  { 'dir': '~/.fzf', 'do': './install --all' }
" ------------------- "

" ----> LANGUAGE SUPPORT <---- "
" > Adds comprehensive support for the Go programming language including
" > better highlighting, omnicompletion, go toolchain integration, and much
" > more.
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" ---------------------------- "

call plug#end()
" ----------------------------------- "

" ------------------------------------- "
" ---------> S E T T I N G S <--------- "
" ------------------------------------- "
" > Settings contains are better defaults, and a few are quality of life
" > improvements, or customize how Vim lays out supporting files.

" ----> COMPATABILITY <---- "
" > Explicitly turn compatibility with vi off. This is done automatically when
" > a user defined .vimrc is loaded, but there are cases, such as using -u
" > from the command line, where nocompatible needs to be set by .vimrc.
set nocompatible
" ------------------------- "

" ----> ENCODING <---- "
" > Sets the character encoding to utf-8. It applies to text in the buffers,
" > registers, text stored in the viminfo file, etc. By default,
" > fileencoding is empty, and therefore, encoding will be used for file
" > encodings as well.
set encoding=utf-8
" -------------------- "

" ----> INDENTS <---- "
" > Copies the indentation from the previous line when starting a new line.
set autoindent

" > Automatically inserts one extra level of indentation in some cases.
set smartindent
" ------------------- "

" ----> INTERFACE <---- "
" > Do not display syntax highlighting by default.
syntax off

" > Hides the default intro message on startup.
set shortmess=I

" > Show line numbers next to the sign column.
set number

" > Minimal number of columns to use for the line number. Line numbers can
" > still use more columns when needed.
set numberwidth=2
" --------------------- "

" ----> STATUS LINE <---- "
" > Show line number, column number, and relative position of the cursor in
" the file in the bottom left of the status line.
set ruler

" > Always display a status line for every window.
set laststatus=2
" ----------------------- "

" ----> FILE WATCHING <---- "
" > If a file change is detected when running an external command, such as
" > running a shell command, and it has not changed inside of vim, the file
" > will be automatically read again.
set autoread

" > Writes the file if it has been modified when certain events occur,
" including a buffer switch and running an external ocmmand.
set autowrite
" ------------------------- "

" ----> WINDOWING <---- "
" > Horizontal splits will put the new window below the current one.
set splitbelow

" > Vertical splits will put the new window to the right of the current one.
set splitright
" --------------------- "

" ----> CURSORS <---- "
" > Minimal number of lines to keep above and below the cursor. Setting it to
" > a very large value will always keep the cursor in the center of the screen.
set scrolloff=10

" > Minimal number of lines to scroll when the cursor goes off the screen.
set scrolljump=10

" > Highlights the current line when in insert mode.
autocmd InsertEnter * set cursorline

" > Removes the highlight of the current line when leaving insert mode.
autocmd InsertLeave * set cursorline&
" ------------------- "

" ----> COMMANDS <---- "
" > Show (partial) command in the last line of the screen. This is turned on
" > by default in Vim, and off in Vi.
set showcmd

" > Enhances command line completion when pressing wildchar (usually <Tab>).
" > This will show a list of completion options for the command.
set wildmenu

" > Complete command line till longest common string, but also start wildmenu.
set wildmode=longest:full
" -------------------- "

" ----> DELIMITERS MATCHING <---- "
" Briefly move the cursor to the matching brace when insertings a brace.
set showmatch

" Move the cursor to the matched braced for a tenth of a second.
set matchtime=1
" ------------------------------- "

" ----> INDENTATION <---- "
" > Sets the number of columns used to indent with the reindent operations.
set shiftwidth=2

" > Hitting tab in insertmode will produce the appropriate number of spaces,
" which is the number set by tabstop.
set expandtab

" > The number of spaces pressing the tab key will produce.
set tabstop=2
" ----------------------- "

" ----> FOLDING <---- "
" > Determines how folds will be created. syntax uses syntax highlighting
" > items to specify what will be folded.
set foldmethod=syntax

" > Sets the foldlevel when starting to edit another buffer or window. Setting
" > it to 0 starts with all folds closed, setting it to a higher value will
" > start with less folds open.
set foldlevelstart=0
" ------------------- "

" ----> KEYMAP OPTIONS <---- "
" > By setting timeout and ttimeout, key codes and mappings that are
" > incomplete will timeout. The timout length is determined by ttimeoutlne.
set timeout
set ttimeout

" > The time in milliseconds that is waited for a key code sequence to complete.
set ttimeoutlen=100
" -------------------------- "

" ----> SEARCHING <---- "
" > Highlight all matches for a previous search pattern. The highlighting can
" > be cleared with :nohlsearch which does not turn off hlsearch.
set hlsearch

" > Incrementally searches as characters are entered into a search pattern.
set incsearch

" > Ignore the case of normal letters while searching.
set ignorecase

" > Ignore case when the pattern contains lowercase letters only.
set smartcase

" > Determines how keyword completion (<C-n> <C-p>) works. i scans current and
" > included files for completion keywords.
set complete-=i

" > Show a menu when completing a name when there is more than one match
" > available.
set completeopt=menu
" --------------------- "

" ----> UTILITY FILES <---- "
" > A backup of the original file is made when writing to an existing file.
set backup
set writebackup

" > Writes undo history to a file.
set undofile

" > Backup files location, must use complete path as backup file name (//).
set backupdir=~/.vim/backup//

" > Swap files location, must use complete path as swap file name (//).
set directory=~/.vim/tmp//

" > Undo files location, must use complete path as undo file name (//).
set undodir=~/.vim/undo//
" ------------------------- "

" ----> FILETYPES <---- "
" > Enables filetype detection.
filetype on

" > Enable filetype-specific indenting. This requires a filetype specific
" indent file to exist.
filetype indent on

" > Enable filetype-specific plugins, these plugins are located at
" > ~/.vim/ftplugin and the plugins are named after their filetype (go.vim).
filetype plugin on
" --------------------- "

" ------------------------------------- "

" ------------------------------------- "
" ---------> M A P P I N G S <--------- "
" ------------------------------------- "
"  > Mappings are various remappings over Vim's default keybindings, new
"  keybindings, or shortcuts using leader or abbreviations of common comamnds.

" ----> COMMAND <---- "
" > By default ; repeats the latest f, t, F or T [count] times. This remaps it
" > to more conveniently type commands without needing to shift.
nnoremap ; :
" ------------------- "

" ----> LEADER KEYS <---- "
" > Use comma as the leader and local leader. The local leader would noramally
" > be used for certain types of files.
let mapleader = ","
let g:mapleader = ","
let maplocalleader = ","
let g:maplocalleader = ","
" ----------------------- "

" ----> QUICK ACCESS <---- "
" > Quickly edit vimrc.
:nnoremap <leader>ev :vsplit $MYVIMRC<CR>

" > QUickly reload vimrc.
:nnoremap <leader>rv :source $MYVIMRC<CR>
" ------------------------ "

" ----> WINDOWING <---- "
" > Use movement keys to jump between windows. By default <C-j> scrolls one
" > line down, <C-k> is unbound,  <C-h> backspaces, and <C-l> refreshes the
" > screen.
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
" --------------------- "

" ----> REDOS <---- "
" > Undo a redo with U. By default, U resotres a line to the state it was in
" > when the cursor moved to it.
nnoremap U :redo<CR>
" ----------------- "

" ----> ABBREVIATIONS <---- "
" > Shortcuts for viewing registers and buffers.
command Reg registers
command Buf buffers
" ------------------------- "

" ----> BUFFERS <----"
:nnoremap <C-n> :bnext<CR>
:nnoremap <C-p> :bprevious<CR>
" -------------------"

" ----> TABS <----"
:nnoremap <leader>tn :tabnext<CR>
:nnoremap <leader>tp :tavprevious<CR>
" ----------------"

" ----> PASTE <---- "
nnoremap <leader>p :set paste<CR>
nnoremap <leader>np :set nopaste<CR>
" ----------------- "

" ----> OPEN DRAWERS <---- "
" > Open Nerdree drawer with Ctrl-\
nnoremap <silent> <C-]> :NERDTreeToggle<CR>
" > Open Tagbar drawer with Ctrl-]
nnoremap <silent> <C-\> :TagbarToggle<CR>
" > Open Undotree drawer with Ctrl-[
nnoremap <silent> <C-J> :UndotreeToggle<CR>
" ----> OPEN DRAWERS <---- "
" ------------------------ "

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
" ------------------- "

" ----> ERRORS AND LINTING <---- "
" Move to the next ALE error or warning.
noremap <leader>nerr <Plug>(ale_next_wrap)

" Move to the previous ALE error or warning.
noremap <leader>perr <Plug>(ale_previous_wrap)
" ------------------------------ "

" ----> DEVELOPMENT <---- "
" These ALE keybindings provide IDE like features, but require a language
" server to be set for the filetype. These settings should go into the file
" type plugins directory (~/.vim/ftplugin).

" Move the cursor to where the symbol is defined, opening a new buffer if
" necessary.
noremap <leader>def :ALEGoToDefinition<CR>

" Show where the symbol is defined in a new tab.
noremap <leader>deftab :ALEGoToDefinitionInTab<CR>

" Show all references to symbol.
noremap <leader>ref :ALEFindReferences<CR>

" Symbol Information.
noremap <leader>sym :ALEHover<CR>
" ----------------------- "

" ----> SEARCH <---- "
" > Clear the search highlighting.
nnoremap <leader>clear  :nohlsearch<CR>
" ------------------ "

" ----> DISTRACTION FREE MODE <---- "
" > Enter and exit Goyo.
nnoremap <leader>goyo :Goyo <bar> highlight StatusLineNC ctermfg=white <CR>
" --------------------------------- "

" --------------------------------------------------------------- "
" ---------> P L U G I N   C U S T O M I Z A T I O N S <--------- "
" --------------------------------------------------------------- "
" > Plugin Customizations tweaks plugin settings and adds a few
" > customizations. Langauge specific customizations are in filetype plugins
" > (ftplugins).

" ----> STARTIFY <---- "
" > These files will appear in the bookmarks section of the start menu.
let g:startify_bookmarks = [ '~/.vimrc', '~/.bashrc', '~/.tmux.conf' ]

" > Adds a vanity header for the start menu.
let g:startify_custom_header = [
      \ " ----------------------------------------------------------------- ",
      \ " -V----------V--- SSSSSSS AAAAAAA GGGGGGG EEEEEEE ---V----------V- ",
      \ " ---------------- S       A     A G       E       ---------------- ",
      \ " -I----------I--- SSSSSSS AAAAAAA GGGGGGG EEEEEEE ---I----------I- ",
      \ " ----------------       S A     A G     G E       ---------------- ",
      \ " -M----------M--- SSSSSSS A     A GGGGGGG EEEEEEE ---M----------M- ",
      \ " ----------------------------------------------------------------- ",
      \ ]
" -------------------- "

" ----> AIRLINE <---- "
" > Enable plugin extensions for airline so it will display plugin specific
" > information.
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#bufferline#enabled = 1
" ------------------- "

" ----> ALE <---- "
let g:ale_lint_delay = 1000
let g:ale_set_highlights = 0
let g:ale_fix_on_save = 1
let g:ale_sign_column_always = 1
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
" ---------------- "

" ----> NERDTREE <---- "
" > Sets the number of columns the NERDTree sidebar will occupy.
let g:NERDTreeWinSize = 50
" -------------------- "

" ----> TAGBAR <---- "
" > Sets the number of columns the Tabgar sidebar will occupy.
let g:tagbar_width = 50
" ------------------ "

" ----> UNDOTREE <---- "
" > The WindowLayout affects the position of the UndoTree. 4 opens the sidebar
" > on the right hand side.
let g:undotree_WindowLayout = 4

" > Sets the number of columns the Undotree sidebar wil occupy.
let g:undotree_SplitWidth = 50
" -------------------- "

" ----> GOYO <---- "
" > goyo_{enter,leave} are called during Goyo standard lifecycle hooks, and
" > automatically hide and show the tmux statusbar.

" > goyo_enter will be called when entering Goyo, and will turn the tmux
" > statusbar off.
function! s:goyo_enter()
  silent !tmux set status off
  silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  set noshowmode
  set noshowcmd
  set scrolloff=999
endfunction

" > goyo_leave will be called when leaving Goyo, and will turn the tmux
" > statusbar back on.
function! s:goyo_leave()
  silent !tmux set status on
  silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  set showmode
  set showcmd
  set scrolloff=5
endfunction

" Adds the custom enter and leave functions to the Goyo hooks.
autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
" ---------------- "

" --------------------------------------------------------------- "

" --------------------------------------- "
" ---------> F U N C T I O N S <--------- "
" --------------------------------------- "
" > Functions contains various utility functions.

" > SyntaxOn turns syntax highlighting, but also removes all highlighting
" > besides the syntax highlighting, leaving Vim primarily colorless.
function SyntaxOn()
  syntax on
  call ClearColors()
endfunction

" > SyntaxOff turns off all highlighting, including syntax highlightinh,
" > leaving Vim completely colorless.
function SyntaxOff()
  syntax off
  call ClearColors()
endfunction

" > ClearColors should remove all highlighting, with the exception of syntax
" > highlighting, leaving Vim mostly colorless.
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
  highlight Visual cterm=reverse ctermbg=none
  highlight Comment cterm=bold
  endfunction

" > HighlightLineBoundryWall highlights all columns past column 80.
function HighlightLineBoundryWall()
  let &colorcolumn=join(range(81,999),",")
endfunction

" > HighlightLineBoundryColumn highlights the three columns that follow column
" > 80.
function HighlightLineBoundryColumn()
  let &colorcolumn=join(range(81,84),",")
endfunction
" --------------------------------------- "

" ------------------------------------------- "
" ---------> C O L O R S C H E M E <--------- "
" ------------------------------------------- "
" > Colorscheme sets the look and feel of Vim. By default, the colorscheme is
" > completely removed, except for syntax highlighting.

" > Use the builtin default colorscheme.
colorscheme default

" > Turn on Syntax Highlighting, clear all other highlightinh.
call SyntaxOn()

" > Highlight three columns demarcating where column 80 ends.
call HighlightLineBoundryColumn()
" ------------------------------------------- "

" ----------------------------------------------------------------- "
