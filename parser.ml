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

open Parsing;;
let _ = parse_error;;
# 4 "parser.mly"
    open AbstractSyntaxTree;;
	module SetConstructor = Set.Make(String);;
# 67 "parser.ml"
let yytransl_const = [|
  263 (* TRUE *);
  264 (* FALSE *);
  265 (* LOAD *);
  266 (* SEQ *);
  267 (* LAMBDA *);
  268 (* PLUS *);
  269 (* MINUS *);
  270 (* MULT *);
  271 (* DIVIDE *);
  272 (* MOD *);
  273 (* UMINUS *);
  274 (* AND *);
  275 (* OR *);
  276 (* NOT *);
  277 (* LPAREN *);
  278 (* RPAREN *);
  279 (* APPLY *);
  280 (* LCURLY *);
  281 (* RCURLY *);
  282 (* SEP *);
  283 (* DEFINE *);
  284 (* LET *);
  285 (* SCOPE *);
  286 (* ASSIGN *);
  287 (* IF *);
  288 (* THEN *);
  289 (* ELSE *);
  290 (* LOWER_THAN_ELSE *);
  291 (* WHILE *);
  292 (* DO *);
  293 (* END *);
  294 (* BREAK *);
  295 (* ADD *);
  296 (* REMOVE *);
  297 (* UNION *);
  298 (* INTER *);
  299 (* DIFF *);
  300 (* LENGTH *);
  301 (* GET *);
  302 (* CONCAT *);
  303 (* LESSTHAN *);
  304 (* GREATERTHAN *);
  305 (* EQUALS *);
  306 (* READLANG *);
  307 (* READINT *);
  308 (* PRINT *);
  309 (* PRINTLINE *);
  310 (* PRINTNEWLINE *);
  311 (* PRINTLANG *);
  312 (* PRINTLINELANG *);
  313 (* UNTIL *);
    0 (* EOF *);
    0|]

let yytransl_block = [|
  257 (* INT *);
  258 (* BOOLVAR *);
  259 (* INTVAR *);
  260 (* STRVAR *);
  261 (* LANGVAR *);
  262 (* STRING *);
    0|]

let yylhs = "\255\255\
\001\000\002\000\002\000\003\000\003\000\003\000\003\000\004\000\
\004\000\004\000\004\000\004\000\004\000\005\000\005\000\005\000\
\005\000\005\000\006\000\006\000\006\000\006\000\007\000\007\000\
\007\000\007\000\008\000\008\000\008\000\008\000\009\000\009\000\
\009\000\010\000\010\000\010\000\010\000\010\000\010\000\010\000\
\010\000\011\000\011\000\011\000\012\000\012\000\012\000\012\000\
\012\000\012\000\012\000\012\000\012\000\013\000\013\000\014\000\
\014\000\014\000\014\000\015\000\015\000\015\000\017\000\017\000\
\017\000\016\000\016\000\016\000\016\000\016\000\016\000\016\000\
\000\000"

let yylen = "\002\000\
\003\000\001\000\003\000\001\000\007\000\009\000\007\000\001\000\
\001\000\001\000\001\000\001\000\001\000\002\000\004\000\002\000\
\004\000\001\000\004\000\004\000\004\000\004\000\003\000\003\000\
\003\000\003\000\001\000\001\000\001\000\001\000\001\000\001\000\
\001\000\001\000\002\000\003\000\003\000\003\000\003\000\003\000\
\003\000\001\000\001\000\002\000\001\000\003\000\003\000\003\000\
\003\000\003\000\002\000\002\000\003\000\001\000\001\000\001\000\
\003\000\003\000\003\000\003\000\001\000\002\000\000\000\002\000\
\003\000\001\000\003\000\003\000\003\000\003\000\003\000\003\000\
\002\000"

let yydefred = "\000\000\
\000\000\000\000\042\000\000\000\000\000\000\000\000\000\054\000\
\032\000\031\000\008\000\000\000\000\000\000\000\063\000\000\000\
\000\000\000\000\009\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\018\000\000\000\
\000\000\073\000\000\000\002\000\004\000\010\000\011\000\012\000\
\013\000\034\000\000\000\045\000\000\000\056\000\000\000\066\000\
\030\000\000\000\000\000\000\000\000\000\043\000\000\000\051\000\
\033\000\000\000\035\000\000\000\055\000\061\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\052\000\
\000\000\062\000\044\000\014\000\016\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\026\000\
\000\000\041\000\053\000\059\000\072\000\064\000\060\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\069\000\070\000\071\000\000\000\000\000\000\000\001\000\003\000\
\036\000\000\000\000\000\000\000\048\000\049\000\050\000\000\000\
\000\000\000\000\057\000\065\000\000\000\000\000\000\000\022\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\005\000\007\000\000\000\006\000"

