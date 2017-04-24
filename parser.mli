type token =
  | INT of (int)
  | BOOLVAR of (string)
  | INTVAR of (string)
  | STRVAR of (string)
  | LANGVAR of (string)
  | STRING of (string)
  | TRUE
  | FALSE
  | LOAD
  | SEQ
  | LAMBDA
  | PLUS
  | MINUS
  | MULT
  | DIVIDE
  | MOD
  | UMINUS
  | AND
  | OR
  | NOT
  | LPAREN
  | RPAREN
  | APPLY
  | LCURLY
  | RCURLY
  | SEP
  | DEFINE
  | LET
  | SCOPE
  | ASSIGN
  | IF
  | THEN
  | ELSE
  | LOWER_THAN_ELSE
  | WHILE
  | DO
  | END
  | BREAK
  | ADD
  | REMOVE
  | UNION
  | INTER
  | DIFF
  | LENGTH
  | GET
  | CONCAT
  | LESSTHAN
  | GREATERTHAN
  | EQUALS
  | READLANG
  | READINT
  | PRINT
  | PRINTLINE
  | PRINTNEWLINE
  | PRINTLANG
  | PRINTLINELANG
  | UNTIL
  | EOF

val parser_main :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> AbstractSyntaxTree.mainRoot
