" Deniteのキーマップ
" 変数
let g:python3_host_prog = expand('~/.pyenv/shims/python3')

" バッファ一覧
noremap <C-B> :Denite buffer<CR>
" 最近使ったファイルの一覧
noremap <C-R> :Denite file_old<CR>
" カレントディレクトリの検索
noremap <C-C> :Denite file_rec<CR>

" deniteのプロンプトを指定
call denite#custom#option('default', 'prompt', '>')

