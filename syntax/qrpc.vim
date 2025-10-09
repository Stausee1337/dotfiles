" Vim syntax file
" Language:	C
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last Change:	2022 Oct 05

" Quit when a (custom) syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

let s:cpo_save = &cpo
set cpo&vim


syn match   qrpcSpecial	       "\\\d\d\d\|\\."
syn region  qrpcTemplate	       start=+`+  skip=+\\\\\|\\`+  end=+`+	contains=jsiSpecial,jsiEmbed
syn region  qrpcEmbed	        start=+${+  end=+}+                     contains=jsiTemplate

syn match   qrpcLineComment      "\/\/.*" contains=@Spell
syn region  qrpcString         start=+'+ skip=+\\\\\|\\'+ end=+'+ contains=jsiSpecial
syn match qrpcAnnotation         /@\w\+/

syn keyword qrpcBoolean true false
syn keyword qrpcKeyword enum record service query mutation
" syn keyword qrpcModifier extern javascript constexpr transitioning transient weak export
syn match qrpcNumber /\v<[0-9]+(\.[0-9]*)?>/
syn match qrpcNumber /\v<0x[0-9a-fA-F]+>/
" syn keyword qrpcRel extends generates labels

" Include some common types also
syn keyword qrpcPrimitveType string bool float int uint any empty
syn match qrpcType /\<[A-Z][a-zA-Z0-9]*[a-z][a-zA-Z0-9]*\>/
syn keyword qrpcType UUID

syntax match qrpcDelimiter /[(){}\[\],;:|<>.]/
syn match qrpcXPunct /[?]/
syn match qrpcPunct /=>\|=\|-/

hi def link qrpcAtom		Constant
hi def link qrpcBoolean		Boolean
hi def link qrpcBranch		Conditional
hi def link qrpcComment		Comment
hi def link qrpcConditional		Conditional
hi def link qrpcConstant		Constant
hi def link qrpcKeyword		Keyword
hi def link qrpcLineComment		Comment
hi def link qrpcDirective		Function
hi def link qrpcNumber		Number
hi def link qrpcOperator		Operator
hi def link qrpcRel		StorageClass
hi def link qrpcRepeat		Repeat
hi def link qrpcStatement		Statement
hi def link qrpcString		String
hi def link qrpcAnnotation     String
hi def link qrpcCharacter		Character
hi def link qrpcStructure		Keyword
hi def link qrpcPrimitveType		Type
hi def link qrpcType		Type
hi def link qrpcXPunct		Identifier
hi def link qrpcPunct		Operator
hi def link qrpcDelimiter        Delimiter
hi def link qrpcDecorator Special
hi def link qrpcTemplate          String
hi def link qrpcSpecial           Special
hi def link qrpcEmbed             Special

let b:current_syntax = "qrpc"

let &cpo = s:cpo_save
unlet s:cpo_save
" vim: ts=8
