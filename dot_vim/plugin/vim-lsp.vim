let g:lsp_semantic_enabled=1

function! s:on_lsp_buffer_enabled() abort
	setlocal omnifunc=lsp#complete
	nnoremap <buffer> <F3> <plug>(lsp-definition)
	nnoremap <buffer> <F2> <plug>(lsp-rename)
	nnoremap <buffer> K <plug>(lsp-hover)
	nnoremap <buffer> <expr><C-j> lsp#scroll(+1)
	nnoremap <buffer> <expr><C-k> lsp#scroll(-1)
endfunction

augroup lsp_install
	au!
	autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