let yydgoto = "\002\000\
\034\000\035\000\036\000\037\000\038\000\039\000\040\000\041\000\
\042\000\043\000\044\000\045\000\046\000\047\000\048\000\049\000\
\067\000"

let yysindex = "\014\000\
\154\000\000\000\000\000\250\254\253\254\000\255\001\255\000\000\
\000\000\000\000\000\000\025\255\219\000\210\000\000\000\252\255\
\054\255\056\255\000\000\018\255\018\255\018\255\018\255\018\255\
\011\255\011\255\095\255\098\255\210\000\210\000\000\000\011\255\
\011\255\000\000\104\255\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\003\255\000\000\172\255\000\000\062\255\000\000\
\000\000\219\000\025\255\004\255\011\255\000\000\025\255\000\000\
\000\000\219\000\000\000\172\255\000\000\000\000\251\254\132\255\
\239\254\139\255\130\255\128\255\146\255\152\255\153\255\219\000\
\219\000\004\255\004\255\018\255\018\255\018\255\011\255\000\000\
\025\255\000\000\000\000\000\000\000\000\105\255\135\255\001\000\
\219\000\219\000\025\255\025\255\025\255\025\255\025\255\025\255\
\025\255\025\255\004\255\003\255\127\255\004\255\062\255\000\000\
\157\000\000\000\000\000\000\000\000\000\000\000\000\000\188\255\
\219\000\025\255\004\255\011\255\208\255\249\255\062\255\062\255\
\000\000\000\000\000\000\127\255\025\255\025\255\000\000\000\000\
\000\000\178\255\136\255\136\255\000\000\000\000\000\000\127\255\
\127\255\127\255\000\000\000\000\003\255\127\255\062\255\000\000\
\166\255\174\255\127\255\127\255\154\000\154\000\010\255\255\254\
\154\000\154\000\000\000\000\000\064\255\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\087\255\231\000\027\255\085\255\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\088\255\000\000\090\255\000\000\191\255\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\239\255\049\000\000\000\052\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\116\255\156\255\
\000\000\000\000\000\000\097\000\000\000\000\000\000\000\000\000\
\000\000\215\255\196\255\057\000\000\000\000\000\000\000\213\255\
\055\000\062\000\000\000\000\000\054\000\087\000\092\000\000\000\
\000\000\000\000\099\000\100\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000"

let yygindex = "\000\000\
\000\000\041\000\175\255\000\000\000\000\000\000\000\000\060\000\
\000\000\020\000\000\000\246\255\000\000\248\255\035\000\242\255\
\000\000"

