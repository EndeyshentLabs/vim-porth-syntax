" Yanked from https://gitlab.com/tsoding/porth
if exists("b:current_syntax")
  finish
endif

set iskeyword=a-z,A-Z,-,*,_,!,@
syntax keyword porthTodos TODO XXX FIXME NOTE

" Language keywords
syntax keyword porthKeywords if if* else while do include memory proc const end offset reset assert in inline here addr-of call-like let peek

" Comments
syntax region porthCommentLine start="//" end="$"   contains=porthTodos
set commentstring=//%s

" String literals
syntax region porthString start=/\v"/ skip=/\v\\./ end=/\v"/ contains=porthEscapes

" Char literals
syntax region porthChar start=/\v'/ skip=/\v\\./ end=/\v'/ contains=porthEscapes

" Escape literals \n, \r, ....
syntax match porthEscapes display contained "\\[nr\"']"

" Number literals
" TODO: Choose the best matcher
syntax region porthNumber start=/\s\d/ skip=/\d/ end=/\s/
" syntax match  porthNumber "\-\?\<\d\+\>" display
" syntax match  porthNumber "\s(.*?)\s" display
" syntax match  porthNumber "[^\s](.*?)\s" display

" Type names the compiler recognizes
syntax keyword porthTypeNames addr int ptr bool
" Set highlights
highlight default link porthTodos Todo
highlight default link porthKeywords Keyword
highlight default link porthCommentLine Comment
highlight default link porthString String
highlight default link porthNumber Number
highlight default link porthTypeNames Type
highlight default link porthChar Character
highlight default link porthEscapes SpecialChar

let b:current_syntax = "porth"
