function! s:on_lsp_buffer_enabled() abort
	if &filetype == 'c' || &filetype == 'cpp'
		nnoremap <buffer> <C-t> :<C-u>LspDocumentSwitchSourceHeader<CR>
	endif
endfunction

augroup lsp_settings_install
	au!
	autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
