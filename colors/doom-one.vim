" -----------------------------------------------------------------------------
" File: doom-one.vim
" Description: Doom One color scheme for Vim, inspired by Atom One Dark
" Author: Adapted from Henrik Lissner's Doom One for Emacs
" Source: https://github.com/hlissner/emacs-doom-themes
" Last Modified: May 16, 2025
" -----------------------------------------------------------------------------

" Supporting code -------------------------------------------------------------
" Initialisation: {{{

if version > 580
  hi clear
  if exists("syntax_on")
    syntax reset
  endif
endif

let g:colors_name = 'doom-one'

" Ensure true color support for iTerm2 on macOS
if has('termguicolors')
  set termguicolors
endif

if !(has('termguicolors') && &termguicolors) && !has('gui_running') && &t_Co != 256
  " Fallback for terminals without true color support
  let s:bg0 = ['#282c34', 235]
  let g:doom_one_termcolors = 16
endif

" }}}
" Global Settings: {{{

if !exists('g:doom_one_bold')
  let g:doom_one_bold = 1
endif

if !exists('g:doom_one_italic')
  if has('gui_running') || $TERM_ITALICS == 'true'
    let g:doom_one_italic = 1
  else
    let g:doom_one_italic = 0
  endif
endif

if !exists('g:doom_one_underline')
  let g:doom_one_underline = 1
endif

if !exists('g:doom_one_undercurl')
  let g:doom_one_undercurl = 1
endif

if !exists('g:doom_one_brighter_comments')
  let g:doom_one_brighter_comments = 0
endif

if !exists('g:doom_one_comment_bg')
  let g:doom_one_comment_bg = g:doom_one_brighter_comments
endif

if !exists('g:doom_one_brighter_modeline')
  let g:doom_one_brighter_modeline = 0
endif

if !exists('g:doom_one_termcolors')
  let g:doom_one_termcolors = 256
endif

let s:is_dark = (&background == 'dark')
set background=dark

" }}}
" Palette: {{{

let s:doom = {}

" Colors from doom-one-theme.el
let s:doom.bg           = ['#282c34', 235]     " Background (explicitly set to #282c34)
let s:doom.bg_alt       = ['#21242b', 234]     " Alternate background
let s:doom.fg           = ['#bbc2cf', 252]     " Foreground
let s:doom.fg_alt       = ['#5B6268', 241]     " Alternate foreground
let s:doom.base0        = ['#1B2229', 233]     " Darkest background
let s:doom.base1        = ['#1c1f24', 234]     " Slightly lighter
let s:doom.base2        = ['#202328', 235]     " Slightly lighter
let s:doom.base3        = ['#23272e', 236]     " Slightly lighter
let s:doom.base4        = ['#3f444a', 238]     " Mid-tone
let s:doom.base5        = ['#5B6268', 241]     " Light mid-tone
let s:doom.base6        = ['#73797e', 243]     " Lighter mid-tone
let s:doom.base7        = ['#9ca0a4', 247]     " Lightest mid-tone
let s:doom.base8        = ['#DFDFDF', 188]     " Lightest foreground
let s:doom.grey         = s:doom.base4
let s:doom.red          = ['#ff6c6b', 203]     " Red
let s:doom.orange       = ['#da8548', 173]     " Orange
let s:doom.green        = ['#98be65', 149]     " Green
let s:doom.teal         = ['#4db5bd', 73]      " Teal
let s:doom.yellow       = ['#ECBE7B', 222]     " Yellow
let s:doom.blue         = ['#51afef', 75]      " Blue
let s:doom.dark_blue    = ['#2257A0', 25]      " Dark Blue
let s:doom.magenta      = ['#c678dd', 176]     " Magenta
let s:doom.light_magenta= ['#d8a8e6', 182]     " Lightened magenta for variables
let s:doom.violet       = ['#a9a1e1', 146]     " Violet
let s:doom.cyan         = ['#46D9FF', 81]      " Cyan
let s:doom.dark_cyan    = ['#5699AF', 67]      " Dark Cyan
let s:doom.light_comment= ['#7e858d', 244]     " Lightened comment for doc comments