let yytablesize = 536
let yytable = "\066\000\
\127\000\056\000\060\000\064\000\108\000\065\000\128\000\061\000\
\153\000\008\000\080\000\081\000\089\000\090\000\001\000\062\000\
\106\000\086\000\087\000\153\000\089\000\090\000\062\000\050\000\
\102\000\003\000\051\000\054\000\099\000\052\000\053\000\079\000\
\059\000\063\000\015\000\156\000\055\000\012\000\104\000\060\000\
\101\000\015\000\154\000\103\000\105\000\055\000\155\000\064\000\
\026\000\020\000\021\000\022\000\023\000\024\000\074\000\075\000\
\076\000\077\000\078\000\055\000\027\000\060\000\060\000\055\000\
\066\000\119\000\120\000\027\000\025\000\100\000\124\000\128\000\
\055\000\153\000\072\000\028\000\073\000\063\000\060\000\060\000\
\131\000\132\000\133\000\134\000\135\000\136\000\137\000\138\000\
\084\000\085\000\139\000\117\000\118\000\065\000\061\000\082\000\
\033\000\027\000\083\000\028\000\158\000\144\000\060\000\142\000\
\033\000\033\000\143\000\099\000\129\000\130\000\121\000\122\000\
\123\000\088\000\147\000\148\000\067\000\061\000\067\000\033\000\
\027\000\061\000\028\000\033\000\027\000\067\000\028\000\067\000\
\067\000\067\000\067\000\067\000\141\000\067\000\067\000\110\000\
\067\000\067\000\091\000\092\000\093\000\094\000\095\000\091\000\
\092\000\093\000\094\000\095\000\067\000\093\000\094\000\095\000\
\067\000\107\000\111\000\112\000\068\000\113\000\068\000\067\000\
\109\000\125\000\067\000\067\000\067\000\068\000\067\000\068\000\
\068\000\068\000\068\000\068\000\067\000\068\000\068\000\114\000\
\068\000\068\000\096\000\097\000\098\000\115\000\116\000\091\000\
\092\000\093\000\094\000\095\000\068\000\151\000\152\000\126\000\
\068\000\140\000\157\000\089\000\046\000\149\000\046\000\068\000\
\029\000\000\000\068\000\068\000\068\000\046\000\068\000\046\000\
\046\000\150\000\000\000\000\000\068\000\046\000\046\000\000\000\
\046\000\046\000\096\000\097\000\098\000\000\000\039\000\029\000\
\037\000\089\000\090\000\029\000\046\000\145\000\039\000\039\000\
\046\000\037\000\039\000\000\000\037\000\000\000\000\000\046\000\
\000\000\046\000\046\000\046\000\046\000\039\000\046\000\037\000\
\023\000\039\000\000\000\037\000\046\000\068\000\069\000\070\000\
\071\000\003\000\004\000\005\000\006\000\007\000\008\000\009\000\
\010\000\011\000\089\000\090\000\000\000\012\000\146\000\023\000\
\000\000\000\000\000\000\023\000\013\000\014\000\000\000\000\000\
\015\000\000\000\000\000\016\000\000\000\000\000\000\000\017\000\
\000\000\000\000\000\000\018\000\000\000\000\000\019\000\020\000\
\021\000\022\000\023\000\024\000\025\000\026\000\000\000\000\000\
\000\000\000\000\027\000\028\000\029\000\030\000\031\000\032\000\
\033\000\047\000\024\000\047\000\000\000\025\000\000\000\019\000\
\040\000\000\000\047\000\000\000\047\000\047\000\000\000\038\000\
\040\000\040\000\047\000\047\000\040\000\047\000\047\000\038\000\
\038\000\024\000\000\000\038\000\025\000\024\000\019\000\040\000\
\025\000\047\000\019\000\040\000\000\000\047\000\038\000\000\000\
\020\000\058\000\038\000\058\000\047\000\021\000\047\000\047\000\
\047\000\047\000\058\000\047\000\015\000\017\000\000\000\000\000\
\000\000\047\000\058\000\058\000\000\000\058\000\058\000\020\000\
\000\000\000\000\000\000\020\000\021\000\000\000\000\000\000\000\
\021\000\058\000\000\000\015\000\017\000\058\000\000\000\015\000\
\017\000\000\000\000\000\000\000\058\000\000\000\058\000\058\000\
\058\000\058\000\000\000\058\000\000\000\000\000\000\000\000\000\
\000\000\058\000\003\000\004\000\005\000\006\000\007\000\008\000\
\009\000\010\000\011\000\000\000\000\000\000\000\012\000\000\000\
\091\000\092\000\093\000\094\000\095\000\013\000\014\000\000\000\
\000\000\015\000\107\000\000\000\016\000\000\000\000\000\000\000\
\017\000\000\000\000\000\000\000\018\000\000\000\000\000\019\000\
\020\000\021\000\022\000\023\000\024\000\025\000\026\000\000\000\
\000\000\000\000\000\000\027\000\028\000\029\000\030\000\031\000\
\032\000\033\000\003\000\057\000\054\000\061\000\062\000\008\000\
\009\000\010\000\000\000\003\000\057\000\054\000\012\000\000\000\
\000\000\009\000\010\000\000\000\000\000\013\000\014\000\012\000\
\000\000\015\000\000\000\000\000\000\000\000\000\013\000\058\000\
\043\000\000\000\043\000\043\000\043\000\043\000\043\000\000\000\
\020\000\021\000\022\000\023\000\024\000\025\000\026\000\000\000\
\000\000\000\000\000\000\027\000\028\000\000\000\025\000\043\000\
\000\000\000\000\000\000\043\000\000\000\028\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\043\000\043\000\043\000"

