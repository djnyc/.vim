set nocompatible              " be iMproved, required
filetype off                  " required

execute pathogen#infect()
syntax on
filetype plugin indent on

let g:vimwiki_list = [ {'path': '~/Dropbox/VimWiki/personal.wiki' , 'path_html': '~/Dropbox/VimWiki/export/html/personal' } , { 'path': '~/Dropbox/VimWiki/school.wiki' , 'path_html': '~/Dropbox/VimWiki/export/html/school' }]

set background=dark
colorscheme solarized

" Use todo#complete as the omni complete function for todo files
au filetype todo setlocal omnifunc=todo#Complete

" Auto complete projects
au filetype todo imap <buffer> + +<C-X><C-O>

" Auto complete contexts
au filetype todo imap <buffer> @ @<C-X><C-O>

function! VimwikiLinkHandler(link)
    " Use Vim to open external files with the 'vfile:' scheme.  E.g.:
    "   1) [[vfile:~/Code/PythonProject/abc123.py]]
    "   2) [[vfile:./|Wiki Home]]
    let link = a:link
    if link =~# '^vfile:'
      let link = link[1:]
    else
      return 0
    endif
    let link_infos = vimwiki#base#resolve_link(link)
    if link_infos.filename == ''
      echom 'Vimwiki Error: Unable to resolve link!'
      return 0
    else
      exe 'tabnew ' . fnameescape(link_infos.filename)
      return 1
    endif
  endfunction