" }}}
" Setup Emphasis: {{{

let s:bold = 'bold,'
if g:doom_one_bold == 0
  let s:bold = ''
endif

let s:italic = 'italic,'
if g:doom_one_italic == 0
  let s:italic = ''
endif

let s:underline = 'underline,'
if g:doom_one_underline == 0
  let s:underline = ''
endif

let s:undercurl = 'undercurl,'
if g:doom_one_undercurl == 0
  let s:undercurl = ''
endif

let s:inverse = 'inverse,'

" }}}
" Setup Colors: {{{

let s:vim_bg = ['bg', 'bg']
let s:vim_fg = ['fg', 'fg']
let s:none = ['NONE', 'NONE']

" Base colors
let s:bg0 = s:doom.bg
let s:bg1 = s:doom.base1
let s:bg2 = s:doom.base2
let s:bg3 = s:doom.base3
let s:bg4 = s:doom.base4
let s:fg0 = s:doom.fg
let s:fg1 = s:doom.fg_alt
let s:grey = s:doom.grey
let s:red = s:doom.red
let s:green = s:doom.green
let s:yellow = s:doom.yellow
let s:blue = s:doom.blue
let s:magenta = s:doom.magenta
let s:light_magenta = s:doom.light_magenta
let s:cyan = s:doom.cyan
let s:orange = s:doom.orange
let s:violet = s:doom.violet
let s:dark_blue = s:doom.dark_blue
let s:dark_cyan = s:doom.dark_cyan
let s:teal = s:doom.teal

" Modeline colors
if g:doom_one_brighter_modeline
  let s:modeline_bg = ['#1c2526', 234]  " Darkened blue
  let s:modeline_bg_alt = ['#1a2324', 233]
else
  let s:modeline_bg = s:doom.bg_alt
  let s:modeline_bg_alt = ['#1e2228', 234]
endif
let s:modeline_fg = s:doom.fg
let s:modeline_fg_alt = s:doom.base5

" Comment colors
let s:comment_fg = g:doom_one_brighter_comments ? s:doom.dark_cyan : s:doom.base5
let s:doc_comment_fg = g:doom_one_brighter_comments ? ['#78a7ba', 109] : s:doom.light_comment  " Lightened dark_cyan or base5
let s:comment_bg = g:doom_one_comment_bg ? ['#2e323a', 236] : s:none

" 16-color fallback
if g:doom_one_termcolors == 16
  let s:bg0[1] = 0
  let s:fg0[1] = 15
  let s:grey[1] = 8
  let s:red[1] = 9
  let s:green[1] = 10
  let s:yellow[1] = 11
  let s:blue[1] = 12
  let s:magenta[1] = 13
  let s:cyan[1] = 14
endif

" }}}
" Highlighting Function: {{{

function! s:HL(group, fg, ...)
  let fg = a:fg
  let bg = a:0 >= 1 ? a:1 : s:none
  let emstr = a:0 >= 2 && strlen(a:2) ? a:2 : 'NONE,'

  let histring = [ 'hi', a:group,
        \ 'guifg=' . fg[0], 'ctermfg=' . fg[1],
        \ 'guibg=' . bg[0], 'ctermbg=' . bg[1],
        \ 'gui=' . emstr[:-2], 'cterm=' . emstr[:-2]
        \ ]

  execute join(histring, ' ')
endfunction

" }}}
" Doom One Highlight Groups: {{{