let yycheck = "\014\000\
\000\000\012\000\013\000\014\000\022\001\014\000\088\000\004\001\
\010\001\006\001\025\000\026\000\018\001\019\001\001\000\005\001\
\022\001\032\000\033\000\010\001\018\001\019\001\005\001\030\001\
\021\001\001\001\030\001\003\001\046\001\030\001\030\001\021\001\
\013\000\014\000\024\001\037\001\010\001\013\001\053\000\050\000\
\051\000\024\001\033\001\052\000\055\000\021\001\037\001\058\000\
\045\001\039\001\040\001\041\001\042\001\043\001\020\000\021\000\
\022\000\023\000\024\000\033\001\050\001\072\000\073\000\037\001\
\079\000\074\000\075\000\050\001\044\001\050\000\081\000\153\000\
\046\001\010\001\021\001\051\001\021\001\058\000\089\000\090\000\
\091\000\092\000\093\000\094\000\095\000\096\000\097\000\098\000\
\029\000\030\000\099\000\072\000\073\000\102\000\010\001\001\001\
\010\001\010\001\001\001\010\001\037\001\116\000\113\000\114\000\
\018\001\019\001\115\000\046\001\089\000\090\000\076\000\077\000\
\078\000\010\001\125\000\126\000\001\001\033\001\003\001\033\001\
\033\001\037\001\033\001\037\001\037\001\010\001\037\001\012\001\
\013\001\014\001\015\001\016\001\113\000\018\001\019\001\006\001\
\021\001\022\001\012\001\013\001\014\001\015\001\016\001\012\001\
\013\001\014\001\015\001\016\001\033\001\014\001\015\001\016\001\
\037\001\022\001\025\001\026\001\001\001\030\001\003\001\044\001\
\022\001\057\001\047\001\048\001\049\001\010\001\051\001\012\001\
\013\001\014\001\015\001\016\001\057\001\018\001\019\001\030\001\
\021\001\022\001\047\001\048\001\049\001\030\001\030\001\012\001\
\013\001\014\001\015\001\016\001\033\001\149\000\150\000\057\001\
\037\001\006\001\154\000\018\001\001\001\032\001\003\001\044\001\
\010\001\255\255\047\001\048\001\049\001\010\001\051\001\012\001\
\013\001\036\001\255\255\255\255\057\001\018\001\019\001\255\255\
\021\001\022\001\047\001\048\001\049\001\255\255\010\001\033\001\
\010\001\018\001\019\001\037\001\033\001\022\001\018\001\019\001\
\037\001\019\001\022\001\255\255\022\001\255\255\255\255\044\001\
\255\255\046\001\047\001\048\001\049\001\033\001\051\001\033\001\
\010\001\037\001\255\255\037\001\057\001\002\001\003\001\004\001\
\005\001\001\001\002\001\003\001\004\001\005\001\006\001\007\001\
\008\001\009\001\018\001\019\001\255\255\013\001\022\001\033\001\
\255\255\255\255\255\255\037\001\020\001\021\001\255\255\255\255\
\024\001\255\255\255\255\027\001\255\255\255\255\255\255\031\001\
\255\255\255\255\255\255\035\001\255\255\255\255\038\001\039\001\
\040\001\041\001\042\001\043\001\044\001\045\001\255\255\255\255\
\255\255\255\255\050\001\051\001\052\001\053\001\054\001\055\001\
\056\001\001\001\010\001\003\001\255\255\010\001\255\255\010\001\
\010\001\255\255\010\001\255\255\012\001\013\001\255\255\010\001\
\018\001\019\001\018\001\019\001\022\001\021\001\022\001\018\001\
\019\001\033\001\255\255\022\001\033\001\037\001\033\001\033\001\
\037\001\033\001\037\001\037\001\255\255\037\001\033\001\255\255\
\010\001\001\001\037\001\003\001\044\001\010\001\046\001\047\001\
\048\001\049\001\010\001\051\001\010\001\010\001\255\255\255\255\
\255\255\057\001\018\001\019\001\255\255\021\001\022\001\033\001\
\255\255\255\255\255\255\037\001\033\001\255\255\255\255\255\255\
\037\001\033\001\255\255\033\001\033\001\037\001\255\255\037\001\
\037\001\255\255\255\255\255\255\044\001\255\255\046\001\047\001\
\048\001\049\001\255\255\051\001\255\255\255\255\255\255\255\255\
\255\255\057\001\001\001\002\001\003\001\004\001\005\001\006\001\
\007\001\008\001\009\001\255\255\255\255\255\255\013\001\255\255\
\012\001\013\001\014\001\015\001\016\001\020\001\021\001\255\255\
\255\255\024\001\022\001\255\255\027\001\255\255\255\255\255\255\
\031\001\255\255\255\255\255\255\035\001\255\255\255\255\038\001\
\039\001\040\001\041\001\042\001\043\001\044\001\045\001\255\255\
\255\255\255\255\255\255\050\001\051\001\052\001\053\001\054\001\
\055\001\056\001\001\001\002\001\003\001\004\001\005\001\006\001\
\007\001\008\001\255\255\001\001\002\001\003\001\013\001\255\255\
\255\255\007\001\008\001\255\255\255\255\020\001\021\001\013\001\
\255\255\024\001\255\255\255\255\255\255\255\255\020\001\021\001\
\010\001\255\255\012\001\013\001\014\001\015\001\016\001\255\255\
\039\001\040\001\041\001\042\001\043\001\044\001\045\001\255\255\
\255\255\255\255\255\255\050\001\051\001\255\255\044\001\033\001\
\255\255\255\255\255\255\037\001\255\255\051\001\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\047\001\048\001\049\001"

