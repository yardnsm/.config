" https://coderwall.com/p/vgk5-q/make-vim-play-nice-with-html-templates-inside-script-tags
unlet b:current_syntax
syn include @HTML $VIMRUNTIME/syntax/html.vim
syn region htmlTemplate start=+<script [^>]*type *=[^>]*text/template[^>]*>+
      \  end=+</script>+me=s-1 keepend
      \  contains=@HTML,htmlScriptTag,@htmlPreproc
