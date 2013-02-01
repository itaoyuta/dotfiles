" Name: venus.vim
" Version: 0.0.2
" Author: Takuya Nakamura <tanakamura@crooz.co.jp>
" Usage:
"
" テンプレを開く
nnoremap <Leader>g :call VenusSwitchFile("tpl")<CR>
" テンプレ(スマホ)を開く
nnoremap <Leader>s :call VenusSwitchFile("tplSp")<CR>
" コントローラーを開く
nnoremap <Leader>p :call VenusSwitchFile("Controller")<CR>
" インクルードファイルを開く
nnoremap <Leader>i :call VenusSwitchFile("Include")<CR>
 


function! VenusSwitchFile(action)

  let target = VenusGetTargetFilePath(a:action)

  if findfile(target) != ""
    execute ":e " . target
  endif

endfunction

function! VenusGetTargetFilePath(action)

	let path = expand("%:p")

	if a:action == "tpl"

		if path =~ "tpl$"
			if path =~ "templates_html5"
				return substitute(path, "templates_html5", "templates", "")
			endif
		else
			let path = substitute(path, "controller", "templates", "")
			return substitute(path, "\.php", ".tpl", "")
		endif

	elseif a:action == "tplSp"

		if path =~ "tpl$"
			if path =~ "templates\/"
				return substitute(path, "templates", "templates_html5", "")
			endif
		else
			let path = substitute(path, "controller", "templates_html5", "")
			return substitute(path, "\.php", ".tpl", "")
		endif

	elseif a:action == "Controller"

		let path = substitute(path, "templates[^/]*", "controller", "")
		return substitute(path, "\.tpl", ".php", "")

	elseif a:action == "Include"

		let dir = matchstr(path, '.*templates[^/]*')
    let result = matchlist(getline("."), "file=[\"']\\(.\\{-}\\)[\"']")

    if dir != "" && result[1] != ""
      return dir . "/" . result[1]
    endif

	endif

endfunction