let yynames_const = "\
  TRUE\000\
  FALSE\000\
  LOAD\000\
  SEQ\000\
  LAMBDA\000\
  PLUS\000\
  MINUS\000\
  MULT\000\
  DIVIDE\000\
  MOD\000\
  UMINUS\000\
  AND\000\
  OR\000\
  NOT\000\
  LPAREN\000\
  RPAREN\000\
  APPLY\000\
  LCURLY\000\
  RCURLY\000\
  SEP\000\
  DEFINE\000\
  LET\000\
  SCOPE\000\
  ASSIGN\000\
  IF\000\
  THEN\000\
  ELSE\000\
  LOWER_THAN_ELSE\000\
  WHILE\000\
  DO\000\
  END\000\
  BREAK\000\
  ADD\000\
  REMOVE\000\
  UNION\000\
  INTER\000\
  DIFF\000\
  LENGTH\000\
  GET\000\
  CONCAT\000\
  LESSTHAN\000\
  GREATERTHAN\000\
  EQUALS\000\
  READLANG\000\
  READINT\000\
  PRINT\000\
  PRINTLINE\000\
  PRINTNEWLINE\000\
  PRINTLANG\000\
  PRINTLINELANG\000\
  UNTIL\000\
  EOF\000\
  "

let yynames_block = "\
  INT\000\
  BOOLVAR\000\
  INTVAR\000\
  STRVAR\000\
  LANGVAR\000\
  STRING\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : AbstractSyntaxTree.expression) in
    Obj.repr(
# 73 "parser.mly"
                                      ( Main _1 )
# 442 "parser.ml"
               : AbstractSyntaxTree.mainRoot))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : AbstractSyntaxTree.statement) in
    Obj.repr(
# 77 "parser.mly"
                              ( Statement _1 )
# 449 "parser.ml"
               : AbstractSyntaxTree.expression))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : AbstractSyntaxTree.expression) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : AbstractSyntaxTree.statement) in
    Obj.repr(
# 78 "parser.mly"
                                      ( Sequence (_1, _3) )
# 457 "parser.ml"
               : AbstractSyntaxTree.expression))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : AbstractSyntaxTree.operation) in
    Obj.repr(
# 82 "parser.mly"
                                  ( Operation _1 )
# 464 "parser.ml"
               : AbstractSyntaxTree.statement))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 4 : AbstractSyntaxTree.booleanTypeOp) in
    let _6 = (Parsing.peek_val __caml_parser_env 1 : AbstractSyntaxTree.expression) in
    Obj.repr(
# 83 "parser.mly"
                                                                         ( IfStatement (_3, _6) )
# 472 "parser.ml"
               : AbstractSyntaxTree.statement))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 6 : AbstractSyntaxTree.booleanTypeOp) in
    let _6 = (Parsing.peek_val __caml_parser_env 3 : AbstractSyntaxTree.expression) in
    let _8 = (Parsing.peek_val __caml_parser_env 1 : AbstractSyntaxTree.expression) in
    Obj.repr(
# 84 "parser.mly"
                                                                     ( IfElseStatement (_3, _6, _8) )
# 481 "parser.ml"
               : AbstractSyntaxTree.statement))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 4 : AbstractSyntaxTree.booleanTypeOp) in
    let _6 = (Parsing.peek_val __caml_parser_env 1 : AbstractSyntaxTree.expression) in
    Obj.repr(
# 85 "parser.mly"
                                                          ( WhileStatement (_3, _6) )
# 489 "parser.ml"
               : AbstractSyntaxTree.statement))
; (fun __caml_parser_env ->
    Obj.repr(
# 89 "parser.mly"
                             ( Load )
# 495 "parser.ml"
               : AbstractSyntaxTree.operation))
; (fun __caml_parser_env ->
    Obj.repr(
# 90 "parser.mly"
                    ( Break )
# 501 "parser.ml"
               : AbstractSyntaxTree.operation))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : AbstractSyntaxTree.operationPrint) in
    Obj.repr(
# 91 "parser.mly"
                       ( OperationPrint _1 )
# 508 "parser.ml"
               : AbstractSyntaxTree.operation))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : AbstractSyntaxTree.operationDefine) in
    Obj.repr(
# 92 "parser.mly"
                     ( OperationDefine _1 )
# 515 "parser.ml"
               : AbstractSyntaxTree.operation))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : AbstractSyntaxTree.operationAssign) in
    Obj.repr(
# 93 "parser.mly"
                       ( OperationAssign _1 )
# 522 "parser.ml"
               : AbstractSyntaxTree.operation))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : AbstractSyntaxTree.operationOnTypes) in
    Obj.repr(
# 94 "parser.mly"
                          ( OperationOnTypes _1 )
# 529 "parser.ml"
               : AbstractSyntaxTree.operation))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : AbstractSyntaxTree.operationOnTypes) in
    Obj.repr(
# 98 "parser.mly"
                                       ( Print _2 )
# 536 "parser.ml"
               : AbstractSyntaxTree.operationPrint))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : AbstractSyntaxTree.languageTypeOp) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : AbstractSyntaxTree.intTypeOp) in
    Obj.repr(
# 99 "parser.mly"
                                          ( PrintLang (_2, _4))
# 544 "parser.ml"
               : AbstractSyntaxTree.operationPrint))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : AbstractSyntaxTree.operationOnTypes) in
    Obj.repr(
# 100 "parser.mly"
                                    ( PrintLine _2 )
# 551 "parser.ml"
               : AbstractSyntaxTree.operationPrint))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : AbstractSyntaxTree.languageTypeOp) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : AbstractSyntaxTree.intTypeOp) in
    Obj.repr(
# 101 "parser.mly"
                                             ( PrintLineLang (_2, _4))
# 559 "parser.ml"
               : AbstractSyntaxTree.operationPrint))
