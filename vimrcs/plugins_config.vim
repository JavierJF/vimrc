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

if has('nvim')
    call pathogen#infect(s:vim_runtime.'/neovim_only_plugins/{}')
else
    call pathogen#infect(s:vim_runtime.'/vim_only_plugins/{}')
endif

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
" let g:ctrlp_map = '<C-f>'
map <leader>j :CtrlP<cr>

" Quickly find and open a buffer
map <leader>b :CtrlPBuffer<cr>

" Quickly find and open a recently opened file
map <leader>f :CtrlPMRU<CR>

let g:ctrlp_max_height = 20
let g:ctrlp_custom_ignore = 'node_modules\|^\.DS_Store\|^\.git\|^\.coffee|^\.clangd\|deps'
let g:ctrlp_lazy_update = 300


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
      \             ['fugitive', 'readonly', 'filename', 'modified', 'method'] ],
      \   'right': [ [ 'lineinfo' ], ['percent'] ]
      \ },
      \ 'component_function': {
      \   'method': 'NearestMethodOrFunction'
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
      \ 'subseparator': { 'left': ' ', 'right': ' ' },
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
let g:gitgutter_sign_allow_clobber=0
nnoremap <silent> <leader>d :GitGutterToggle<cr>

nnoremap <leader>N :GitGutterNextHunk<cr>
nnoremap <leader>P :GitGutterPrevHunk<cr>

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

if !has('nvim')

let g:lsp_virtual_text_enabled = 0
let g:lsp_textprop_enabled = 0
let g:lsp_documentation_float = 0
let g:lsp_hover_conceal = 0
"let g:lsp_preview_float = 0

let g:lsp_settings = {
    \ 'clangd': {
    \     'cmd': [
    \         '/home/jj/.local/share/vim-lsp-settings/servers/clangd/clangd',
    \         '-header-insertion=never',
    \         '-background-index',
    \         '--fallback-style=none'
    \     ],
    \ },
    \ 'hie': {
    \     'cmd': [
    \         'hie',
    \         '--lsp',
    \     ],
    \     'whitelist': [ 'haskell' ]
    \ },
    \ 'pyls-all': {
    \     'workspace_config': {
    \         'pyls': {
    \             'configurationSources': ['pycodestyle'],
    \             'plugins': {
    \                 'pydocstyle': {'enabled': v:true},
    \                 'pycodestyle': {
    \                     'enabled': v:true,
    \                     'ignore': ["E226", "E302", "E41", "E501", "E305", "E251"],
    \                     'max-line-length': 120,
    \                 },
    \                 'black': {'enable': v:true},
    \                 'autopep8': {'enable': v:true},
    \             }
    \         }
    \     },
    \     'whitelist': [ 'python' ]
    \ }
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
    autocmd InsertEnter * call lsp#activate()
    autocmd InsertLeave * call s:RestoreDiagnostics()
    autocmd InsertEnter * call lsp#activate()
augroup end

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect
set completeopt-=preview

" Avoid showing message extra message when using completion
set shortmess+=c

else

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect
set completeopt-=preview

" Avoid showing message extra message when using completion
set shortmess+=c

let g:diagnostic_enable_virtual_text = 0
let g:completion_enable_auto_hover = 0
let g:completion_enable_auto_signature = 0

lua <<EOF
require'nvim_lsp'.gopls.setup{}
require'nvim_lsp'.clangd.setup{on_attach=
  function (options)
    require'diagnostic'.on_attach(options)
    require'completion'.on_attach(options)
  end
}
EOF

" LSP completion per file for NVIM
"autocmd Filetype python  setlocal omnifunc=v:lua.vim.lsp.omnifunc
"autocmd Filetype cpp     setlocal omnifunc=v:lua.vim.lsp.omnifunc
"autocmd Filetype haskell setlocal omnifunc=v:lua.vim.lsp.omnifunc
"autocmd Filetype c       setlocal omnifunc=v:lua.vim.lsp.omnifunc

endif

if has('nvim')
    " nnoremap <A-h> :LspHover <cr>
    " nnoremap <A-d> :LspDefinition <cr>
    " nnoremap <A-i> :LspDeclaration <cr>
    " nnoremap <A-r> :LspReferences <cr>

    nnoremap è <cmd>lua vim.lsp.buf.hover()<CR>
    nnoremap é <cmd>lua vim.lsp.buf.definition()<CR>
    nnoremap ä <cmd>lua vim.lsp.buf.implementation()<CR>
    nnoremap ò <cmd>lua vim.lsp.buf.references()<CR>

    nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
    nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
    nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
    nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
    nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>
else
    nnoremap è :LspHover <cr>
    nnoremap é :LspDefinition <cr>
    nnoremap ä :LspDeclaration <cr>
    nnoremap ò :LspReferences <cr>
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => GitGutter
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" default updatetime 4000ms is not good for async update
set updatetime=200

highlight GitGutterDelete guifg=#ff2222

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VimInspector
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vimspector_enable_mappings = 'HUMAN'

" Asyncomplete config
let g:asyncomplete_smart_completion = 1
let g:asyncomplete_auto_popup = 0
let g:asyncomplete_remove_duplicates = 1
let g:asyncomplete_popup_delay = 200

inoremap <expr> <C-j> pumvisible() ? "\<Down>" : "n"
inoremap <expr> <C-k> pumvisible() ? "\<Up>"   : "p"
inoremap <expr> <cr>  pumvisible() ? "\<C-y>"  : "\<cr>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ asyncomplete#force_refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vista.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" How each level is indented and what to prepend.
" This could make the display more compact or more spacious.
" e.g., more compact: ["▸ ", ""]
" Note: this option only works the LSP executives, doesn't work for `:Vista ctags`.
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]

" Executive used when opening vista sidebar without specifying it.
" See all the avaliable executives via `:echo g:vista#executives`.
" let g:vista_default_executive = 'vim_lsp'

" Set the executive for some filetypes explicitly. Use the explicit executive
" instead of the default one for these filetypes when using `:Vista` without
" specifying the executive.

if !has("nvim")

let g:vista_executive_for = {
  \ 'c': 'vim_lsp',
  \ 'cpp': 'vim_lsp',
  \ 'python': 'vim_lsp',
  \ 'php': 'vim_lsp',
  \ 'haskell': 'vim_lsp',
  \ }

else

let g:vista_executive_for = {
  \ 'c': 'nvim_lsp',
  \ 'cpp': 'nvim_lsp',
  \ 'python': 'nvim_lsp',
  \ 'php': 'nvim_lsp',
  \ 'haskell': 'nvim_lsp',
  \ }

endif

"                    NO CTAGS FOR NOW
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Declare the command including the executable and options used to generate ctags output
" for some certain filetypes.The file path will be appened to your custom command.
" For example:
" let g:vista_ctags_cmd = {
"       \ 'haskell': 'hasktags -x -o - -c',
"       \ }
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" To enable fzf's preview window set g:vista_fzf_preview.
" The elements of g:vista_fzf_preview will be passed as arguments to fzf#vim#with_preview()
" For example:
let g:vista_fzf_preview = ['right:50%']
let g:vista_sidebar_width = 60

function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction

set statusline+=%{NearestMethodOrFunction()}

" By default vista.vim never run if you don't call it explicitly.
"
" If you want to show the nearest function in your statusline automatically,
" you can add the following line to your vimrc
autocmd VimEnter * call vista#RunForNearestMethodOrFunction()

nnoremap <leader>v :Vista!!<cr>

