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


syn match   jsiSpecial	       "\\\d\d\d\|\\."
syn region  jsiTemplate	       start=+`+  skip=+\\\\\|\\`+  end=+`+	contains=jsiSpecial,jsiEmbed
syn region  jsiEmbed	        start=+${+  end=+}+                     contains=jsiTemplate

syn match   jsiLineComment      "\/\/.*" contains=@Spell
syn region  jsiString         start=+'+ skip=+\\\\\|\\'+ end=+'+ contains=jsiSpecial
syn match jsiAnnotation         /@\w\+/

syn keyword jsiBoolean true false
syn match jsiConstant /\v<[A-Z][A-Z0-9_]+>/
syn match jsiConstant /\v<k[A-Z][A-Za-z0-9]*>/
syn keyword jsiKeyword static module type function interface const let readonly namespace
" syn keyword jsiModifier extern javascript constexpr transitioning transient weak export
syn match jsiNumber /\v<[0-9]+(\.[0-9]*)?>/
syn match jsiNumber /\v<0x[0-9a-fA-F]+>/
" syn keyword jsiRel extends generates labels

syn keyword Special Iterator AsyncIterator
syn keyword @variable.builtin Symbol

" Include some common types also
syn keyword jsiPrimitveType string object bool number any undefined
syn keyword jsiPrimitveType i8 u8 i32 u32
syn keyword jsiComplexType  Promise FrozenArray Function BigInt

syn keyword Function constructor

syntax match jsiDelimiter /[(){}\[\],;:|<>.]/
syn match jsiXPunct /[?]/
syn match jsiPunct /=>\|=\|-/

syntax match jsiDecorator /@[A-Za-z0-9_]\+/ contains=atSign
syntax match atSign /@/ contained

hi def link jsiAtom		Constant
hi def link jsiBoolean		Boolean
hi def link jsiBranch		Conditional
hi def link jsiComment		Comment
hi def link jsiConditional		Conditional
hi def link jsiConstant		Constant
hi def link jsiKeyword		Keyword
hi def link jsiLineComment		Comment
hi def link jsiDirective		Function
hi def link jsiNumber		Number
hi def link jsiOperator		Operator
hi def link jsiRel		StorageClass
hi def link jsiRepeat		Repeat
hi def link jsiStatement		Statement
hi def link jsiString		String
hi def link jsiAnnotation     String
hi def link jsiCharacter		Character
hi def link jsiStructure		Keyword
hi def link jsiPrimitveType		Type
hi def link jsiComplexType		Identifier
hi def link jsiXPunct		Identifier
hi def link jsiPunct		Operator
hi def link jsiDelimiter        Delimiter
hi def link jsiDecorator Special
hi def link jsiTemplate          String
hi def link jsiSpecial           Special
hi def link jsiEmbed             Special
hi def link atSign Constant

let b:current_syntax = "jsi"

let &cpo = s:cpo_save
unlet s:cpo_save
" vim: ts=8