; (fun __caml_parser_env ->
    Obj.repr(
# 102 "parser.mly"
                                ( PrintNewLine )
# 565 "parser.ml"
               : AbstractSyntaxTree.operationPrint))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : AbstractSyntaxTree.booleanTypeOp) in
    Obj.repr(
# 106 "parser.mly"
                                            ( DefineBool (_2, _4) )
# 573 "parser.ml"
               : AbstractSyntaxTree.operationDefine))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : AbstractSyntaxTree.intTypeOp) in
    Obj.repr(
# 107 "parser.mly"
                                     ( DefineInt (_2, _4) )
# 581 "parser.ml"
               : AbstractSyntaxTree.operationDefine))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : AbstractSyntaxTree.stringTypeOp) in
    Obj.repr(
# 108 "parser.mly"
                                       ( DefineStr (_2, _4) )
# 589 "parser.ml"
               : AbstractSyntaxTree.operationDefine))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : AbstractSyntaxTree.languageTypeOp) in
    Obj.repr(
# 109 "parser.mly"
                                         ( DefineLang (_2, _4) )
# 597 "parser.ml"
               : AbstractSyntaxTree.operationDefine))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : AbstractSyntaxTree.booleanTypeOp) in
    Obj.repr(
# 113 "parser.mly"
                                         ( SetBool (_1, _3) )
# 605 "parser.ml"
               : AbstractSyntaxTree.operationAssign))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : AbstractSyntaxTree.intTypeOp) in
    Obj.repr(
# 114 "parser.mly"
                                ( SetInt (_1, _3) )
# 613 "parser.ml"
               : AbstractSyntaxTree.operationAssign))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : AbstractSyntaxTree.stringTypeOp) in
    Obj.repr(
# 115 "parser.mly"
                                  ( SetStr (_1, _3) )
# 621 "parser.ml"
               : AbstractSyntaxTree.operationAssign))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : AbstractSyntaxTree.languageTypeOp) in
    Obj.repr(
# 116 "parser.mly"
                                    ( SetLang (_1, _3) )
# 629 "parser.ml"
               : AbstractSyntaxTree.operationAssign))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : AbstractSyntaxTree.booleanTypeOp) in
    Obj.repr(
# 120 "parser.mly"
                                ( BooleanTypeOp _1 )
# 636 "parser.ml"
               : AbstractSyntaxTree.operationOnTypes))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : AbstractSyntaxTree.intTypeOp) in
    Obj.repr(
# 121 "parser.mly"
                     ( IntTypeOp _1 )
# 643 "parser.ml"
               : AbstractSyntaxTree.operationOnTypes))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : AbstractSyntaxTree.stringTypeOp) in
    Obj.repr(
# 122 "parser.mly"
                       ( StringTypeOp _1 )
# 650 "parser.ml"
               : AbstractSyntaxTree.operationOnTypes))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : AbstractSyntaxTree.languageTypeOp) in
    Obj.repr(
# 123 "parser.mly"
                         ( LanguageTypeOp _1 )
# 657 "parser.ml"
               : AbstractSyntaxTree.operationOnTypes))
; (fun __caml_parser_env ->
    Obj.repr(
# 128 "parser.mly"
                            ( Boolean false )
# 663 "parser.ml"
               : AbstractSyntaxTree.booleanVal))
; (fun __caml_parser_env ->
    Obj.repr(
# 129 "parser.mly"
                    ( Boolean true )
# 669 "parser.ml"
               : AbstractSyntaxTree.booleanVal))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 130 "parser.mly"
                      ( BoolVariable _1)
