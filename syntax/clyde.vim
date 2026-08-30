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

syn region  clydeString             start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=NONE
syn region  clydeCharacter          start=+'+ skip=+\\\\\|\\'+ end=+'+ contains=NONE
syn match clydeAnnotation         /@\w\+/

syn keyword clydeBoolean true false
syn keyword clydeBranch break continue
syn keyword clydeConditional if else
syn match clydeConstant /\v<[A-Z][A-Z0-9_]+>/
syn match clydeConstant /\v<k[A-Z][A-Za-z0-9]*>/
syn keyword clydeKeyword use static cast transmute is null implicit using case
" syn keyword clydeModifier extern javascript constexpr transitioning transient weak export
syn match clydeNumber /\v<[0-9]+(\.[0-9]*)?>/
syn match clydeNumber /\v<0x[0-9a-fA-F]+>/
syn keyword clydeOperator operator
" syn keyword clydeRel extends generates labels
syn keyword clydeRepeat while for
syn keyword clydeStatement return break continue yeet yield
syn keyword clydeStructure struct enum union trait
syn keyword clydeContextual var raw type try error in

syn keyword clydeAtom module export
syn match clydeDirective /\%(#scope\|#link\|#c_call\|#include\|#import\|#compiler_intrinsic\|#type\|#const\|#where\|#run\|#insert\|#expand\|#if\|#bitflags\|#assert\|#infix\|#incomplete\|#extern\|#flat\|#static\|#impl\|#for\)/

syntax match clydeType /\<[A-Z][a-zA-Z0-9]*[a-z][a-zA-Z0-9]*\>/
" Include some common types also
syn keyword clydeType void bool char
syn keyword clydeType byte sbyte short ushort int uint long ulong nint nuint
syn keyword clydeType string tuple
" syn match clydeKeywordArg /\<[a-z0-9_]\+\>::\@!/

syn keyword clydeRel inline

syntax match clydeDelimiter /[(){}\[\].,;:|<>]/
syntax match clydePunct /[+\-\*/?%&!|=]/
syn match clydePunct /=>\|==\|:=\|::=/

syn match   clydeLineComment      "\/\/.*" contains=@Spell
syn region  clydeComment	   start="/\*"  end="\*/" contains=@Spell

hi def link clydeAtom		Constant
hi def link clydeBoolean		Boolean
hi def link clydeBranch		Conditional
hi def link clydeComment		Comment
hi def link clydeConditional		Conditional
hi def link clydeConstant		Constant
hi def link clydeKeyword		Keyword
hi def link clydeLineComment		Comment
hi def link clydeDirective		Function
hi def link clydeNumber		Number
hi def link clydeOperator		Operator
hi def link clydeRel		StorageClass
hi def link clydeRepeat		Repeat
hi def link clydeStatement		Statement
hi def link clydeString		String
hi def link clydeAnnotation     String
hi def link clydeCharacter		Character
hi def link clydeStructure		Keyword
hi def link clydeType		Type
hi def link clydeContextual		Identifier
hi def link clydeKeywordArg		Label
hi def link clydePunct		Operator
hi def link clydeDelimiter        Delimiter

let b:current_syntax = "clyde"

let &cpo = s:cpo_save
unlet s:cpo_save
" vim: ts=8
