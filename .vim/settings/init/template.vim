" https://qiita.com/tomato3713/items/5f9d57b71b7a06d25be1
augroup templateGroup
autocmd!
autocmd BufNewFile *.bash :0r ~/.vim/template/t.bash
autocmd BufNewFile *.bat :0r ~/.vim/template/t.cmd
autocmd BufNewFile *.cmd :0r ~/.vim/template/t.cmd
autocmd BufNewFile *.htm :0r ~/.vim/template/t.html
autocmd BufNewFile *.html :0r ~/.vim/template/t.html
autocmd BufNewFile *.m3u :0r ~/.vim/template/t.m3u
autocmd BufNewFile *.m3u8 :0r ~/.vim/template/t.m3u
autocmd BufNewFile *.md :0r ~/.vim/template/t.md
autocmd BufNewFile *.mkd :0r ~/.vim/template/t.md
autocmd BufNewFile *.py :0r ~/.vim/template/t.py
augroup END