# 676 "parser.ml"
               : AbstractSyntaxTree.booleanVal))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : AbstractSyntaxTree.booleanVal) in
    Obj.repr(
# 134 "parser.mly"
                                ( BooleanVal _1 )
# 683 "parser.ml"
               : AbstractSyntaxTree.booleanTypeOp))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : AbstractSyntaxTree.booleanTypeOp) in
    Obj.repr(
# 135 "parser.mly"
                           ( Not _2 )
# 690 "parser.ml"
               : AbstractSyntaxTree.booleanTypeOp))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : AbstractSyntaxTree.booleanTypeOp) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : AbstractSyntaxTree.booleanTypeOp) in
    Obj.repr(
# 136 "parser.mly"
                                   ( And (_1, _3) )
# 698 "parser.ml"
               : AbstractSyntaxTree.booleanTypeOp))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : AbstractSyntaxTree.booleanTypeOp) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : AbstractSyntaxTree.booleanTypeOp) in
    Obj.repr(
# 137 "parser.mly"
                                   ( Or (_1, _3) )
# 706 "parser.ml"
               : AbstractSyntaxTree.booleanTypeOp))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : AbstractSyntaxTree.intTypeOp) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : AbstractSyntaxTree.intTypeOp) in
    Obj.repr(
# 138 "parser.mly"
                                ( Equals(_1, _3) )
# 714 "parser.ml"
               : AbstractSyntaxTree.booleanTypeOp))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : AbstractSyntaxTree.intTypeOp) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : AbstractSyntaxTree.intTypeOp) in
    Obj.repr(
# 139 "parser.mly"
                                 ( LessThan(_1, _3) )
# 722 "parser.ml"
               : AbstractSyntaxTree.booleanTypeOp))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : AbstractSyntaxTree.intTypeOp) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : AbstractSyntaxTree.intTypeOp) in
    Obj.repr(
# 140 "parser.mly"
                                   ( GreaterThan(_1, _3) )
# 730 "parser.ml"
               : AbstractSyntaxTree.booleanTypeOp))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : AbstractSyntaxTree.booleanTypeOp) in
    Obj.repr(
# 141 "parser.mly"
                                   ( _2 )
# 737 "parser.ml"
               : AbstractSyntaxTree.booleanTypeOp))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 144 "parser.mly"
                       ( Integer _1 )
# 744 "parser.ml"
               : AbstractSyntaxTree.intVal))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 145 "parser.mly"
                     ( IntVariable _1 )
# 751 "parser.ml"
               : AbstractSyntaxTree.intVal))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 146 "parser.mly"
                         ( ReadInt _2 )
# 758 "parser.ml"
               : AbstractSyntaxTree.intVal))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : AbstractSyntaxTree.intVal) in
    Obj.repr(
# 150 "parser.mly"
                          ( IntVal _1 )
# 765 "parser.ml"
               : AbstractSyntaxTree.intTypeOp))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : AbstractSyntaxTree.intTypeOp) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : AbstractSyntaxTree.intTypeOp) in
    Obj.repr(
# 151 "parser.mly"
                                         ( Plus (_1, _3) )
# 773 "parser.ml"
               : AbstractSyntaxTree.intTypeOp))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : AbstractSyntaxTree.intTypeOp) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : AbstractSyntaxTree.intTypeOp) in
    Obj.repr(
# 152 "parser.mly"
                                  ( Minus (_1, _3) )
# 781 "parser.ml"
               : AbstractSyntaxTree.intTypeOp))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : AbstractSyntaxTree.intTypeOp) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : AbstractSyntaxTree.intTypeOp) in
    Obj.repr(
# 153 "parser.mly"
                                 ( Mult (_1, _3) )
# 789 "parser.ml"
               : AbstractSyntaxTree.intTypeOp))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : AbstractSyntaxTree.intTypeOp) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : AbstractSyntaxTree.intTypeOp) in
    Obj.repr(
# 154 "parser.mly"
                                   ( Div (_1, _3) )
# 797 "parser.ml"
               : AbstractSyntaxTree.intTypeOp))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : AbstractSyntaxTree.intTypeOp) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : AbstractSyntaxTree.intTypeOp) in
    Obj.repr(
# 155 "parser.mly"
                                ( Mod (_1, _3) )
# 805 "parser.ml"
               : AbstractSyntaxTree.intTypeOp))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : AbstractSyntaxTree.intTypeOp) in
    Obj.repr(
# 156 "parser.mly"
                                      ( Uminus _2 )
# 812 "parser.ml"
               : AbstractSyntaxTree.intTypeOp))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : AbstractSyntaxTree.languageTypeOp) in
    Obj.repr(
# 157 "parser.mly"
                              ( LangLength _2 )
# 819 "parser.ml"
               : AbstractSyntaxTree.intTypeOp))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : AbstractSyntaxTree.intTypeOp) in
    Obj.repr(
# 158 "parser.mly"
                                ( _2 )
# 826 "parser.ml"
               : AbstractSyntaxTree.intTypeOp))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 162 "parser.mly"
                            ( StringType _1 )
# 833 "parser.ml"
               : AbstractSyntaxTree.stringVal))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 163 "parser.mly"
                     ( StrVariable _1 )