call s:HL('DoomFg', s:fg0)
call s:HL('DoomBg', s:bg0)
call s:HL('DoomGrey', s:grey)
call s:HL('DoomRed', s:red)
call s:HL('DoomGreen', s:green)
call s:HL('DoomYellow', s:yellow)
call s:HL('DoomBlue', s:blue)
call s:HL('DoomMagenta', s:magenta)
call s:HL('DoomLightMagenta', s:light_magenta)
call s:HL('DoomCyan', s:cyan)
call s:HL('DoomOrange', s:orange)
call s:HL('DoomViolet', s:violet)

call s:HL('DoomRedBold', s:red, s:none, s:bold)
call s:HL('DoomGreenBold', s:green, s:none, s:bold)
call s:HL('DoomYellowBold', s:yellow, s:none, s:bold)
call s:HL('DoomBlueBold', s:blue, s:none, s:bold)

" }}}
" General UI: {{{

" Explicitly set the Normal background to #282c34 to avoid any override
call s:HL('Normal', s:fg0, s:doom.bg)

" Additional UI elements that might affect the background
call s:HL('NormalNC', s:fg0, s:doom.bg)
call s:HL('NonText', s:grey, s:doom.bg)
call s:HL('SpecialKey', s:grey, s:doom.bg)
call s:HL('EndOfBuffer', s:grey, s:doom.bg)

if version >= 700
  call s:HL('CursorLine', s:none, s:doom.bg_alt)  " Set to #21242b
  hi! link CursorColumn CursorLine
  call s:HL('TabLineFill', s:grey, s:bg1)
  call s:HL('TabLineSel', s:green, s:bg1, s:bold)
  hi! link TabLine TabLineFill
  call s:HL('MatchParen', s:none, s:bg3, s:bold)
endif

if version >= 703
  call s:HL('ColorColumn', s:none, s:doom.bg_alt)  " Set to #21242b
  call s:HL('Conceal', s:blue, s:none)
  call s:HL('CursorLineNr', s:yellow, s:bg1)
endif

call s:HL('Visual', s:none, s:dark_blue)
call s:HL('Search', s:yellow, s:bg0, s:inverse)
call s:HL('IncSearch', s:orange, s:bg0, s:inverse)

call s:HL('Underlined', s:blue, s:none, s:underline)

call s:HL('StatusLine', s:modeline_fg, s:modeline_bg, s:inverse)
call s:HL('StatusLineNC', s:modeline_fg_alt, s:modeline_bg_alt, s:inverse)

call s:HL('VertSplit', s:bg3, s:bg0)

call s:HL('WildMenu', s:blue, s:bg2, s:bold)

hi! link Directory DoomGreenBold
hi! link Title DoomGreenBold

call s:HL('ErrorMsg', s:bg0, s:red, s:bold)
hi! link MoreMsg DoomYellowBold
hi! link ModeMsg DoomYellowBold
hi! link Question DoomOrangeBold
hi! link WarningMsg DoomRedBold

" }}}
" Gutter: {{{

call s:HL('LineNr', s:bg4, s:doom.bg)  " Changed to #282c34 to match main background
call s:HL('SignColumn', s:none, s:bg1)
call s:HL('Folded', s:grey, s:bg1, s:italic)
call s:HL('FoldColumn', s:grey, s:bg1)

" }}}
" Cursor: {{{

call s:HL('Cursor', s:none, s:none, s:inverse)
hi! link vCursor Cursor
hi! link iCursor Cursor
hi! link lCursor Cursor

" }}}
" Syntax Highlighting: {{{

call s:HL('Comment', s:comment_fg, s:comment_bg, s:italic)
call s:HL('SpecialComment', s:doc_comment_fg, s:comment_bg, s:italic)
call s:HL('Todo', s:fg0, s:bg0, s:bold . s:italic)
call s:HL('Error', s:red, s:bg0, s:bold . s:inverse)

hi! link Statement DoomBlue
hi! link Conditional DoomBlue
hi! link Repeat DoomBlue
hi! link Label DoomBlue
hi! link Exception DoomBlue
hi! link Operator DoomBlue
hi! link Keyword DoomBlue

hi! link Identifier DoomLightMagenta
hi! link Function DoomMagenta

