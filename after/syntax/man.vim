syntax  match  HideMarker  '[\x1\x2]'                  conceal  contained  containedin=Underlined,Bold,ManPage,Option,EnvVar,Heading
syntax  match  Bold        '\%x1.\{-}\%x1'
syntax  match  Heading     '^\%x1\u.*\%x1$'
syntax  match  Option      '\%x1--\?[^\x1]\{-1,}\%x1'
syntax  match  ManPage     '\%x1[^\x1]*\%x1(\d\w*)'
syntax  match  EnvVar      '\%x1\$\u.\{-}\%x1'
syntax  match  Underlined  '\%x2.\{-}\%x2'

highlight link Bold    Constant
highlight link Heading Exception
highlight link Option  Type
highlight link ManPage Keyword
highlight link EnvVar  Identifier