# 840 "parser.ml"
               : AbstractSyntaxTree.stringVal))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : AbstractSyntaxTree.stringVal) in
    Obj.repr(
# 167 "parser.mly"
                              ( StringVal _1 )
# 847 "parser.ml"
               : AbstractSyntaxTree.stringTypeOp))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : AbstractSyntaxTree.stringTypeOp) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : AbstractSyntaxTree.stringTypeOp) in
    Obj.repr(
# 168 "parser.mly"
                                    ( Concat (_1, _3) )
# 855 "parser.ml"
               : AbstractSyntaxTree.stringTypeOp))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : AbstractSyntaxTree.languageTypeOp) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : AbstractSyntaxTree.intTypeOp) in
    Obj.repr(
# 169 "parser.mly"
                                 ( LangGet (_2, _3) )
# 863 "parser.ml"
               : AbstractSyntaxTree.stringTypeOp))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : AbstractSyntaxTree.stringTypeOp) in
    Obj.repr(
# 170 "parser.mly"
                                  ( _2 )
# 870 "parser.ml"
               : AbstractSyntaxTree.stringTypeOp))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'language) in
    Obj.repr(
# 174 "parser.mly"
                                         ( Language _2 )
# 877 "parser.ml"
               : AbstractSyntaxTree.languageVal))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 175 "parser.mly"
                      ( LangVariable _1 )
# 884 "parser.ml"
               : AbstractSyntaxTree.languageVal))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 176 "parser.mly"
                          ( ReadLang _2 )
# 891 "parser.ml"
               : AbstractSyntaxTree.languageVal))
; (fun __caml_parser_env ->
    Obj.repr(
# 180 "parser.mly"
                                 ( SetConstructor.empty )
# 897 "parser.ml"
               : 'language))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'language) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 181 "parser.mly"
                            ( SetConstructor.add _2 _1 )
# 905 "parser.ml"
               : 'language))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'language) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 182 "parser.mly"
                               ( SetConstructor.add _3 _1 )
# 913 "parser.ml"
               : 'language))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : AbstractSyntaxTree.languageVal) in
    Obj.repr(
# 186 "parser.mly"
                                 ( LanguageVal _1 )
# 920 "parser.ml"
               : AbstractSyntaxTree.languageTypeOp))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : AbstractSyntaxTree.languageVal) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : AbstractSyntaxTree.stringTypeOp) in
    Obj.repr(
# 187 "parser.mly"
                                     ( LangAdd (_2, _3) )
# 928 "parser.ml"
               : AbstractSyntaxTree.languageTypeOp))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : AbstractSyntaxTree.languageVal) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : AbstractSyntaxTree.stringTypeOp) in
    Obj.repr(
# 188 "parser.mly"
                                      ( LangRemove (_2, _3) )
# 936 "parser.ml"
               : AbstractSyntaxTree.languageTypeOp))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : AbstractSyntaxTree.languageVal) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : AbstractSyntaxTree.languageVal) in
    Obj.repr(
# 189 "parser.mly"
                                        ( LangUnion (_2, _3) )
# 944 "parser.ml"
               : AbstractSyntaxTree.languageTypeOp))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : AbstractSyntaxTree.languageVal) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : AbstractSyntaxTree.languageVal) in
    Obj.repr(
# 190 "parser.mly"
                                        ( LangInter (_2, _3) )
# 952 "parser.ml"
               : AbstractSyntaxTree.languageTypeOp))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : AbstractSyntaxTree.languageVal) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : AbstractSyntaxTree.languageVal) in
    Obj.repr(
# 191 "parser.mly"
                                       ( LangDiff (_2, _3) )
# 960 "parser.ml"
               : AbstractSyntaxTree.languageTypeOp))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : AbstractSyntaxTree.languageTypeOp) in
    Obj.repr(
# 192 "parser.mly"
                                   ( _2 )
# 967 "parser.ml"
               : AbstractSyntaxTree.languageTypeOp))
(* Entry parser_main *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
|]
let yytables =
  { Parsing.actions=yyact;
    Parsing.transl_const=yytransl_const;
    Parsing.transl_block=yytransl_block;
    Parsing.lhs=yylhs;
    Parsing.len=yylen;
    Parsing.defred=yydefred;
    Parsing.dgoto=yydgoto;
    Parsing.sindex=yysindex;
    Parsing.rindex=yyrindex;
    Parsing.gindex=yygindex;
    Parsing.tablesize=yytablesize;
    Parsing.table=yytable;
    Parsing.check=yycheck;
    Parsing.error_function=parse_error;
    Parsing.names_const=yynames_const;
    Parsing.names_block=yynames_block }
let parser_main (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 1 lexfun lexbuf : AbstractSyntaxTree.mainRoot)
