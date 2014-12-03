"=============================================================================
" Pushbullet Poster
" Version: 1.0
" Last Change: 2014/12/03 17:22:51.
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

let s:save_cpo = &cpo
set cpo&vim

function! pushbullet#get_me() "{{{
  let res = webapi#http#get("https://" . g:pushbullet_accesstoken . "@api.pushbullet.com/v2/users/me")
  let json = webapi#json#decode(res.content)
  if !has_key(json, 'error')
    echo json
  else
    echo json
  endif
endfunction
"}}}

function! pushbullet#pushes(...) "{{{
  let title   = "pushbullet.vim"
  let message = getline('.')

  if a:0 >= 2
    let message = a:1
    let title = a:2
  elseif a:0 >= 1
    let message = a:1
  endif

  let postdata = '{"type": "note", "title": "' . title . '", "body": "' . message . '"}'

  let header = {}
  let header["Content-Type"] = "application/json"

  let res = webapi#http#post("https://" . g:pushbullet_accesstoken . "@api.pushbullet.com/v2/pushes", postdata, header)
  let json = webapi#json#decode(res.content)
  if !has_key(json, 'error')
    echo "Pushbullet pushes"
  else
    echo json
  endif
endfunction
"}}}

let &cpo = s:save_cpo
unlet s:save_cpo

" __END__
" vim: foldmethod=marker
"
