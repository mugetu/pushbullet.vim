"=============================================================================
" Pushbullet Poster
" Version: 1.0
" Last Change: 2014/12/03 17:12:44.
" Author: mugetu
" License: MIT license  {{{
"     Permission is hereby granted, free of charge, to any person obtaining
"     a copy of this software and associated documentation files (the
"     "Software"), to deal in the Software without restriction, including
"     without limitation the rights to use, copy, modify, merge, publish,
"     distribute, sublicense, and/or sell copies of the Software, and to
"     permit persons to whom the Software is furnished to do so, subject to
"     the following conditions:
"
"     The above copyright notice and this permission notice shall be included
"     in all copies or substantial portions of the Software.
"
"     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
"     OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
"     MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
"     IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
"     CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
"     TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
"     SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
" }}}
"=============================================================================
scriptencoding utf-8

" if !exists('g:pushbullet_enable')
"   let g:pushbullet_enable = 1
" elseif v:version < 700
"   finish
" endif

" if exists('g:loaded_pushbullet') || !g:pushbullet_enable
"   finish
" endif

let s:save_cpo = &cpo
set cpo&vim

" Obsolute options check. "{{{
if !exists('g:pushbullet_accesstoken')
  finish
endif
"}}}

" Plugin key-mappings. "{{{
"}}}

augroup pushbullet "{{{
augroup END"}}}

" Commands. "{{{
command! -nargs=* Pushb      call pushbullet#pushes(<f-args>)
command! -nargs=0 PushbGetMe call pushbullet#get_me()
"}}}

let g:loaded_pushbullet = 1

let &cpo = s:save_cpo
unlet s:save_cpo

" __END__
" vim: foldmethod=marker
