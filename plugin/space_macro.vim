
if !exists('g:space_macro_on')
  let g:space_macro_on = '<space>'
endif

if !exists('g:space_macro_off')
  let g:space_macro_off = '<leader><space>'
endif

if !exists('g:space_macro_match_word_only')
  let g:space_macro_match_word_only = 1
endif

" Returns the search pattern that will find the current word.
function! SearchPatternFromCurrentWord()
  let word_under_cursor = expand('<cword>')
  let prefix = g:space_macro_match_word_only != 0 ? '\<' : ''
  let suffix = g:space_macro_match_word_only != 0 ? '\>' : ''
  return '\C\V'.prefix.escape(word_under_cursor, '\').suffix
endfunction

" Returns the currently selected text.
function! GetVisualSelection()
  let [lnum1, col1] = getpos("'<")[1:2]
  let [lnum2, col2] = getpos("'>")[1:2]
  let lines = getline(lnum1, lnum2)
  let lines[-1] = lines[-1][: col2 - 1]
  let lines[0] = lines[0][col1 - 1:]
  return join(lines, "\n")
endfunction

" Returns the search patter that will match the current selection.
function! SearchPatternFromSelection()
  return '\V'.escape(GetVisualSelection(), '\')
endfunction

if g:space_macro_on != ''
  execute "nnoremap" g:space_macro_on ":set hls<cr>:let @/=SearchPatternFromCurrentWord()<cr>"
  execute "vnoremap" g:space_macro_on ":<BS><BS><BS><BS><BS>let @/=SearchPatternFromSelection()<cr>:set hls<cr>"
endif

if g:space_macro_off != ''
  execute "nnoremap" g:space_macro_off ":noh<cr>"
endif


