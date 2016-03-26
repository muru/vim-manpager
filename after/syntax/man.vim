syntax match Backhide '.\b' conceal contained
syntax match Highlighted '\v[-$]?(.\b.)+(\(\d\w*\))?' contains=Bold,SubHeading,Heading,Option,ManPage,EnvVar,Underlined
syntax match Bold       contains=Backhide contained  '\(.\b.\)\+'
syntax match Heading    contains=Backhide contained  '^\u\b\u\(.\b.\s\?\)*$'
syntax match Option     contains=Backhide contained  '\v<(-\b-){1,2}(.\b.)*'
syntax match ManPage    contains=Backhide contained  '\(.\b.\)\+(\d\w*)'
syntax match EnvVar     contains=Backhide contained  '\$\(.\b.\)\+'
syntax match Underlined contains=Backhide contained  '\(_\b.\)\+'

highlight link Bold    Constant
highlight link Heading Exception
highlight link Option  Type
highlight link ManPage Keyword
highlight link EnvVar  Identifier
