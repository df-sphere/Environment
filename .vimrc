set nocompatible              " be improved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

"===============================================================================
"// Install Plugins
"===============================================================================
call vundle#begin()

" run :PluginInstall

" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Syntastic, syntax checker"
Plugin 'scrooloose/syntastic'

" nerdtree to navigate files
Plugin 'scrooloose/nerdtree'

" status bar
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" gdb debugger
Plugin 'vim-scripts/Conque-GDB'

" Grammarous grammar check
Plugin 'rhysd/vim-grammarous'

" LanguageTool grammar check
Plugin 'vim-scripts/LanguageTool'

" highlight words and press '*' to find match
Plugin 'nelstrom/vim-visual-star-search'

" gitkv plugin
Plugin 'gregsexton/gitv'

" git diffchar, show diff for strings
Plugin 'rickhowe/diffchar.vim'

" supertab, autocompleting typing tab, this is to work like command line
Plugin 'ervandew/supertab'

" shows in vim when line has been added, modified or deleted in git
Plugin 'airblade/vim-gitgutter'

" improved make command
Plugin 'tpope/vim-dispatch'

""Plugin 'yssl/QFEnter'

" LSP config
Plugin 'prabirshrestha/vim-lsp'
Plugin 'prabirshrestha/asyncomplete.vim'
Plugin 'prabirshrestha/asyncomplete-lsp.vim'
Plugin 'mattn/vim-lsp-settings'

" colors
Plugin 'altercation/vim-colors-solarized'

" Clang autocomplete
"   Make sure is installed before 'ctrlp' plugin, other wise the clang_completer
"   'make install' will place files inside ~/.vim/bundle/ctrlp.vim
"   directory
"
"   1. cd ~
"   2. git clone https::/github.com/Rip-Rip/clang_complete
"   3. cd ~/clang_complete
"   4. make install

" Ctrlp, find files as you type
"   1. cd ~/.vim
"   2. git clone https://github.com/kien/ctrlp.vim.git bundle/ctrlp.vim

" vim - git
"   1. cd ~/.vim/bundle
"   2. git clone https://github.com/tpope/vim-fugitive.git
"   3. vim -u NONE -c "helptags vim-fugitive/doc" -c q
"   4. copy the files
"      cd ~/vim/bundle/vim-fugitive
"      cp autoload/fugitive.vim ~/.vimrc/autoload
"      cp plugin/fugitive.vim ~/.vimrc/plugin
"      cp doc/fugitive.doc ~/.vimrc/doc

" Code coverage:
" 1. git clone https://github.com/m42e/vim-gcov-marker
" 2. $cd vim-gcov-marker
"    $cp plugin/gcov_marker.vim ~/.vim/plugin
"    $cp autoload/gcov_marker.vim ~/.vim/autoload
"    $cp syntax/gcov_marker.vim ~/.vim/syntax
"    $cp doc/gcov_marker.vim to ~/.vim/doc

" PDF converter:
"   clone repo and copy autoload, plugin and doc folder files in ~/.vim folder
"   https://github.com/rhysd/open-pdf.vim

" web browser - w3m
"   install:
"   - $sudo apt-get install w3m w3m-img // xterm supports images
"   - copy the ~/.w3m/keymap to new user account
"   sudo apt-get install vim-gtk

call vundle#end()
filetype plugin indent on

"===============================================================================
"// Plugins  configuration
"===============================================================================

"===============================================================================
"// Utility
"===============================================================================
function! s:GetVisualSelection()
  let [line_start, column_start] = getpos("'<")[1:2]
  let [line_end, column_end] = getpos("'>")[1:2]
  let lines = getline(line_start, line_end)
  if len(lines) == 0
    return ''
  endif
  let lines[-1] = lines[-1][: column_end - (&selection == 'inclusive' ? 1 : 2)]
  let lines[0] = lines[0][column_start - 1:]
  return join(lines, "\n")
endfunction

function! GetData()
  let l:selection = s:GetVisualSelection()
  echo "data: ".l:selection
endfunction

noremap <silent> ;a :call GetData() <CR>

"===============================================================================
"// Other
"===============================================================================
" :nmap :vmap :imap to view all mappings
" ':help key-notation' to see the key's mapping
" CTRL+b page up
" CTRL+f page down
" { or } to go to next empty lines
" [ or ] to go to next defintion between braces (classes, methods, etc)
" :tabnew to open new tabs
" gt and gT to switch between tabs
" 50 CTRL + w + < // change window size to left
" 10 CTRL + w + > // change window size to right
" sort lines: highligth the lines that need to be sort and type ':sort'
" 'gq' wrap lines and set to 80 lines adding break character between them
" 'q + <letter>' start recording, 'q' to stop. To run recording @<letter>. You can
"   highlight multiple lines and apply the recording by highlighting first and
"   then :normal @<letter>
" open pdf files ":Pdf ~/file.pdf"
" :e to reload file, i.e. after running gdiff and made changes in another buffer
"   and want to reload them in current buffer
" :ol view recent files
" help vim menu: press Ctrl-] to read corresponding topic
"                press Ctrl-o to return
" command-line completion
" use quickfix or locationlist windows to add interactive components
"  reference:  http://vimdoc.sourceforge.net/htmldoc/usr_41.html
" open custom file, e.g. jpeg:
"  highlight filename in a text file and type in ESC mode gx"
" :edit or :e to refresh file when contents have been changed somewhere else

" tab autocompletion for vim commands
set wildmenu
set wildmode=longest,list,full

" incremental search, highlights match pattern as the word is typed in search
" mode i.e. /a_value_to_find
set incsearch

" case insesitive search when the word is typed in lower case, otherwise is
" case sensitive. ignorecase must be active to use this feature.
set ignorecase
set smartcase

"set mouse=a
set mouse=

noremap ;me :set mouse=a <CR>
noremap ;md :set mouse=n <CR>

" noremap s i

" close all
noremap ;x :qa! <CR>
" tab open, 'Shift + o' opens new tabs in gitk (Gitv plugin), remap this
" shortcut
noremap to :exe "normal \<S-o>" <CR>
" tab close
noremap tc :tabclose <CR>

" close buffer/tab
noremap ..q :q! <CR>

" copy, cut and save yank, copy selection without loosing it when deleting another object
noremap y "ay
noremap x "ax
noremap p "ap

" clipboard copy
noremap ;y "*y
noremap ;p "*p

