function! Tracklist()
    call inputsave()
    let artist = input('Enter artist: ')
    call inputrestore()
    let start=search('^$','bn',line("w0"))
    let start+=1
    let end=search('^$','n',line("w$"))
    let end-=1
    let lines=getline(start,end)
    exe start.','.end.'s/\v\nFeaturing . (.*)\n/ (f. \1)\t/'
    let start=search('^$','bn',line("w0"))
    let start+=1
    let end=search('^$','n',line("w$"))
    let end-=1
    let lines=getline(start,end)
    exe start.','.end.'s/\v^\d+\s+'.artist.'–\s+([^\t]+).*/\t- [ ] \1/g'
    noh
endfunction

" ^ 2024-02-05T17:03:45-0500\
" % 2024-02-09T00:39:24-0500
