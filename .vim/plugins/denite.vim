" Deniteのキーマップ
" 変数
let g:python3_host_prog = expand('~/.pyenv/shims/python3')


" バインド
nnoremap [denite] <Nop>
nmap <Leader>f [denite]

" バッファ一覧
nnoremap [denite]b :<C-u>Denite buffer<CR>
" 最近使ったファイルの一覧
nnoremap [denite]o :<C-u>Denite file_old<CR>
" カレントディレクトリの検索
nnoremap [denite]c :<C-u>DeniteBufferDir file_rec<CR>

" deniteのプロンプトを指定
call denite#custom#option('default', 'prompt', '>')