" Highlight when searching '/'
autocmd BufWinEnter * set hlsearch

" Shift h, j, k and l to resize buffers
nnoremap <silent> <S-h> :vertical resize -5<CR>
nnoremap <silent> <S-j> :resize +5<CR>
nnoremap <silent> <S-k> :resize -5<CR>
nnoremap <silent> <S-l> :vertical resize +5<CR>

" Navigate between splits
nnoremap <silent> <C-h> <C-w><left>
nnoremap <silent> <C-j> <C-w><down>
nnoremap <silent> <C-k> <C-w><up>
nnoremap <silent> <C-l> <C-w><right>

" Go back and forth between opened files, Shift q and w
nnoremap <silent> <S-q> :bprev <CR>
nnoremap <silent> <S-w> :bnext <CR>

" save all tabs"
noremap ;w :wa! <CR>
noremap ;q ;wqa! <CR>
autocmd BufEnter * execute "wa!"

nnoremap .e :edit<CR>

" ergonomics
nnoremap ' j

" terminal switch buffers
tnoremap <C-h> <C-W>h
tnoremap <C-j> <C-W>j
tnoremap <C-k> <C-W>k
tnoremap <C-e> <C-W>k
tnoremap <C-l> <C-W>l

" terminal switch buffers
noremap <C-h> <C-W>h
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-e> <C-W>k
noremap <C-l> <C-W>l


" normal mode in terminal
tnoremap <C-y> <C-W>N
nnoremap <C-e> <C-d>

" open terminal at bottom
nnoremap term :botright terminal<CR>


" opens terminal at tab 0
function! OpenTerminalTab() abort
  execute "tab ter"
  execute "tabm0"
endfunction

nnoremap tterm :call OpenTerminalTab()<CR>

" save and return to terminal tab the
nnoremap <C-t> :wa!<Bar>tabn 1<CR>i
nnoremap <C-s> :wa!<Bar>tabn 1<CR>i
nnoremap <C-\> :wa!<Bar>tabn 1<CR>i

