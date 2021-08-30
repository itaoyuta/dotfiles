nmap <silent> [coc]d <Plug>(coc-definition)
nmap <silent> [coc]y <Plug>(coc-type-definition)
nmap <silent> [coc]i <Plug>(coc-implementation)
nmap <silent> [coc]r <Plug>(coc-references)
nnoremap <silent> [coc]k :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
