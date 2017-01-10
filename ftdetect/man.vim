" Linux man sets MAN_PN, OSX man sets working dir to manpage directory
if exists('$MAN_PN') || $PWD =~ 'share/man$'
	autocmd StdinReadPre * set ft=man
endif

