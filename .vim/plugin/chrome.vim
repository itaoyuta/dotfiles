" http://d.hatena.ne.jp/LukeSilvia/touch/20101025/p1
command! -bar ChromeReload silent !osascript -e 'tell application "Google Chrome" to reload active tab of window 1'
command! -bar ChromeStartObserve ChromeStopObserve | autocmd BufWritePost <buffer> ChromeReload
command! -bar ChromeStopObserve autocmd! BufWritePost <buffer>
