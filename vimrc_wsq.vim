" �����ļ����ļ���
let $f=expand('%:')

" �����ļ����� 2012��6��29��
au BufRead,BufNewFile *.xaml set filetype=xml

filetype on

" ���ù����ļ�·������
let workPath='d:\work\baidumap_wp7\trunk\Com.Baidu.Map\'
exec "cd ".workPath

set backspace=indent,eol,start whichwrap+=<,>,[,]
set fileencodings=utf-8,gb2312,gbk,gb18030,ucs-bom,default,chinese
syntax on

if filereadable('c:\private.vim')
    source c:\private.vim
endif

" Sun Aug 21 00:05:50 CST 2011
" ��ʹ��gg��G��ʽ������ʱ���������ܡ�
" C������ʽ���Զ�����
set cindent
set tabstop=4
set shiftwidth=4
set colorcolumn=81
" �Զ���tab��ת��Ϊ4���ո�
set expandtab
set autoindent

" Mon Aug 29 23:11:06 CST 2011 �и��ڴ����ʽ���ܽ����ظ�����������
" Tue Aug 30 22:24:56 CST 2011 �и��ڸ�ʽ���������ܣ���һ����ǩ����ʽ���󷵻ص�ԭ����λ�á�
" Shift-Tab����Ϊ�Զ���ʽ��һ��������;
:nmap <S-Tab> ma=a{`a
"}

" 2012��7��16�� ���ٸ�ʽ������
" From:http://wiki.hotoo.me/Vim.html
nmap <tab> v>
vmap <tab> >gv
vmap <s-tab> <gv

" ���ñ���
set nobackup
" ����swp�ļ� �ǵ�ʵʱд��
set nowb

" ���E303 ���ܴ���ʱ�ļ�������
set directory=.,$TEMP

" �����к�
set number

" �����·����
set ruler

" ��������
set incsearch
set hlsearch
set ignorecase
" ��ESC��ȡ������������ͬʱָ��<silent>ѡ�����������ʾ:noh
nnoremap <silent> <ESC> :noh<CR><ESC>

" ����path���������ڽṹ������Ŀ֮�е���ת��find
" set path +=.,../,../*/,../*/*/,../*/*/*/,../../*/
set path+=.\*\,.\*\*\,.\*\*\*\
" set path=,,

" ���ļ����ⲿ�������ʱ�Զ���ȡ
set autoread

" ����ʱ�Զ����
autocmd GUIEnter * simalt ~x

" ����mapleader
let mapleader = ","

" CTRL��t����tags��
" :nmap <C-t> :tabnew<CR>
" Mon Sep 19 10:49:18 CST 2011
:nmap <Leader>t :tabnew<CR>
:imap <C-t> <C-o>:tabnew<CR>

" Tue Sep 27 09:07:03 CST 2011 tab������1��һ����4���һ��
:nmap <Leader>1 :tabfirst<CR>
:nmap <Leader>2 :tabprevious<CR>
:nmap <Leader>3 :tabnext<CR>
:nmap <Leader>4 :tablast<CR>

" Wed Dec 21 17:19:37 CST 2011 MiniBufExplorerʹ�õİ�����
:nmap <silent> <Leader>y :TMiniBufExplorer<CR>

" Tue Sep 27 10:51:41 CST 2011 �˳�����
:nmap <Leader>Q :qall<CR>

:nmap <Leader>ss :source %<CR>

" ����������п����ƶ�
:nmap <S-F3> :cnext<CR>
:nmap <S-F1> :cNext<CR>

" �Ӽ�����ճ������
" ����CTRL��V����ͨģʽ���ǿ��������İ����������ڴ�ģʽ��ʹ��<Leader>v��ճ�� Tue Sep 13 16:33:43 CST 2011
:nmap <Leader>v "*p
:imap <C-v> <C-o>"*p
:imap <Leader>v <C-r>"*

" Fri Oct 28 09:25:26 CST 2011
" ��������buffer���л��Ŀ�ݼ�
:nmap <Leader>n :bNext<CR>
:nmap <Leader>p :bprevious<CR>
:nmap <C-tab> :bNext<CR>
:nmap <C-S-tab> :bprevious<CR>

:nmap <C-l> <C-w><C-l>
:nmap <C-h> <C-w><C-h>
:nmap <C-j> <C-w><C-j>
:nmap <C-k> <C-w><C-k>

:nmap <A-j> ]c
:nmap <A-k> [c

" Tue Sep 13 16:34:01 CST 2011
" ���������ļ��Ŀ�ݼ�
:nmap <Leader>w :w<CR>

" Wed Sep 14 09:54:35 CST 2011
" �����˳��༭�Ŀ�ݼ�
:nmap <Leader>q :bd<CR>

" Tue Sep 13 16:34:01 CST 2011
" ����ɾ�������еĿ�ݼ�
:nmap <Leader>d :%d<CR>

" ������ǰ�ļ���Ŀ¼
:nmap <Leader>Z :call ChangeToDirectory()<CR>

" �༭��ǰ�ļ���Ŀ¼
:nmap <Leader>z :call EditFileDirectory()<CR>

" Wed Sep 14 14:41:51 CST 2011
" �������۵�����Ŀ�ݼ�
:nmap <Leader>f zfa}

" Thu Aug 25 08:51:46 CST 2011
" ���ݸ��Ƶ�������
:vmap <C-x> "*d
:vmap <C-c> "*y

" gui����
if has('win32')
    set guifont=Courier_New:h13:cANSI
else
    set guifont=Monaco:h14
endif

" ��������µĵ���
map <S-F4> :call Search_Word()<CR>:copen<CR>
function! Search_Word()
let w = expand("<cword>") " �ڵ�ǰ���λ��ץ��
silent execute ":vimgrep " w " **/*.cs **/*.xaml *.cs *.xaml"
endfunction

" Shift-F5 �л�����Ӧ��m�ļ���h�ļ���дios����ר�á�
" Thu Aug 25 17:46:04 CST 2011 �˰汾�������л���κ��ʧЧ����֪Ϊ�Ρ�ʹ�õ���bufexists�ж��ļ��Ƿ񱻼��أ�
" Sun Aug 28 23:18:55 CST 2011 ������ˮ���͵���㣬�����ü�����ࣻ
" ���⣺�����ͣ�İ�������򿪶�Ρ������������أ���������
:map <silent> <S-F5> :call ChangeToHFile()<CR>
function! ChangeToHFile()
    let filename=expand("%:r")
    let fileext=expand("%:e")
    let fileopen=""
    if 0
        if fileext==?"h"
            let fileopen=filename.".m"
        else
            let fileopen=filename.".h"
        endif
    else
        if fileext==?"xaml"
            let fileopen=filename.".xaml.cs"
        elseif fileext==?"cs"
            let fileopen=filename
        endif
    endif
    if filereadable(fileopen)
        call SwitchToBuf(fileopen)
    else 
    endif
endfunction

" һ��ģʽ�£���Spaceӳ��Ϊ���·�ҳ
" һ��ģʽ�£���Shift-Spaceӳ��Ϊ���Ϸ�ҳ
:map <Space> <C-F>
:map <S-Space> <C-B>

" ����ģʽ�£�����������,,��ӳ��ΪEsc�����ص�Normalģʽ
" Wed Aug 24 09:05:44 CST 2011
im  ,, <ESC>

" ��dcӳ��Ϊ�ر���һ������ҳ��һ���ǲ����õģ���quickfixҳ������ʱ�鿴�ļ���ҳ��
:nmap <silent> dc <C-W><C-W>:close<CR>

" Sun Aug 28 23:20:58 CST 2011 from��ˮ���� ���ļ�֮���л�
" see http://easwy.com/blog/archives/advanced-vim-skills-introduce-vimrc/
function! SwitchToBuf(filename)
    " find in current tab
    let bufwinnr = bufwinnr(a:filename)
    if bufwinnr != -1
        exec bufwinnr . "wincmd w"
    return
    else
        " find in each tab
        tabfirst
        let tab = 1
        while tab <= tabpagenr("$")
            let bufwinnr = bufwinnr(a:filename)
            if bufwinnr != -1
                exec "normal " . tab . "gt"
                exec bufwinnr . "wincmd w"
            return
            endif
            tabnext
            let tab = tab + 1
        endwhile
    " not exist, new tab
    exec ":e ". fnameescape(a:filename)
    endif
endfunction

" �༭��ǰ�ļ���Ŀ¼
:nmap <Leader>z :call EditFileDirectory()<CR>
function! EditFileDirectory()
    let path = expand('%:p:h')
    exec ":e ". fnameescape(path)
endfunction

" ������ǰ�ļ���Ŀ¼
:nmap <Leader>Z :call ChangeToDirectory()<CR>
function! ChangeToDirectory()
    let path = expand('%:p:h')
    exec ":e ". fnameescape(path)
    exec ":cd ". fnameescape(path)
endfunction

" ��commandִ�еĽ���������ļ�
function! TabMessage(cmd)
    redir => message
    silent execute a:cmd
    redir END
    tabnew
    silent put=message
    set nomodified
endfunction
command! -nargs=+ -complete=command TabMessage call TabMessage(<q-args>)

" 2012��6��5����� ɾ����ǰbuffer�������buffer
" http://blog.csdn.net/magicpang/article/details/2308167
fun! DeleteAllBuffersInWindow()
    let s:curWinNr = winnr()
    if winbufnr(s:curWinNr) == 1
        ret
    endif
    let s:curBufNr = bufnr("%")
    exe "bn"
    let s:nextBufNr = bufnr("%")
    while s:nextBufNr != s:curBufNr
        exe "bn"
        exe "bdel ".s:nextBufNr
        let s:nextBufNr = bufnr("%")
    endwhile
endfun
command! -nargs=0 DeleteAllBuffers call DeleteAllBuffersInWindow()
let g:indent_guides_guide_size = 1