hi! link PreProc DoomViolet
hi! link Include DoomViolet
hi! link Define DoomViolet
hi! link Macro DoomViolet
hi! link PreCondit DoomViolet

hi! link Constant DoomViolet
hi! link Character DoomViolet
hi! link String DoomGreen
hi! link Boolean DoomViolet
hi! link Number DoomOrange
hi! link Float DoomOrange

hi! link Type DoomYellow
hi! link StorageClass DoomYellow
hi! link Structure DoomYellow
hi! link Typedef DoomYellow

" }}}
" Completion Menu: {{{

if version >= 700
  call s:HL('Pmenu', s:fg0, s:bg2)
  call s:HL('PmenuSel', s:bg2, s:blue, s:bold)
  call s:HL('PmenuSbar', s:none, s:bg2)
  call s:HL('PmenuThumb', s:none, s:bg4)
endif

" }}}
" Diffs: {{{

call s:HL('DiffDelete', s:red, s:bg0, s:inverse)
call s:HL('DiffAdd', s:green, s:bg0, s:inverse)
call s:HL('DiffChange', s:teal, s:bg0, s:inverse)
call s:HL('DiffText', s:yellow, s:bg0, s:inverse)

" }}}
" Spelling: {{{

if has("spell")
  call s:HL('SpellCap', s:none, s:none, s:undercurl, s:cyan)
  call s:HL('SpellBad', s:none, s:none, s:undercurl, s:red)
  call s:HL('SpellLocal', s:none, s:none, s:undercurl, s:teal)
  call s:HL('SpellRare', s:none, s:none, s:undercurl, s:violet)
endif

" }}}
" Plugin Specific: {{{

" GitGutter
hi! link GitGutterAdd DoomGreen
hi! link GitGutterChange DoomTeal
hi! link GitGutterDelete DoomRed
hi! link GitGutterChangeDelete DoomTeal

" NERDTree
hi! link NERDTreeDir DoomBlue
hi! link NERDTreeDirSlash DoomBlue
hi! link NERDTreeOpenable DoomOrange
hi! link NERDTreeClosable DoomOrange
hi! link NERDTreeFile DoomFg
hi! link NERDTreeExecFile DoomYellow
hi! link NERDTreeUp DoomGrey
hi! link NERDTreeCWD DoomGreen
hi! link NERDTreeHelp DoomFg
hi! link NERDTreeToggleOn DoomGreen
hi! link NERDTreeToggleOff DoomRed

" coc.nvim
hi! link CocErrorSign DoomRed
hi! link CocWarningSign DoomYellow
hi! link CocInfoSign DoomBlue
hi! link CocHintSign DoomCyan
hi! link CocErrorFloat DoomRed
hi! link CocWarningFloat DoomYellow
hi! link CocInfoFloat DoomBlue
hi! link CocHintFloat DoomCyan
call s:HL('CocErrorHighlight', s:none, s:none, s:undercurl, s:red)
call s:HL('CocWarningHighlight', s:none, s:none, s:undercurl, s:yellow)
call s:HL('CocInfoHighlight', s:none, s:none, s:undercurl, s:blue)
call s:HL('CocHintHighlight', s:none, s:none, s:undercurl, s:cyan)

" }}}
" Filetype Specific: {{{

