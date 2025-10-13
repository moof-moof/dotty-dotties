# For complete documentation of this file, please see Geany's main documentation
[styling]
# Edit these in the colorscheme .conf file instead
default=default
comment=comment

# Where is this commentml (multi-line) defined originally?
commentml=comment_ml
primary=primary_1
identifier=identifier_1
control=primary_1
keyword=keyword_1
defword=keyword_2
preword1=keyword_fs_pre1
preword2=keyword_fs_pre2

# "number" is a keyword, but does not require a list of tokens here, 
# so it's only styled in filetypes.common (style-name: number_1_fs_numbr)
#number=

string=string_4

# "locale" styles the special comments between { }!
locale=other



# The following are all keywords defined in SciLexer.h:
# -----------------------------------------------------
#define SCE_FORTH_DEFAULT 0
#define SCE_FORTH_COMMENT 1
#define SCE_FORTH_COMMENT_ML 2
#define SCE_FORTH_IDENTIFIER 3
#define SCE_FORTH_CONTROL 4
#define SCE_FORTH_KEYWORD 5
#define SCE_FORTH_DEFWORD 6
#define SCE_FORTH_PREWORD1 7
#define SCE_FORTH_PREWORD2 8
#define SCE_FORTH_NUMBER 9
#define SCE_FORTH_STRING 10
#define SCE_FORTH_LOCALE 11

### jfr

#  #static const char * const forthWordLists[] = {
#-            "control keywords",
#-            "keywords",
#-            "definition words",
#-            "prewords with one argument",
#-            "prewords with two arguments",
#-            "string definition keywords",
#-            0,
#-        };




[keywords]
# all items must be in one line

# DATA-CONTROL; CONTROL-STRUCTURES
primary=abort exit loop unloop begin until while repeat exit if else then case endcase of endof again leave while until begin k j i leave unloop +loop loop do ?do case ?of ahead 

# NUMBER-BASE; TERMINAL-IO
keyword=require include included decimal hex also only previous binary emit key emit? key? dictionarystart dictionarynext hook-emit? hook-key? hook-key hook-emit serial-emit? serial-key? serial-key serial-emit hook-pause pause base type cr bl space spaces compare accept ctype cexpect count skipstring .digit digit char * hold sign #S # #> <# u. . ud. d. words .s u.s h.s hex. 

# DATA-TYPOLOGI; DICTIONARY-EXPANSION; COMPILER; FLAGS
defword=create does> variable value 2variable constant , 2, c, forgetram compiletoram? compiletoram compiletoflash  0-foldable 1-foldable 2-foldable 3-foldable 4-foldable 5-foldable 6-foldable 7-foldable constant 2constant align aligned cell+ cells allot here , compiletoram? compiletoram compiletoflash smudge inline immediate compileonly setflags (create) find execute recurse ' ['] postpone does> <builds create state ] [ ; : 

#  TEXT (STRING-FORMATTING)
#string=." " s" " c" " abort" " type cr bl space spaces compare accept ctype cexpect count skipstring .digit digit char * hold sign #S # #> <# u. . ud. d. words .s u.s h.s hex.
string=." " s" " c" " abort" 

#  STACK-MANIPULATION
preword1=dup drop swap over pick 2dup 2drop 2swas 2over 2swap 2nip 2over 2tuck 2rot 2-rot 2>r 2r> 2r@ 2rdrop ?dup nip tuck rot -rot depth rdepth >r r> r@ rdrop rpick roll -roll sp@ sp! rp@ rp! 

#  MATEMATIK; LOGIK; BITBANG; FLASH; COMPARISONS; MEMORY-ACCESS; DOUBLE-FIXEDPOINT-NUMBERS   +  USER-INPUT-&-INTERPRETATION;  HARDWARE-ACCESS
preword2=! c! @ c@ 2! 2@ and or xor bic invert negate / /mod mod rshift lshift * clz ror rol arshift 0= 0<> 0< true false >= <= < > u>= u<= u< u> <> = min max umax umin move fill ! +! h@ h! h+! c@ c! c+! bis! bic! xor! bit@ hbis! hbic! hxor! hbit@ cbis! cbic! cxor! cbit@ hflash! flashpageerase eraseflash eraseflashfrom + - 1- 1+ 2- 2+ not shr shl 2* 2/ abs u/mod /mod mod / even um* udm* um/mod ud/mod m* m/mod */ u*/ */mod d2* d2/ dshl dshr dabs dnegate d- d+ s>d u<= u>= u> u< <= >= > < 0< 0<> 0= <> = du> du< d> d< d0< d0= d<> d= f/ f* hold< f#S f# f. f.n number query tib current-source setsource source >in token parse evaluate interpret quit hook-quit reset dint eint eint? nop 




[settings]
# default extension used when saving files
extension=fs

# the following characters are these which a "word" can contains, see documentation
wordchars=!\"#$%&'*+,-./:;<=>?@`~_abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789

# which characters should be skipped when moving (or included when deleting) to word boundaries
# should always include space and tab (\s\t)
#whitespace_chars=\s\t!\"#$%&'()*+,-./:;<=>?@[\\]^`{|}~
whitespace_chars=\s\t\ 

# single comments, like # in this file
comment_single=\\  

# multiline comments
comment_open=( 
comment_close= )

# comments, possibly random-start to EOL (not working)
#comment_EOL=--- 


# comment_open=\
# comment_close=

# set to false if a comment character/string should start at column 0 of a line, true uses any
# indentation of the line, e.g. setting to true causes the following on pressing CTRL+d
	#command_example();
# setting to false would generate this
#	command_example();
# This setting works only for single line comments
comment_use_indent=true

# context action command (please see Geany's main documentation for details)
context_action_cmd=

[indentation]
#width=4
# 0 is spaces, 1 is tabs, 2 is tab & spaces
#type=0
