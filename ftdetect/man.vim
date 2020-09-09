" Linux man sets MAN_PN, OSX man sets working dir to manpage directory
" Python uses MAANPAGER for help() calls, and awscli uses it for aws ... help
if $_ =~ '/aws$'
	let $MAN_PN = "aws"
endif
if exists('$MAN_PN') || $PWD =~ 'share/man$' || $PWD =~ 'libexec/gnuman$'
	autocmd StdinReadPre * set ft=man
endif