""au TabLeave * let g:lasttab = tabpagenr()
""nnoremap <silent> <c-l> :exe "tabn ".g:lasttab<cr>
""
""" return to last tabl from terminal
""tnoremap .s <C-\><C-N>:exe "tabn ".g:lasttab<CR>
""tnoremap <C-t> <C-\><C-N>:exe "tabn ".g:lasttab<CR>
tnoremap <C-t> <C-\><C-N>:tabn #<CR>
tnoremap <C-s> <C-\><C-N>:tabn #<CR>
tnoremap <C-\> <C-\><C-N>:tabn #<CR>

let s:term_buf_nr = -1
function! s:ToggleTerminal() abort
   if s:term_buf_nr == -1
      execute "botright terminal"
      let s:term_buf_nr = bufnr("$")
   else
      try
          execute "bdelete! " . s:term_buf_nr
      catch
          let s:term_buf_nr = -1
          call <SID>ToggleTerminal()
          return
      endtry
      let s:term_buf_nr = -1
   end if
endfunction

nnoremap <silent> <Leader>t :call <SID>ToggleTerminal()<CR>
nnoremap <silent> <Leader>t <C-w>N:call <SID>ToggleTerminal()<CR>
autocmd BufEnter term://* setlocal modifiable

" Place all swap '.swp' files in specific directory. Avoids swap files being
" spread across filesystem.
"
" The ^= syntax for :set prepends the directory name to the head of the list, so
" Vim will check that directory first.
"
" The // at the end of the directory name tells Vim to use the absolute path to
" the file to create the swap file so there aren't collisions between files of
" the same name from different directories.
"
" Note that this will prevent Vim from noticing when there are multiple users
" trying to edit the same file. Since the swap file isn't in the same directory
" as the original file, the other user's Vim won't know about the swap file and
" won't warn them that it's already being edited.
""set directory=$HOME/.vim/tmp//
""set backupdir=$HOME/.vim/tmp//
""set undodir=$HOME/.vim/tmp//

" delete swp files
""nnoremap ;swp :!rm $HOME/.vim/tmp/* <CR>

" match angle brackets
set matchpairs+=<:>

set noswapfile

" close tab
noremap ..q :q! <CR>

"===============================================================================
"// Fold
"===============================================================================
" fold code
" za open all folds
" select all file an 'zc' closes all folds
" zo open one fold
" zc close one fold
" zO open all folds
" zC close all folds
" ze expand next level in all the file
" zm minimize next level in all the file

" expand all
map <silent> za :exe "normal zR" <CR>
" expand next level for all file
map <silent> ze :exe "normal zr" <CR>

set foldmethod=syntax
set foldnestmax=10
set foldlevel=0
set foldenable

" It opens all of the folds first, so when hovering over a method it can be
" uniquely folded. Without this command, when opening a file all the folds are
" closed by default (set foldenable, instead of set nofoldenable, where
" foldenable is needed to allow Gitv show commits folded), where 'zR' opens them
" back again, and at that point a method in the code can be folded.
augroup Fold
 autocmd BufWinEnter * exe "normal zR"
augroup END

function! ExpandFold()
  if !exists('#Fold#BufEnter')
    augroup Fold
      autocmd!
      autocmd BufWinEnter * exe "normal zR"
    augroup END
  endif
endfunction

" disables "normal zR" autocmd when running Gitv, which prevents it from
" expanding the folds, showing all the files per commit
function! DisableExpandFold()
  augroup Fold
    autocmd!
  augroup END
endfunction

noremap <silent> ;f :call ExpandFold() <CR>

"===============================================================================
"// Supertab, linux-like autocompletion when pressing tab
"===============================================================================
" this is default, show results from bottom to up
" let g:SuperTabDefaultCompletionType = "<c-p>"

" show results from top to bottom
" let g:SuperTabDefaultCompletionType = "<c-n>"

"===============================================================================
"// Tabs
"===============================================================================
" turn current window into a tab
noremap tab :tabedit %<CR>
" tab open, opens new tabs in gitk (Gitv plugin) and nerdtree
noremap to :exe "normal \<S-o>" <CR>
" tab close
noremap tc :tabclose <CR>
" Gitv tab open, syntax off for better diff readability
noremap go :exe "normal \<S-o>" <CR> :syntax off <CR>

"map numbers to tab, e.g. .7
for i in range(1, 9)
  execute 'nnoremap <silent> .' . i . ' ' . i . 'gt'
  execute 'nnoremap <silent> z' . i . ' ' . i . 'gt'
endfor

noremap <C-n> gT
noremap <C-m> gt
noremap <C-f> gT
noremap <C-g> gt

"switch tabs from terminal
tnoremap <C-n> <C-\><C-N>gT
tnoremap <C-m> <C-\><C-N>gt
tnoremap <C-f> <C-\><C-N>gT
tnoremap <C-g> <C-\><C-N>gt

let g:last_buftype = 'normal'

function! OnTabEnter()
  if &buftype == 'terminal'
    if g:last_buftype != 'terminal'
      " Only if coming from a non-terminal buffer
      call feedkeys("i", 'n') " Enter terminal mode (insert mode for terminal)
    endif
  endif
  let g:last_buftype = &buftype
endfunction

augroup TerminalTabSwitch
  autocmd!
  autocmd TabEnter * call OnTabEnter()
augroup END

function! TabName()
  let s = ''
  for i in range(1, tabpagenr('$'))
    if i == tabpagenr()
      let s .= '%#TabLineSel#'
    else
      let s .= '%#TabLine#'
    endif
    let s .= '%' . i . 'T'
    let s .= ' %{MyTabLabel(' . i . ')} '
  endfor
  let s .= '%#TabLineFill#%T'
  if tabpagenr('$') > 1
    let s .= '%=%#TabLine#%999Xclose'
  endif
  return s
endfunction

function! MyTabLabel(n)
  let buflist = tabpagebuflist(a:n)
  let winnr = tabpagewinnr(a:n)
  let filename = bufname(buflist[winnr - 1])
  return a:n . '. ' . fnamemodify(filename, ':t')
endfunction

set tabline=%!TabName()
set showtabline=2  " Always show the tab bar

" syntax can be off when opening with 'go'"
autocmd BufLeave * syntax on

"===============================================================================
"// Grep
"===============================================================================
" :Grep <find_word>  // just for .h and .cpp files
"   i.e Grep other
"       Grep other value // will grep for 'other value', no need for quotes
" :AllGrep <find_word> // all files
" highlight word and type in 'normal' 'grep' word
" next finding, '>'
" previous finding, '<'

command! -nargs=1 Grep call FindGrepNewTab(<f-args>)
command! -nargs=1 GrepCommandLine call FindGrep(<f-args>)

command! -nargs=1 AllGrep call FindAllGrepNewTab(<f-args>)
command! -nargs=1 AllGrepCommandLine call FindAllGrep(<f-args>)

function! FindGrep(pattern)
  exe "vimgrep /".a:pattern."/ **/*.h **/*.cpp"
  copen
endfunction

function! FindGrepNewTab(pattern)
  exe "vimgrep /".a:pattern."/ **/*.h **/*.cpp"
  tabnew
  copen
endfunction

function! FindAllGrep(pattern)
  exe "vimgrep /".a:pattern."/ **"
  copen
endfunction

function! FindAllGrepNewTab(pattern)
  exe "vimgrep /".a:pattern."/ **"
  tabnew
  copen
endfunction

" next finding, '>'
noremap . :cn <CR>
" previous finding, '<'
noremap , :cp <CR>

function! GrepSelection()
  let l:selection = s:GetVisualSelection()
  call FindGrepNewTab(l:selection)
endfunction

function! AllGrepSelection()
  let l:selection = s:GetVisualSelection()
  call FindAllGrepNewTab(l:selection)
endfunction

" Grep highlighted word
noremap <silent> ;grep :call GrepSelection() <CR>
noremap <silent> ;allgrep :call AllGrepSelection() <CR>

"===============================================================================
"// vim-dispatch
"===============================================================================
" :Dispatch to run custom commands
" tb build
" tm make
" tr run tests
" tbs build silently
" tms make silently
" trs run tests silently
" two open results when run silently

function! SetBuildProject()
  let &makeprg='(cd ~/Development/AFSSbuild && ./build.sh)'
endfunction

function! SetMakeProject()
  let &makeprg='(cd ~/Development/AFSSbuild && ./make.sh)'
endfunction

function! SetRunTests()
  let &makeprg='(cd ~/Development/AFSSbuild && ./run.sh)'
endfunction

"===============================================================================
"// Clang autocomplete
"===============================================================================
" Add .clang_complete file to project. This specifies include directories, where
" syntax and content must be exactly the same as .VimIncludeDirectores file.
nnoremap <silent> con :call ClangCompleteOn()<CR>
nnoremap <silent> coff :call ClangCompleteOff()<CR>

" default is off, commented out to improve performance, VimEnter is slow
"autocmd VimEnter * call ClangCompleteOff()

function! ClangCompleteOn()
  let g:clang_complete_auto = 1
endfunction

function! ClangCompleteOff()
  let g:clang_complete_auto = 0
endfunction

"let g:clang_library_path ='/usr/lib/llvm-3.8/lib'
"let g:clang_user_options ='std=c++14 -stdlib=libc++'
let g:clang_user_options ='std=c++2a'
""let g:clang_user_options ='std=c++17'
let g:clang_user_options .=' -I.'

" close preview with function/methods declaration info, once completion is done
let g:clang_close_preview = 1

" Automatically select first entry. Default is 0, nothing gets selected.
"let g:clang_auto_select = 1"

"===============================================================================
"// Vimdiff
"===============================================================================
" ']c' and '[c' to go to next change
" 'do' to get change from other file
" ':diffupdate' update changes
" 'zo' and 'zc' to open or closed wrapped lines
" ':wq' save and go to next file - if using git difftool
" ';s' syntax off

" Change colorscheme when running diff, to visualize white spaces
" if &diff
"   colorscheme desert
" endif

" Toogle syntax for better diff visualization
" The exists() function determines whether a variable with the name specified by
" the string (in this case, the global variable g:syntax_on) has been defined.
" If so, the if statement executes a syntax off; otherwise it executes a syntax
" enable. Because syntax enable defines the g:syntax_on variable, and syntax off
" undefines it
function! ToggleSyntax()
  if exists("g:syntax_on")
    syntax off
  else
    syntax enable
  endif
endfunction

nmap <silent> ;s :call ToggleSyntax()<CR>

function! TurnOffDiffSyntax()
  if &diff
    syntax off
    ""call ToggleSyntax()
  endif
endfunction

autocmd BufEnter * call TurnOffDiffSyntax()

" set diffopt+=inline
" set diff vertical"
set diffopt+=vertical

"===============================================================================
"// Vimdiff 3-way merge
"===============================================================================
" select remote change
noremap <silent> mr :diffg RE <CR>
" select base change
noremap <silent> mb :diffg BA <CR>
" select local change
noremap <silent> ml :diffg LO <CR>

"===============================================================================
"// Remove all trailing whitespace by pressing F5
"===============================================================================
":let _s=@/ stores the last search term ()from the macro @/) in the variable
"_s
"<Bar> Functions as a pipe symbol | to separate commands, however | would end
"a command in this context, so <Bar> must be used instead.
":%s/\s\+$//e searches for trailing whitespace and deletes it everywhere in
"the buffer ()see CarpetSmoker's answer for a detailed breakdown of this
"expression)
"let @/=_s restores your last search term to the macro @/, so that it will be
"available the next time you hit n.
"<CR> ends the mapping
"nnoremap <silent> ds :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>:noh<CR>
"      \:echo \"removed trailing characters\"<CR>

nnoremap <silent> ds :call RemoveTrailingSpaces()<CR>

function RemoveTrailingSpaces()
  let l:save = winsaveview()
  %s/\s\+$//e
  call winrestview(l:save)
endfunction

" remove trailing characters when saving the buffer or exiting
autocmd BufWritePre *.h,*.hpp,*.c,*.cpp,*.py call RemoveTrailingSpaces()

"===============================================================================
"// ConqueGdb, debugger
"===============================================================================
" Type :ConqueGdb, and type in gdb session $file out, where out is the binary
" to analyze, and then $run. The former commands are necessary to be run
" before starting debugging
"
" switch to the code window and type:
" \r  to run, can be called in the middle of an already session to start again
" \b  to set break point or toggle break point
" \s  step in
" \f  step out
" \c  to continue
" \n  next line
" \p  to print values, hover over the value and type \p to show value
"   it prints C++ private members
"
" switch to gdb session to type more commands
" read the .vim/doc/conque_gdb.txt for more info
noremap gdb :ConqueGdb<CR>

"===============================================================================
"// airline plug in, show the status bar
"===============================================================================
" display bar
set laststatus=2
let g:airline_theme='term'
" hide right columns
let b:airline_whitespace_checks = ['']
" hide string
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'

"===============================================================================
"// Set tab and numbers, tab is 2 spaces
"===============================================================================
" Copy indent from current line, over to the new line
set autoindent
" exe "set tabstop=2 shiftwidth=2 expandtab"
exe "set tabstop=4 shiftwidth=4 expandtab"
set number

"===============================================================================
"// ctags mappings, to find defintions in C++ files, CTRL+] to go to
"// definition, g + ] to show list when there's more than one match, CTRL+t to
"// return, CTRL + y to update tags
"===============================================================================
noremap <C-y> :exe "! ctags -R ."<CR><CR>

"===============================================================================
"// AutoClose parenthesis
"===============================================================================
inoremap " ""<left>
inoremap ( ()<left>
inoremap { {}<left>
inoremap [ []<left>
inoremap " ""<left>
inoremap ' ''<left>

" apply remap only for these file extensions
" FileType does not need to have the '*' i.e. *.cpp, as opossed to other autocmd
" commands
""autocmd FileType h,hpp,c,cpp inoremap {<CR> {<CR>}<up><CR>
autocmd FileType h,hpp,c,cpp inoremap {<CR> {<CR>}<up><ESC><S-a><CR>
autocmd FileType h,hpp,c,cpp inoremap {; {};<CR>
autocmd FileType h,hpp,c,cpp inoremap (<CR> ();<CR>
autocmd FileType h,hpp,c,cpp inoremap (; ();<CR>

"===============================================================================
"// Syntastic, syntax checker, type <space> key when in escaped mode to
"// run, also when file is opened or saved
"===============================================================================
" .VimIncludeDirectories file do not include recursively the directories. The
" directories need to be specified in source code - header files the path,
" i.e.  #include <Example/header.h>, where Example is a subdirectory of
" '-IPath/to/Directory' (line in .VimIncludeDirectories file)

""set statusline+=%#warningmsg#
""set statusline+=%{SyntasticStatuslineFlag()}
""set statusline+=%*
""
""let g:syntastic_always_populate_loc_list = 1
""let g:syntastic_auto_loc_list = 1
""let g:syntastic_check_on_open = 1
""let g:syntastic_check_on_wq = 0
""" the below two options are used when there's another checker by default other
""" than g++, i.e. ycm. where this command overwrittes it. If using the command
""" recommend not using cppcheck as it displays too many warnings
"""let g:syntastic_cpp_checkers = ['cppcheck', 'gcc']
""let g:syntastic_cpp_checkers = ["gcc"]
""""let g:syntastic_cpp_compiler = "g++"
""let g:syntastic_cpp_compiler = "clang++"
""let g:syntastic_cpp_compiler_options = '-Wall -Wextra -Werror -lpthread -std=c++2a'
""	""\ -std=c++2a -Wno-pragma-once-outside-header'
""	"\ -fPIC -std=c++14'
""	""\ -fconcepts -std=c++2a -Wno-pragma-once-outside-header'
""let g:syntastic_cpp_check_header = 1
""let g:syntastic_enable_signs = 1
""" "let g:syntastic_cpp_config_file = '~/.vim/IncludeDirectories'
""let g:syntastic_cpp_config_file = './.IncludeDirectories'
""let g:syntastic_cpp_no_include_search = 1
""
""" error window size
""let g:syntastic_loc_list_height = 5
""
""" python
""""let g:syntastic_python_checkers=['flake8', 'pylint']
""""let g:syntastic_python_flake8_post_args='--ignore=E501,E128,E225'
""let g:syntastic_python_checkers=['flake8'] 
""let g:syntastic_python_flake8_args='--ignore=E402,E501,F401,E123,E126,E251,E703,E265,E741,E302,E226,W391,E203,E731,E902,E502,E128'

"===============================================================================
"// Open files with fuzzy typing
"===============================================================================
" CTRL+p to open split to get functionality to start typing to find files.
" CTRL+p to close.
" Use CTRL+j, CTRL+k or the arrow keys to navigate the result list.
" Use CTRL+t, CTRL+v, CTRL+x to open the selected entry in a new tab or in a new
" split.
set runtimepath^=~/.vim/bundle/ctrlp.vim
" overcome limit imposed by max height, increase this number as you need more
" results, note that increasing the number degrades performance to find files
let g:ctrlp_match_window = 'results:50'
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=40

"===============================================================================
"// Nerd tree, opens file directory, type CTRL + a
"===============================================================================
let g:NERDTreeWinSize=20

" close nerd tree if it is the last window to opened"
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") &&
 \ b:NERDTree.isTabTree()) | q | endif

map <silent> <C-a> :NERDTreeToggle<CR>

" open file in a new tab, 'Shift + o'
let NERDTreeMapOpenInTab='<S-o>'

"===============================================================================
"// Open test files, type CTRL + x. Opens .h and .cpp when in _test.cpp, and opens
"// test_.cpp when in .h or .cpp
"===============================================================================
nnoremap <C-x> :call OpenCppHeaderOrTest()<CR>

function! OpenCppHeaderOrTest()
  ""exe "set path=**"
  exe "set path=../../../**"

  let l:filename = fnameescape(expand("%:t:r"))

  if match(l:filename, "_test") != -1
    let l:cpp_filename = substitute(l:filename, "_test", ".cpp", "")
    let l:h_filename = substitute(l:filename, "_test", ".h", "")

    exe "vert sf" l:cpp_filename
    exe "vert sf" l:h_filename
  elseif expand("%:e") == "cpp"
    exe "vert sf" fnameescape(expand("%:t:r")."_test.cpp")
  elseif expand("%:e") == "h"
	  exe "vert sf" fnameescape(expand("%:t:r")."_test.cpp")
  endif
endfunction

"===============================================================================
"// Open .h and .cpp files, type CTRL + z
"===============================================================================
nnoremap <C-z> :call OpenCppOrHeader()<CR>

function! OpenCppOrHeader()
  if expand("%:e") == "cpp"
    exe "vsplit" fnameescape(expand("%:p:r:s?src?include?").".h")
  elseif expand("%:e") == "h"
    exe "vsplit" fnameescape(expand("%:p:r:s?src?include?").".cpp")
  endif
endfunction

"===============================================================================
"// GitGutter
"===============================================================================
" jump between changes ']c' '[c'
" ;diffs show signs
" ;diff show highlighted lines
" ;add stage line
" ;rm untrack line
" ;diffupdate udpate in all files

" turn on/off signs
noremap <silent> ;diffs :GitGutterToggle <CR>
" turn on/off highlight
noremap <silent> ;diff :GitGutterLineHighlightsToggle <CR>
" stage line, equivalent of git add -i, and selecting line
nmap ;add <Plug>GitGutterStageHunk
" untrack change
nmap ;rm <Plug>GitGutterUndoHunk

"units is ms
set updatetime=1000

" suppress the signs when a file has more than 500 changes. As soon as the
" number of changes falls below the limit vim-gitgutter will show the signs
" again.
let g:gitgutter_max_signs = 1000

" update its signs across all visible buffers
noremap <silent> ;diffupdate :GitGutterAll <CR>

" To turn off vim-gitgutter by default
"let g:gitgutter_enabled = 0

" To turn off signs by default, 1 enabled
"let g:gitgutter_signs = 0

" To turn on line highlighting by default
"let g:gitgutter_highlight_lines = 1

" By default diffs are run asynchronously. To run diffs synchronously set the
" variable to 0.
"let g:gitgutter_async = 0

" to open include <file/path/name>
" on any part of the file/path/name type: Ctrl+W CtrlF

"===============================================================================
"// Git
"===============================================================================
nnoremap <silent> gd :call RunGitGd('gd')<CR>
nnoremap <silent> gdx :call RunGitGdx('gd')<CR>
nnoremap <silent> gc :call RunGitGd('gc')<CR>
nnoremap <silent> gcx :call RunGitGdx('gc')<CR>
nnoremap <silent> gm :call RunGitGdx('gm')<CR>
nnoremap <silent> gmx :call RunGitGdx('gm')<CR>
nnoremap <silent> gu :call RunGitGdx('gu')<CR>
nnoremap <silent> gux :call RunGitGdx('gu')<CR>
noremap <silent> gs :call GitStatus() <CR>
noremap <silent> gfa :call GitFetchAll() <CR>
noremap <silent> ga :call GitAddCurrentFile() <CR>
noremap <silent> gcvs :call GitCommit() <CR>
noremap <silent> gca :call GitAmend() <CR>
command! -nargs=* Gn call RunGitGd(<f-args>)
command! -nargs=* Gnx call RunGitGdx(<f-args>)
" save new changes in diff buffers and close them
noremap ;z :w!<CR> :qa <CR>

if &diff
  colorscheme koehler
endif

function! GitCommit()
  execute "!git commit -vs"
endfunction

function! GitAmend()
  execute "!git commit --amend"
endfunction

function! GitStatus()
  execute "!git status"
endfunction

function! GitFetchAll()
  silent execute "!git fetch --all"
  redraw!
endfunction

function! SaveCurrentFile()
  silent execute "wa"
endfunction

function! GitAddCurrentFile()
  let l:file = expand('%')
  if empty(l:file)
    echom "No file to add"
    return
  endif
  silent execute '!git add ' . shellescape(l:file)
  redraw!
endfunction

" Vim attempts to keep the differences updated when you make changes to the
" text.  This mostly takes care of inserted and deleted lines.  Changes within a
" line do not cause the differences to be updated. To force the differences to
" be updated use:
noremap <silent> ;du :diffupdate <CR>

function! GetGitBranch()
  " Get the parent directory of the current file
  let l:dir = expand('%:p:h')
  " Get current git branch, suppressing errors and trimming whitespace
  let l:branch = trim(system('git -C ' . shellescape(l:dir) . ' branch --show-current 2>/dev/null'))
  return l:branch
endfunction

function! IsGitRepo()
  let l:gitroot = system('git rev-parse --show-toplevel 2>/dev/null')
  return v:shell_error == 0
endfunction

function! GetGitCommand(git_diff, arg)
  let l:staged = '.'
  if a:arg == "gd" 
    if a:git_diff == "git diff"
        return [a:git_diff.' --name-only', l:staged]
    else
        return [a:git_diff, l:staged]
    endif
  endif

  " note: vim has a bug, where I cannot use in the below if statements elif
  " when adding it (elif) only the first comparison above works
  if a:arg == "gc" 
    let l:staged = "staged"
    if a:git_diff == "git diff"
        return [a:git_diff.' --cached --name-only', l:staged]
    else
        return [a:git_diff.' --cached', l:staged]
    endif
  endif

  if a:arg == "gm"
    if a:git_diff == "git diff"
        return [a:git_diff.' origin/master --name-only', l:staged]
    else
        return [a:git_diff.' origin/master', l:staged]
    endif
  endif
  
  if a:arg == "gu"
    GitFetchAll()
    if a:git_diff == "git diff"
        return [a:git_diff.' origin'.GetGitBranch().' --name-only', l:staged]
    else
        return [a:git_diff.' origin'.GetGitBranch(), l:staged]
    endif
  endif

  if a:git_diff == "git diff"
      return [a:git_diff.' '.a:arg.' --name-only', l:staged]
  else
      return [a:git_diff.' '.a:arg, l:staged]
  endif
endfunction

function! GetDiffFilenames(command, label)
  call SaveCurrentFile()
  let l:git_output = systemlist(a:command)
  let l:repo_root = systemlist('git rev-parse --show-toplevel')[0]
  let g:git_diff_qf_list = []

  for l:filename in l:git_output
    let l:filename = trim(l:filename)
    let l:absolute_path = fnamemodify(l:repo_root . '/' . l:filename, ':p')
    if filereadable(l:absolute_path)
      call add(g:git_diff_qf_list, {
            \ 'filename': l:absolute_path,
            \ 'lnum': 1,
            \ 'col': 1,
            \ 'text': a:label 
            \ })
    endif
  endfor
endfunction

function! IsValid(arg)
  if (!IsGitRepo()) 
    echom "not a git repo"
    return v:false 
  endif

  let l:command_stage = GetGitCommand('git diff', a:arg)
  call GetDiffFilenames(l:command_stage[0], l:command_stage[1])
  if !exists('g:git_diff_qf_list') || empty(g:git_diff_qf_list)
    echom "empty files to diff"
    return v:false 
  endif

  return v:true 
endfunction

function! RunGitGd(arg)
  if !IsValid(a:arg)
    return
  endif
  let l:command_stage = GetGitCommand('git difftool', a:arg)
  silent execute "!".l:command_stage[0]
  redraw!
endfunction

function! RunGitGdx(arg)
  if !IsValid(a:arg)
    return
  endif
  let g:command_stage = GetGitCommand('git difftool', a:arg)
  call setqflist(g:git_diff_qf_list, 'r')
  copen
endfunction

augroup GitDiffQFEnter
  autocmd!
  autocmd FileType qf call s:MapGitQFEnter()
augroup END

function! s:MapGitQFEnter()
  nnoremap <silent><buffer> <CR> :call ShowGitDiffFromQF()<CR>
endfunction

function! ShowGitDiffFromQF()
  if !exists('g:git_diff_qf_list') || empty(g:git_diff_qf_list)
    echom "empty files to diff"
    return
  endif

  if !exists('g:command_stage')
    throw "missing variable"
  endif

  let l:idx = line('.') - 1
  if l:idx < 0 || l:idx >= len(g:git_diff_qf_list)
    throw "Invalid index"
  endif

  let l:item = g:git_diff_qf_list[l:idx]
  let l:file = get(l:item, 'filename', '')
  if empty(l:file) || !filereadable(l:file)
    return
  endif

  let l:label = get(l:item, 'text', '')
  if l:label == "staged"
    silent execute "!".g:command_stage[0] . " --cached HEAD -- " . l:file
  else 
    silent execute "!".g:command_stage[0] . " -- " . l:file
  endif
  redraw!
endfunction

"===============================================================================
"// Gitk
"===============================================================================
" :Gk <branch> // git log <master>
" gk           // git log origin/master..HEAD
" gka          // gitk --all
" ;c           // tabclose and expand fold, use with gitk
" ;k           // refresh gitkm
" ;ka          // refresh gitk --all

" to be used by manually diff'ing two branches in vim or command line
command -nargs=1 Gk call DisableExpandFold() | Gitv <f-args>

noremap <silent> gka :exe "Gk --all" <CR>

" Make sure for the below commands the first argument for Gitk is a branch which
" comes before the second argument branch. That is Gitk HEAD..HEAD~1 will not
" work as the first argument HEAD is after HEAD~1 commit wise. It must be Gitk
" HEAD~1..HEAD.

" Gitv with master
noremap <silent> gk :exe "Gk origin/master..HEAD" <CR>

" tab close, expand fold when returning from Gitk (for new buffers)
noremap ;c :tabclose <CR> :call ExpandFold() <CR>

" refresh Gitv
noremap <silent> ;k :exe "normal gk" <CR> :tabonly <CR>
noremap <silent> ;ka :exe "normal gka" <CR> :tabonly <CR>

"===============================================================================
"// Grammar check
"===============================================================================
" ';gt' start checking, run Grammarous only once, does not work correctly when
"   run multiple times
" 'ge' toggle, does not run Grammarous
" ']s' next finding
" '[s' prior finding
" z=, hover over word to see options to fix word

" start checking
nnoremap <silent> ;gt :set spell<CR> :echo "running grammar check"<CR>
      \:GrammarousCheck<CR> :call UnmapGt()<CR> :echo "grammar check done"<CR>

" end checking, commented out for performance
" autocmd VimEnter * call MapGe()

let g:grammarous#use_vim_spelllang = 1

" Only display grammar check in code comments
let g:grammarous#default_comments_only_filetypes = {
   \ '*' : 1, 'help' : 0, 'markdown' : 0,
   \ }

" Disable grammar check for following rules
let g:grammarous#disabled_rules = {
  \ '*' : ['WHITESPACE_RULE', 'EN_QUOTES'],
  \ 'help' : ['WHITESPACE_RULE', 'EN_QUOTES', 'SENTENCE_WHITESPACE', 'UPPERCASE_SENTENCE_START'],
  \ }

" Use mappings only after starting GrammarousCheck

let g:grammarous#hooks = {}
function! g:grammarous#hooks.on_check(errs) abort
  nmap ]s <Plug>(grammarous-move-to-next-error)
  nmap [s <Plug>(grammarous-move-to-previous-error)
  nmap ge <Plug>(grammarous-reset)
endfunction

function! g:grammarous#hooks.on_reset(errs) abort
  nunmap ]s
  nunmap [s
  call MapGe()
endfunction

function! MapGe()
  noremap <silent> ge :setlocal spell!<CR>
endfunction

" Only used it once, since calling GrammarCheck again leads to an error
function! UnmapGt()
  nunmap ;gt
endfunction

"===============================================================================
"// Update screen
"===============================================================================
noremap <silent> ;u :exe "normal ;diffupdate"<CR> :exe "normal ;du" <CR>

"===============================================================================
"// C++ standards
"===============================================================================
" ;std11
" ;std14
" ;std17
" .std // Highlighted word is searched in the standard. The search matches
"      // the highlighted number with a document section starting with '§' +
"      // number
function! OpenStandard(argument)
  exe "tabnew"
  exe "Pdf ".a:argument
  exe "only"
endfunction

noremap <silent> ;std11 :call OpenStandard(
      \"~/Development/Software/C++/Documents/C++11Standard.pdf") <CR>

noremap <silent> ;std14 :call OpenStandard(
      \"~/Development/Software/C++/Documents/C++14Standard.pdf") <CR>

noremap <silent> ;std17 :call OpenStandard(
      \"~/Development/Software/C++/Documents/C++17Standard.pdf") <CR>

command! -nargs=1 Std exe "/§ ".<f-args>

function! SearchStdSelection()
  let l:selection = s:GetVisualSelection()
  exe "Std ".l:selection
endfunction

noremap <silent> .std :call SearchStdSelection() <CR>

"===============================================================================
"// Vim colors
"===============================================================================
""solarized for command line, use insted guake colors
""http://www.webupd8.org/2011/04/solarized-must-have-color-paletter-for.html

function! SetColorsOther()
  ""set term=xterm-256color
  ""set background=light
  ""let g:solarized_use16=1
  let g:solarized_termcolors=256
  set t_Co=256
  set background=dark
  colorscheme solarized

  ""http://www.calmar.ws/vim/256-xterm-24bit-rgb-color-chart.html
  ""This one is better: https://vim.fandom.com/wiki/Xterm256_color_names_for_console_Vim?file=Xterm-color-table.png

  ""syn match    cCustomParen    "(" contains=cParen,cCppParen
  ""syn match    cCustomFunc     "\w\+\s*(" contains=cCustomParen
  ""syn match    cCustomScope    "::"
  syn match cCustomScopes  "\w\+\s*::" contains=cCustomScope

  hi Constant ctermfg=160
  hi Boolean ctermfg=11
  "hi Boolean ctermfg=184
  hi Statement ctermfg=70
  hi Operator ctermfg=70
  hi Special ctermfg=171
  hi Type ctermfg=11
  ""hi Type ctermfg=184
  hi PreProc ctermfg=208
  hi cCustomScopes ctermfg=175
  hi cPreCondit ctermfg=104
  hi cPreConditMatch ctermfg=104
  hi cDefine ctermfg=104
  hi cInclude ctermfg=208
  hi cppStructure ctermfg=70
  hi VimAuGroup ctermfg=214
  hi VimGroup ctermfg=214
  hi VimHiGroup ctermfg=214
  hi VimIsCommand ctermfg=70
  hi VimCommand ctermfg=70
  hi VimFuncBody ctermfg=253
  hi LineNr ctermfg=240
endf

function! SetColors()
  ""set term=xterm-256color
  ""set background=light
  ""let g:solarized_use16=1
  let g:solarized_termcolors=256
  set t_Co=256
  set background=dark
  colorscheme solarized

  ""http://www.calmar.ws/vim/256-xterm-24bit-rgb-color-chart.html
  ""This one is better: https://vim.fandom.com/wiki/Xterm256_color_names_for_console_Vim?file=Xterm-color-table.png

  ""syn match    cCustomParen    "(" contains=cParen,cCppParen
  ""syn match    cCustomFunc     "\w\+\s*(" contains=cCustomParen
  ""syn match    cCustomScope    "::"
  syn match cCustomScopes  "\w\+\s*::" contains=cCustomScope

  hi Constant       ctermfg=196
  hi Boolean        ctermfg=226
  hi Statement      ctermfg=76
  hi Operator       ctermfg=76
  hi Special ctermfg=171
  hi Type           ctermfg=226
  if !&diff
    hi cCustomScopes  ctermfg=219
  endif
  hi cPreCondit     ctermfg=196
  hi cDefine        ctermfg=196
  hi cInclude       ctermfg=208
  hi cppStructure   ctermfg=76
  hi VimAuGroup ctermfg=214
  hi VimGroup       ctermfg=214
  hi VimHiGroup     ctermfg=214
  hi VimIsCommand ctermfg=76
  hi VimCommand     ctermfg=76
  hi VimFuncBody    ctermfg=253
  hi LineNr         ctermfg=251
  hi DiffAdd        ctermfg=80  ctermbg=237  
  hi DiffDelete     ctermfg=9   ctermbg=237  
  hi DiffChange     ctermfg=253 ctermbg=237  
  hi DiffText       ctermfg=207 ctermbg=237  
  ""hi DiffAdd        ctermfg=10 ctermbg=237 cterm=bold 
  ""hi DiffDelete     ctermfg=9  ctermbg=237 cterm=bold 
  ""hi DiffChange     ctermfg=11 ctermbg=237 cterm=bold 
  ""hi DiffText       ctermfg=10 ctermbg=237 cterm=bold 
endf

"===============================================================================
"// Highlight colors
"===============================================================================
";h show highlight group to change the color
"!sb set to bright colors
"!sd set to daylight colors
"!sn set to evening colors

" hover over part of the code and type Shift+o and will show what highlight
" group it belongs to."
""nnoremap ;h :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name")
""      \. '> trans<' . synIDattr(synID(line("."),col("."),0),"name") .">
""      \lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") \
""      \. ">"<CR>

nnoremap ;h :call SynStack() <CR>

" hover over part of the code and show what highlight group it belongs to."
function! SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

noremap ;sb :call SetBright() <CR>
noremap ;sd :call SetDay() <CR>
noremap ;sn :call SetEvening() <CR>

"external file for variable definitions, g:l_<variable_name>"
source ~/.config.vim

function SetColorOpen()
  if (g:l_color_type == "bright") 
    call SetBright()
  elseif (g:l_color_type == "day") 
    call SetDay()
  else   
    call SetEvening()
  endif   
endf

autocmd VimEnter * call SetColorOpen()
autocmd BufWinEnter * call SetColorOpen()
autocmd WinEnter * call SetColorOpen()
autocmd BufWinLeave * call SetColorOpen()


""autocmd BufWinLeave * call SetColors() | call SetDay()

function SetBright()
  call SetColors()
  hi Normal ctermbg=238
  hi Normal ctermfg=255
  hi Comment ctermfg=250
endf

function SetDay()
  call SetColors()
  ""hi Normal ctermbg=236
  hi Normal ctermbg=237
  hi Normal ctermfg=7
  hi Comment ctermfg=247
endf

function SetEveningOther()
  call SetColors()
  hi Normal ctermbg=235
  hi Normal ctermfg=7
  hi Comment ctermfg=245
endf

function SetEvening()
  call SetColors()
  hi Normal ctermbg=0
  hi Normal ctermfg=254
  hi Comment ctermfg=248
endf

" Highlight lines more than 80 characters long
function! HighlightOverLength()
 let g:file_extension = expand("%:e")

 if (g:file_extension == "h" || g:file_extension == "cpp")
   " autocmd BufWinEnter *.h,*.hpp,*.c,*.cpp highlight OverLength ctermbg=46 ctermfg=124 guibg=7
   autocmd BufWinEnter *.h,*.hpp,*.c,*.cpp highlight OverLength ctermbg=46 ctermfg=124
   autocmd BufWinEnter *.h,*.hpp,*.c,*.cpp match OverLength /\%81v.\+/
   " Set to 80 columns, to use 'gq' command to break lines
   autocmd BufWinEnter *.h,*.hpp,*.c,*.cpp set textwidth=80
 endif
endfunction

" call HighlightOverLength()

" Highlight trailing whitespaces in the file
" Executes command once vim has finished initializing, see
" https://stackoverflow.com/questions/6821033/vim-how-to-run-a-command-immediately-when-starting-vim
" The 2match is to add a match including OverLength, change to only match to
" disable OverlLength
autocmd BufWinEnter * highlight ExtraWhitespace ctermbg=blue guibg=red
autocmd BufWinEnter * 2match ExtraWhitespace /\s\+$/

"===============================================================================
"// Debug
"===============================================================================
" use this to debug, the larger the number, the deeper it shows debuggin info,
" max 15
""set verbose=1

let g:syntastic_enable_highlighting=1

"===============================================================================
"// Code coverage
"===============================================================================
" Synapsis:
" cov Shows marks for a single file in a cmake project
" scov Shows marks for a single file
"
" cov:
" 1. Add cmake settings to project as described in Vim/project file
" 2. Run unit tests
" 3. Run '$wcov <path to Build directory>', it will show a w3m browser for all
" project coverage (lcov). Run the command from a directory other than Source
" as it will create files and directories with coverage
" 4. Close w3m browser and open any file in vim from any directory that
" includes a .vim/CovBuildPath in directory, e.g. project root directory '$cd
" <project_name>/Source/ & vim Example/file.cpp', and type 'cov' to view
" coverage. Type again to turn off marks (signs)
"
" scov:
" 1. Compile with '-g -O0 --coverage -fprofile-arcs -ftest-coverage' flags.
" Note that you can run with -O1, -O2, etc. as well, use the one that is
" needed for the project. Compiling will create .gcno files (compile time)
" 2. Run executable, it will create .gcda files (run-time) files in each
" source directory. These files are needed to create .gcov files (the files
" with results)
" 3. Type in vim 'scov' to view coverage, it will create .gcov files. Type
" again to turn off marks (signs)
"
" Alternative:
" To clean files generated by lcov and gcov in source directory type
" '$~/local/bin/clean', this command is already exported in PATH, '$clean'.
"
" NB: gcov provides coverage for the code that was built by compiler only. In
" other words if there were functions that were not called in the source code,
" but compiler optimized that code since it was nevered used, the coverage
" will not show those sections of the code as missing to be covered.
" Also, lcov is the gui for gcov.

" shows marks at the beginning of the line, before the line numbers"
function! ShowSigns(type)
  if exists("g:show_cov")
    " clear marks"
    exec "sign unplace *"
    unlet g:show_cov
  else
    let l:filename = fnameescape(expand("%:t"))

    " create .gcov files
    if (a:type == "cmake") 
      silent exec "!cmakecov ".l:filename
    else
      silent exec "!cov"
    endif   

    " press Enter automatically for prompt, after running above command"
    call feedkeys(" ")

    " load coverage in file
    exec "GcovLoad ".l:filename.".gcov"
    exec "!rm ".l:filename.".gcov"

    " need it to refresh vim buffer to show correct marks
    exec "normal \<S-g>" 
    exec "normal gg" 
    let g:show_cov = ""
  endif
endfunction

noremap cov :call ShowSigns("cmake")<CR>
noremap scov :call ShowSigns("file")<CR>

let g:gcov_marker_covered = '✓'
""let g:gcov_marker_uncovered = '✘'
let g:gcov_marker_uncovered = '.'

" The GcovFind command needs to know where to look for the .gcov files. The
" variable takes a comma seperated list of folders. This variable is utilized
" by GcovFind command

" let g:gcov_marker_path = "/home/diego/.cov"

" By default, the plugin opens the location list once uncovered lines are
" published. This behavior can be changed by setting the global variable
" below. Note that the uncovered lines will always be published to the
" location list.

let g:gcov_marker_auto_lopen = 0

" Command :lopen can be used to display the list of uncovered lines in the
" location list.

"===============================================================================
"// Esc
"===============================================================================
inoremap jk <Esc>:wa!<CR>
inoremap fd <Esc>:wa!<CR>

"===============================================================================
"// Last commands
"===============================================================================
" make sure when hitting enter in terminal mode it does not change tabs,
" instead just works as regular enter, needs to be the last command as there
" is a mapping somwhere that needs to be investigated, even though 
" :verbose tmap <CR> shows empty
silent! tunmap <CR>

"===============================================================================
"// TODO
"===============================================================================
"fix bug to run on other machines, thread error
"syntax off when running gd, gdd, etc
"edit file when running gdc, git diff --cached
"clone repos to build custom vim
"Add an architecture design
"https://opensource.google.com/projects/vim-plugins
"1. fix opening .h, .cpp and test files automatically for specific situations
"Add doxygen plugin https://github.com/LucHermitte/lh-cpp/blob/master/doc/Doxygen.md
"work with mxsessions
"vim refactor plugin
"clang indexer (ctags equivalent)
"class browser
"static and dynamic analyzers
"instrumentation and sampling profiler / benchmark
"have local_vimrc for different projects

"pending"
"- Language server
"- cgrep
"- run binary async and return automatically to code with status of result
"- vim gdb instructions
"
