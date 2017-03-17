(* File lexer.mll *)
{
open Parser        (* The type token is defined in parser.mli *)
}

let char = ['0'-'9' 'a'-'z' 'A'-'Z' '_']
let string = ['"'](char*[' ']*)*['"']
let empty = ['"'][':']['"']

rule lexer_main = parse
      [' ' '\t' '\n' '\r']  { lexer_main lexbuf }     (* skip blanks *)
	| "/*" [^'*']* "*/"  	{ lexer_main lexbuf }     (* comments *)
    | ['0'-'9']+ as lxm 	{ INT(int_of_string lxm) }
	| ';'      				{ SEQ }
	| "def"					{ DEFINE }
	| "lang_add"			{ ADD }
	| "lang_remove"			{ REMOVE }
	| "lang_union"			{ UNION }
	| "lang_inter"			{ INTER }
	| "lang_diff"			{ DIFF }
	| "lang_length"			{ LENGTH }
	| "lang_get"			{ GET }
	| "if"     				{ IF }
    | "then"   				{ THEN }
    | "else"   				{ ELSE }
    | "true"   				{ TRUE }
    | "false"  				{ FALSE }
	| '!'					{ NOT }
	| "&&"	   				{ AND }
	| "||"     				{ OR }
	| empty	   				{ STRING ("") }
	| '^'					{ CONCAT }
    | string as lxm 		{ STRING (String.sub lxm 1 ((String.length lxm) - 2)) }
	| '?'char+ as lxm 		{ BOOLVAR (lxm) }
	| '#'char+ as lxm		{ INTVAR (lxm) }
	| '$'char+ as lxm		{ STRVAR (lxm) }
	| '&'char+ as lxm		{ LANGVAR (lxm) }
	| '{'					{ LCURLY }
	| '}'					{ RCURLY }
	| ','					{ SEP }
    | '+'      				{ PLUS }
	| '-'      				{ MINUS }
	| '*'      				{ MULT }
	| '/'      				{ DIVIDE }
	| '%'					{ MOD }
    | '<'      				{ LESSTHAN }
	| '>'	   				{ GREATERTHAN }
	| "=="	   				{ EQUALS }
	| '('      				{ LPAREN }
	| ')'      				{ RPAREN }
    | '='      				{ ASSIGN }
	| "load_input"			{ LOAD }
	| "read_lang"			{ READLANG }
	| "read_int"			{ READINT }
	| "until"				{ UNTIL }
	| "print"				{ PRINT }
	| "print_lang"			{ PRINTLANG }
	| "print_lang_line"	{ PRINTLINELANG }
	| "print_newline"       { PRINTNEWLINE }
	| "print_line"			{ PRINTLINE }
	| "while"				{ WHILE }
	| "break"				{ BREAK }
	| "do"					{ DO }
	| "end"					{ END }
    | eof | '~'     		{ EOF }