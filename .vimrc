if has("vim_starting")
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand("~/.vim/bundle/"))

NeoBundleFetch "Shougo/neobundle.vim"

NeoBundle "Shougo/neocomplete.vim"
NeoBundle "Shougo/unite.vim"
NeoBundle "Shougo/vimproc.vim", { "build": { "linux": "make" } }
NeoBundle "Yggdroot/indentLine"
NeoBundle "cohama/vim-hier"
NeoBundle "dannyob/quickfixstatus"
NeoBundle "eagletmt/ghcmod-vim"
NeoBundle "elzr/vim-json"
NeoBundle "itchyny/lightline.vim"
NeoBundle "osyo-manga/vim-watchdogs"
NeoBundle "osyo-manga/shabadou.vim"
NeoBundle "thinca/vim-quickrun"

call neobundle#end()

filetype plugin indent on

NeoBundleCheck


" lightline.vim
let g:lightline = { "colorscheme": "solarized" }

" vim-watchdogs
let g:watchdogs_check_BufWritePost_enable = 1
let g:watchdogs_check_BufWritePost_enables = { "haskell": 0 }
let g:watchdogs_check_BufWritePost_enable_on_wq = 0

let g:quickrun_config = {
\   "_": {
\       "outputter": "quickfix",
\       "runner": "vimproc",
\       "runner/vimproc/updatetime": 10
\   },
\   "c/watchdogs_checker": { "type": "watchdogs_checker/clang" },
\   "cpp/watchdogs_checker": { "type": "watchdogs_checker/clang++" },
\   "d/watchdogs_checker": { "type": "watchdogs_checker/dmd" },
\   "python/watchdogs_checker": { "type": "watchdogs_checker/flake8" },
\   "watchdogs_checker/clang": { "cmdopt": "-Wall -Wextra -std=c11 -I./" },
\   "watchdogs_checker/clang++": { "cmdopt": "-Wall -Wextra -std=c++17 -I./" },
\   "watchdogs_checker/dmd": { "cmdopt": "-wi -o- `dub describe --data import-paths`" }
\ }

call watchdogs#setup(g:quickrun_config)

let s:hook = { "name": "clear_quickfix", "kind": "hook" }

function! s:hook.on_normalized(session, context)
    call setqflist([])
endfunction

call quickrun#module#register(s:hook, 1)

unlet s:hook

" ghcmod-vim
autocmd BufWritePost *.hs GhcModCheckAndLintAsync

" vim-json
let g:vim_json_syntax_conceal = 0

" unite.vim
let g:unite_enable_start_insert = 1


syntax on

set autoindent
set cursorline
set colorcolumn=120
set expandtab
set laststatus=2
set list
set listchars=tab:»_,trail:_,extends:»,precedes:«
set nobackup
set nowrap
set number
set relativenumber
set shiftwidth=4
set showtabline=2
set tabstop=4
set title

noremap c :tab sp <CR>
noremap f :UniteWithBufferDir file -buffer-name=file <CR>
noremap m :tabnext <CR>
noremap n <C-W>w
noremap q :quit <CR>
noremap r <C-R>
noremap s :vsplit <CR>
noremap t :tabnew <CR>
noremap w :write <CR>
noremap z :tabprevious <CR>
