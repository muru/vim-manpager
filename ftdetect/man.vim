" Linux man sets MAN_PN, OSX man sets working dir to manpage directory
" Python uses MAANPAGER for help() calls
if exists('$MAN_PN') || $PWD =~ 'share/man$' || $PWD =~ 'libexec/gnuman$' || exists('$__PYVENV_LAUNCHER__')
	autocmd StdinReadPre * set ft=man
endif

