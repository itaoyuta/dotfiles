" 画面遷移をする際のスニペット
" 階層が深い場合引数をふたつとる
function! Utransition(...)
	let currentTxt = getline(".")
	let singleTxt = CutString("match" , currentTxt , "")
	let tabTxt = CutString("sub" , currentTxt , singleTxt)

	let alist = []
	let cnt = 0

	call add(alist, tabTxt . "/// <summary>")
	call add(alist, tabTxt . "/// ")
	call add(alist, tabTxt . "/// </summary>")
	call add(alist, tabTxt . "void OnClick_" . singleTxt . "(){")
	
	if a:1 == "s"
			let singleTxt = "UIScreen" . singleTxt
	else
			let singleTxt = "UIDialog" . singleTxt
	endif

	if len(a:000) == 2
		" パスが深い場合もあり、その場合は指定が深くなる
		let singleTxt = a:2 . "/" . singleTxt
	endif

	if a:1 == "s"
		call add(alist, tabTxt . "\t" .'GUIManager.ReqScreen("' . singleTxt . '");')
	else
		call add(alist, tabTxt .  "\t" .'GUIManager.ReqDialog("' . singleTxt . '");')
	endif
	call add(alist, tabTxt . "}")

	for n in alist
		call append(line(".") + cnt, n)
		let cnt += 1
	endfor

	call setline(line("."), "")
endfunction

command! -nargs=+ Utransition call Utransition(<f-args>)



