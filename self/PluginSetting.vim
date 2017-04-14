set wildignore+=*/tmp/*,*.so,*.swp,*.zip

" Configure CtrlP and CtrlPFunky
map <Leader>p :CtrlPMixed<CR>
map <Leader>pf :CtrlPFunky<CR>

let g:ctrlp_funky_syntax_highlight = 1
let g:ctrlp_extensions = ['funky']

" EasyMotion
let g:EasyMotion_smartcase = 1
map <Leader> <Plug>(easymotion-prefix)
map <Leader>f <Plug>(easymotion-bd-f)
map <Leader>w <Plug>(easymotion-bd-w)
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>h <Plug>(easymotion-linebackward)

" easy to use NERDTree
map <leader>e :NERDTreeToggle %:p:h<CR>
map <leader>m :NERDTreeFind<CR>F2
map <leader>F :FufFile<CR>
map <leader>B :FufBuffer<CR>
map <leader>J :FufJumpList<CR>

" Tagbar
nmap <Leader>t :TagbarToggle<CR>

" Theme
let g:airline_theme = 'murmur'

" Python-mode
let g:pymode_options_max_line_length = 120
let g:pep8_ignore="E501,W601"
let g:pymode_folding = 0
let g:pymode_lint_options_pep8 = {'max_line_length': g:pymode_options_max_line_length}

" add tag to tag search path
function! s:AddTag(path)
    let cp = fnamemodify(a:path, ':p:h')
    let p = fnamemodify(cp, ':p:h') . '/tags'
    if filereadable(p) && index(split(&tags, ','), p) < 0
        let &tags = &tags . ', ' . p
    endif
    let pp = fnamemodify(cp, ':p:h:h')
    if cp != pp
        call s:AddTag(pp)
    endif
endfunction

autocmd BufEnter *.java call s:AddTag('.')
autocmd BufEnter *.c call s:AddTag('.')
autocmd BufEnter *.cpp call s:AddTag('.')

" yankring
let g:yankring_history_file = '.yankring_history_file'

let g:pymode_lint_ignore = "E128"

map <C-M> :CtrlP<CR>

let g:ctrlp_ignore_dirs = ["build", "res", "bin", "Bin", "obj", "Obj", "debug", "Debug", "__pycache__", "gen", "drawable.\+", "\.git", "\.svn"]
let g:ctrlp_custom_ignore = ''
let s:sperator = ''
for dir in g:ctrlp_ignore_dirs
    let g:ctrlp_custom_ignore = g:ctrlp_custom_ignore . s:sperator . '\<' . dir . '\>'
    let s:sperator = '\|'
endfor

let g:NERDTreeIgnore = []
" common dot files
call extend(g:NERDTreeIgnore, ['.git[[dir]]'])
call extend(g:NERDTreeIgnore, ['.svn[[dir]]'])
" C#/CPP project build files
call extend(g:NERDTreeIgnore, ['^bin$[[dir]]'])
call extend(g:NERDTreeIgnore, ['obj[[dir]]'])
call extend(g:NERDTreeIgnore, ['Obj[[dir]]'])
call extend(g:NERDTreeIgnore, ['Debug[[dir]]'])
" python project
call extend(g:NERDTreeIgnore, ['__pycache__[[dir]]'])
call extend(g:NERDTreeIgnore, ['.pyc[[file]]'])
" android NERDTree setting
call extend(g:NERDTreeIgnore, ['^.settings$[[dir]]'])
call extend(g:NERDTreeIgnore, ['^drawable.\+[[dir]]'])
call extend(g:NERDTreeIgnore, ['^exlibs$[[dir]]'])
call extend(g:NERDTreeIgnore, ['^gen$[[dir]]'])
call extend(g:NERDTreeIgnore, ['^libs$[[dir]]'])

" ack.vim
let g:ack_default_options = " -s -H --nogroup --column --smart-case --follow"
autocmd BufReadPost quickfix call ack#ShowResults()

" Unite outline
map <leader>u :Unite outline -vertical -winwidth=50<CR>