" CSS
hi! link cssBraces DoomBlue
hi! link cssFunctionName DoomYellow
hi! link cssIdentifier DoomOrange
hi! link cssClassName DoomGreen
hi! link cssColor DoomBlue
hi! link cssSelectorOp DoomBlue
hi! link cssSelectorOp2 DoomBlue
hi! link cssImportant DoomGreen
hi! link cssVendor DoomFg
hi! link cssTextProp DoomTeal
hi! link cssAnimationProp DoomTeal
hi! link cssUIProp DoomYellow
hi! link cssTransformProp DoomTeal
hi! link cssTransitionProp DoomTeal
hi! link cssPrintProp DoomTeal
hi! link cssPositioningProp DoomYellow
hi! link cssBoxProp DoomTeal
hi! link cssFontDescriptorProp DoomTeal
hi! link cssFlexibleBoxProp DoomTeal
hi! link cssBorderOutlineProp DoomTeal
hi! link cssBackgroundProp DoomTeal
hi! link cssMarginProp DoomTeal
hi! link cssListProp DoomTeal
hi! link cssTableProp DoomTeal
hi! link cssFontProp DoomTeal
hi! link cssPaddingProp DoomTeal
hi! link cssDimensionProp DoomTeal
hi! link cssRenderProp DoomTeal
hi! link cssColorProp DoomTeal
hi! link cssGeneratedContentProp DoomTeal

" HTML
hi! link htmlTag DoomBlue
hi! link htmlEndTag DoomBlue
hi! link htmlTagName DoomTeal
hi! link htmlArg DoomOrange
hi! link htmlScriptTag DoomMagenta
hi! link htmlTagN DoomFg
hi! link htmlSpecialTagName DoomTeal
call s:HL('htmlLink', s:fg1, s:none, s:underline)
hi! link htmlSpecialChar DoomOrange

" JavaScript
hi! link javaScriptBraces DoomFg
hi! link javaScriptFunction DoomTeal
hi! link javaScriptIdentifier DoomBlue
hi! link javaScriptMember DoomBlue
hi! link javaScriptNumber DoomOrange
hi! link javaScriptNull DoomViolet
hi! link javaScriptParens DoomFg

" Markdown
hi! link markdownH1 DoomRedBold
hi! link markdownH2 DoomRedBold
hi! link markdownH3 DoomYellowBold
hi! link markdownH4 DoomYellowBold
hi! link markdownH5 DoomYellow
hi! link markdownH6 DoomYellow
hi! link markdownCode DoomTeal
hi! link markdownCodeBlock DoomTeal
hi! link markdownCodeDelimiter DoomTeal
hi! link markdownBlockquote DoomGrey
hi! link markdownListMarker DoomGrey
hi! link markdownOrderedListMarker DoomGrey
hi! link markdownRule DoomGrey
hi! link markdownHeadingRule DoomGrey
hi! link markdownUrlDelimiter DoomFg
hi! link markdownLinkDelimiter DoomFg
hi! link markdownLinkTextDelimiter DoomFg
hi! link markdownHeadingDelimiter DoomOrange
hi! link markdownUrl DoomViolet
hi! link markdownUrlTitleDelimiter DoomGreen
call s:HL('markdownLinkText', s:grey, s:none, s:underline)
hi! link markdownIdDeclaration markdownLinkText

" Python
hi! link pythonBuiltin DoomOrange
hi! link pythonBuiltinObj DoomOrange
hi! link pythonBuiltinFunc DoomOrange
hi! link pythonFunction DoomTeal
hi! link pythonDecorator DoomRed
hi! link pythonInclude DoomBlue
hi! link pythonImport DoomBlue
hi! link pythonRun DoomBlue
hi! link pythonCoding DoomBlue
hi! link pythonOperator DoomBlue
hi! link pythonException DoomRed
hi! link pythonExceptions DoomViolet
hi! link pythonBoolean DoomViolet
hi! link pythonDot DoomFg
hi! link pythonConditional DoomBlue
hi! link pythonRepeat DoomBlue
hi! link pythonDottedName DoomGreenBold

" PHP
hi! link phpStorageClass DoomBlue  " For 'public', 'private', etc.
hi! link phpFunction DoomMagenta   " For function names like 'render_column'
hi! link phpParent DoomMagenta     " For brackets '(' and ')' - Reverted to magenta
hi! link phpVarSelector DoomFg     " For '$' symbol
hi! link phpMethodsVar DoomLightMagenta  " For variables like 'column'

" }}}

" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker: