"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Important:
"       This requires that you install https://github.com/amix/vimrc !
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""
" => Load pathogen paths
""""""""""""""""""""""""""""""
let s:vim_runtime = expand('<sfile>:p:h')."/.."
call pathogen#infect(s:vim_runtime.'/sources_forked/{}')
call pathogen#infect(s:vim_runtime.'/sources_non_forked/{}')
call pathogen#infect(s:vim_runtime.'/my_plugins/{}')
call pathogen#helptags()


""""""""""""""""""""""""""""""
" => bufExplorer plugin
""""""""""""""""""""""""""""""
let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1
let g:bufExplorerFindActive=1
let g:bufExplorerSortBy='name'
map <leader>o :BufExplorer<cr>


""""""""""""""""""""""""""""""
" => MRU plugin
""""""""""""""""""""""""""""""
let MRU_Max_Entries = 400
map <leader>f :MRU<CR>


""""""""""""""""""""""""""""""
" => YankStack
""""""""""""""""""""""""""""""
let g:yankstack_yank_keys = ['y', 'd']

nmap <C-p> <Plug>yankstack_substitute_older_paste
nmap <C-n> <Plug>yankstack_substitute_newer_paste


""""""""""""""""""""""""""""""
" => CTRL-P
""""""""""""""""""""""""""""""
let g:ctrlp_working_path_mode = 0

" Quickly find and open a file in the current working directory
let g:ctrlp_map = '<C-f>'
map <leader>j :CtrlP<cr>

" Quickly find and open a buffer
map <leader>b :CtrlPBuffer<cr>

" Quickly find and open a recently opened file
map <leader>f :CtrlPMRU<CR>

let g:ctrlp_max_height = 20
let g:ctrlp_custom_ignore = 'node_modules\|^\.DS_Store\|^\.git\|^\.coffee|^\.clangd\|deps'
let g:ctrlp_lazy_update = 350


""""""""""""""""""""""""""""""
" => ZenCoding
""""""""""""""""""""""""""""""
" Enable all functions in all modes
let g:user_zen_mode='a'


""""""""""""""""""""""""""""""
" => snipMate (beside <TAB> support <CTRL-j>)
""""""""""""""""""""""""""""""
ino <C-j> <C-r>=snipMate#TriggerSnippet()<cr>
snor <C-j> <esc>i<right><C-r>=snipMate#TriggerSnippet()<cr>


""""""""""""""""""""""""""""""
" => Vim grep
""""""""""""""""""""""""""""""
let Grep_Skip_Dirs = 'RCS CVS SCCS .svn generated'
set grepprg=/bin/grep\ -nH


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Nerd Tree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDTreeWinPos = "right"
let NERDTreeShowHidden=0
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let g:NERDTreeWinSize=35
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark<Space>
map <leader>nf :NERDTreeFind<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-multiple-cursors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:multi_cursor_use_default_mapping=0

" Default mapping
let g:multi_cursor_start_word_key      = '<C-s>'
let g:multi_cursor_select_all_word_key = '<A-s>'
let g:multi_cursor_start_key           = 'g<C-s>'
let g:multi_cursor_select_all_key      = 'g<A-s>'
let g:multi_cursor_next_key            = '<C-s>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => surround.vim config
" Annotate strings with gettext
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vmap Si S(i_<esc>f)
au FileType mako vmap Si S"i${ _(<esc>2f"a) }<esc>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => lightline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ ['mode', 'paste'],
      \             ['fugitive', 'readonly', 'filename', 'modified'] ],
      \   'right': [ [ 'lineinfo' ], ['percent'] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"🔒":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*FugitiveHead")?FugitiveHead():""}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*FugitiveHead") && ""!=FugitiveHead())'
      \ },
      \ 'separator': { 'left': ' ', 'right': ' ' },
      \ 'subseparator': { 'left': ' ', 'right': ' ' }
      \ }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vimroom
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:goyo_width=100
let g:goyo_margin_top = 2
let g:goyo_margin_bottom = 2
nnoremap <silent> <leader>z :Goyo<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ale (syntax checker and linter)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  let g:ale_linters = {
"  \   'javascript': ['jshint'],
"  \   'python': ['flake8'],
"  \   'go': ['go', 'golint', 'errcheck']
"  \}
"
"  nmap <silent> <leader>a <Plug>(ale_next_wrap)
"
"  " Disabling highlighting
"  let g:ale_set_highlights = 0
"
"  " Only run linting when saving the file
"  let g:ale_lint_on_text_changed = 'never'
"  let g:ale_lint_on_enter = 0


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Git gutter (Git diff)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:gitgutter_enabled=1
nnoremap <silent> <leader>d :GitGutterToggle<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Confortable motion
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:loaded_comfortable_motion = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Latex Changes
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:polyglot_disabled=['latex']
let g:vimtex_view_general_viewer="Chrome.exe"
let maplocalleader="'"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Python Changes
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:pymode_rope_completion = 1
let g:pymode_rope_completion_bind = '<C-Space>'
let g:pymode_rope = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General config for completion
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set completeopt=menuone,noinsert

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Deoplete
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"call deoplete#custom#source('_', 'matchers', ['matcher_full_fuzzy'])
"call deoplete#custom#option({
"			\'ignore_case': v:true,
"			\'complete_method':"omnifunc"
"			\})

"let g:deoplete#enable_at_startup = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => LanguageClientVim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set hidden

"  set completefunc=LanguageClient#complete
"  let g:LanguageClient_serverCommands = {
"      \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
"      \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
"      \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
"      \ 'python': ['/usr/local/bin/pyls'],
"      \ 'ruby': ['~/.rbenv/shims/solargraph', 'stdio'],
"      \ 'cpp': ['/home/jj/.vscode-server/data/User/globalStorage/llvm-vs-code-extensions.vscode-clangd/install/10.0.0/clangd_10.0.0/bin/clangd', '-compile-commands-dir=build', '-background-index', '--clang-tidy', '--fallback-style=none' ],
"  \ }
"
"  let g:LanguageClient_rootMarkers = {
"  \ 'cpp': ['compile_commands.json', 'build'],
"  \ }

"  " note that if you are using Plug mapping you should not use `noremap` mappings.
"  nmap <F5> <Plug>(lcn-menu)
"  " Or map each action separately
"  nmap <silent>K <Plug>(lcn-hover)
"  nmap <silent> gd <Plug>(lcn-definition)
"  nmap <silent> <F2> <Plug>(lcn-rename)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => LSP
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:lsp_virtual_text_enabled = 0
let g:lsp_textprop_enabled = 0
let g:lsp_documentation_float = 0

let g:lsp_settings = {
    \ 'clangd': {
    \     'cmd': [
    \         '/home/jj/.vscode-server/data/User/globalStorage/llvm-vs-code-extensions.vscode-clangd/install/10.0.0/clangd_10.0.0/bin/clangd',
    \         '-header-insertion=never',
    \         '-background-index',
    \         '--fallback-style=none'
    \     ],
    \ },
\ }

function! s:DisableDiagnostics()
    let g:lsp_diagnostics_were_enabled = get(g:, 'lsp_diagnostics_enabled', 0)
    let g:lsp_diagnostics_enabled = 0
endfunction

function! s:RestoreDiagnostics()
    let g:lsp_diagnostics_enabled = get(g:, 'lsp_diagnostics_were_enabled', 0)
endfunction

augroup lsp_lazy_diagnostics
    autocmd!
    autocmd InsertEnter * call s:DisableDiagnostics()
    autocmd InsertLeave * call s:RestoreDiagnostics()
augroup end

set omnifunc=syntaxcomplete#Complete

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => GitGutter
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" default updatetime 4000ms is not good for async update
set updatetime=300

highlight GitGutterDelete guifg=#ff2222

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VimInspector
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vimspector_enable_mappings = 'HUMAN'

" Asyncomplete config
let g:asyncomplete_smart_completion = 1
let g:asyncomplete_auto_popup = 1
let g:asyncomplete_remove_duplicates = 1
let g:asyncomplete_popup_delay = 200

inoremap <expr> <C-j> pumvisible() ? "\<Down>" : "n"
inoremap <expr> <C-k> pumvisible() ? "\<Up>" : "p"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => YouCompleteMe
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"  let g:ycm_language_server =
"    \ [
"    \   {
"    \     'name': 'yaml',
"    \     'cmdline': [ '/path/to/yaml/server/yaml-language-server', '--stdio' ],
"    \     'filetypes': [ 'yaml' ]
"    \   },
"    \   {
"    \     'name': 'rust',
"    \     'cmdline': [ 'ra_lsp_server' ],
"    \     'filetypes': [ 'rust' ],
"    \     'project_root_files': [ 'Cargo.toml' ]
"    \   },
"    \   {
"    \     'name':'clangd',
"    \     'cmdline': [
"    \         '/home/jj/.vscode-server/data/User/globalStorage/llvm-vs-code-extensions.vscode-clangd/install/10.0.0/clangd_10.0.0/bin/clangd',
"    \         '-header-insertion=never',
"    \         '-background-index',
"    \         '--fallback-style=none'
"    \     ],
"    \     'filetypes': [ 'cpp' ]
"    \   }
"    \ ]
"
"  set omnifunc=syntaxcomplete#Complete

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => GitGutter
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" default updatetime 4000ms is not good for async update
set updatetime=300

highlight GitGutterDelete guifg=#ff2222

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VimInspector
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:vimspector_enable_mappings = 'HUMAN'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => COC
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " TextEdit might fail if hidden is not set.
" set hidden
"
" " Some servers have issues with backup files, see #649.
" set nobackup
" set nowritebackup
"
" " Give more space for displaying messages.
" set cmdheight=2
"
" " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" " delays and poor user experience.
" set updatetime=300
"
" " Don't pass messages to |ins-completion-menu|.
" set shortmess+=c
"
" " Always show the signcolumn, otherwise it would shift the text each time
" " diagnostics appear/become resolved.
" if has("patch-8.1.1564")
"   " Recently vim can merge signcolumn and number column into one
"   set signcolumn=number
" else
"   set signcolumn=yes
" endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-lsp-cxx-highlight
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" let g:lsp_cxx_hl_use_text_props = 1
