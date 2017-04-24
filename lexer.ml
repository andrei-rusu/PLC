# 2 "lexer.mll"
 
open Parser        (* The type token is defined in parser.mli *)

# 6 "lexer.ml"
let __ocaml_lex_tables = {
  Lexing.lex_base = 
   "\000\000\201\255\001\000\000\000\004\000\000\000\002\000\216\255\
    \217\255\003\000\219\255\220\255\221\255\223\255\224\255\225\255\
    \226\255\227\255\228\255\079\000\160\000\235\000\234\255\070\001\
    \013\000\155\001\238\255\000\000\001\000\255\000\004\000\002\000\
    \004\001\252\255\017\000\004\000\255\255\037\000\011\000\254\255\
    \203\255\005\000\251\255\023\000\011\000\019\000\000\000\181\001\
    \037\000\038\000\035\000\031\000\032\000\042\000\070\000\071\000\
    \250\255\063\000\062\000\057\000\101\000\249\255\098\000\093\000\
    \095\000\248\255\090\000\106\000\104\000\247\255\117\000\118\000\
    \246\255\111\000\119\000\107\000\120\000\245\255\135\000\244\255\
    \152\000\001\000\148\000\144\000\182\000\178\000\180\000\214\255\
    \243\255\180\000\197\000\189\000\242\255\225\000\240\255\227\000\
    \213\000\228\000\241\255\202\255\223\000\247\000\006\001\239\255\
    \251\001\237\255\236\255\233\255\086\002\005\000\235\255\161\002\
    \236\002\055\003\218\255\011\001\009\001\015\001\006\001\002\001\
    \019\001\007\001\026\001\213\255\014\001\212\255\015\001\027\001\
    \025\001\211\255\029\001\051\001\046\001\068\001\056\001\093\001\
    \182\001\085\001\086\001\094\001\103\001\091\001\095\001\091\001\
    \101\001\208\255\112\001\206\255\095\001\107\001\111\001\107\001\
    \117\001\207\255\114\001\138\001\146\001\205\255\147\001\152\001\
    \144\001\204\255";
  Lexing.lex_backtrk = 
   "\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\040\000\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\002\000\033\000\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \026\000\255\255\255\255\255\255\255\255\255\255\255\255\023\000\
    \024\000\025\000\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\045\000\255\255\255\255\
    \255\255\255\255\255\255\255\255\046\000\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255";
  Lexing.lex_default = 
   "\255\255\000\000\255\255\255\255\255\255\255\255\255\255\000\000\
    \000\000\255\255\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\255\255\255\255\255\255\000\000\255\255\
    \255\255\255\255\000\000\255\255\255\255\255\255\255\255\255\255\
    \255\255\000\000\255\255\255\255\000\000\037\000\255\255\000\000\
    \000\000\255\255\000\000\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \000\000\255\255\255\255\255\255\255\255\000\000\255\255\255\255\
    \255\255\000\000\255\255\255\255\255\255\000\000\255\255\255\255\
    \000\000\255\255\255\255\255\255\255\255\000\000\255\255\000\000\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\000\000\
    \000\000\255\255\255\255\255\255\000\000\255\255\000\000\255\255\
    \255\255\255\255\000\000\000\000\255\255\255\255\255\255\000\000\
    \255\255\000\000\000\000\000\000\255\255\255\255\000\000\255\255\
    \255\255\255\255\000\000\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\000\000\255\255\000\000\255\255\255\255\
    \255\255\000\000\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\000\000\255\255\000\000\255\255\255\255\255\255\255\255\
    \255\255\000\000\255\255\255\255\255\255\000\000\255\255\255\255\
    \255\255\000\000";
  Lexing.lex_trans = 
   "\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\036\000\036\000\000\000\000\000\036\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \036\000\026\000\023\000\020\000\019\000\012\000\025\000\110\000\
    \008\000\007\000\013\000\015\000\016\000\014\000\037\000\035\000\
    \034\000\034\000\034\000\034\000\034\000\034\000\034\000\034\000\
    \034\000\034\000\039\000\033\000\011\000\009\000\010\000\021\000\
    \114\000\034\000\034\000\034\000\034\000\034\000\034\000\034\000\
    \034\000\034\000\034\000\000\000\000\000\000\000\000\000\038\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\022\000\047\000\
    \082\000\100\000\002\000\044\000\032\000\028\000\027\000\115\000\
    \154\000\030\000\088\000\042\000\031\000\096\000\126\000\095\000\
    \004\000\043\000\006\000\158\000\029\000\005\000\130\000\003\000\
    \080\000\045\000\046\000\018\000\024\000\017\000\001\000\113\000\
    \113\000\113\000\113\000\113\000\113\000\113\000\113\000\113\000\
    \113\000\106\000\078\000\073\000\070\000\066\000\062\000\057\000\
    \113\000\113\000\113\000\113\000\113\000\113\000\113\000\113\000\
    \113\000\113\000\113\000\113\000\113\000\113\000\113\000\113\000\
    \113\000\113\000\113\000\113\000\113\000\113\000\113\000\113\000\
    \113\000\113\000\055\000\056\000\058\000\059\000\113\000\060\000\
    \113\000\113\000\113\000\113\000\113\000\113\000\113\000\113\000\
    \113\000\113\000\113\000\113\000\113\000\113\000\113\000\113\000\
    \113\000\113\000\113\000\113\000\113\000\113\000\113\000\113\000\
    \113\000\113\000\061\000\063\000\064\000\065\000\067\000\068\000\
    \112\000\112\000\112\000\112\000\112\000\112\000\112\000\112\000\
    \112\000\112\000\069\000\071\000\072\000\074\000\075\000\076\000\
    \077\000\112\000\112\000\112\000\112\000\112\000\112\000\112\000\
    \112\000\112\000\112\000\112\000\112\000\112\000\112\000\112\000\
    \112\000\112\000\112\000\112\000\112\000\112\000\112\000\112\000\
    \112\000\112\000\112\000\079\000\081\000\083\000\084\000\112\000\
    \001\000\112\000\112\000\112\000\112\000\112\000\112\000\112\000\
    \112\000\112\000\112\000\112\000\112\000\112\000\112\000\112\000\
    \112\000\112\000\112\000\112\000\112\000\112\000\112\000\112\000\
    \112\000\112\000\112\000\111\000\111\000\111\000\111\000\111\000\
    \111\000\111\000\111\000\111\000\111\000\255\255\085\000\086\000\
    \087\000\093\000\091\000\092\000\111\000\111\000\111\000\111\000\
    \111\000\111\000\111\000\111\000\111\000\111\000\111\000\111\000\
    \111\000\111\000\111\000\111\000\111\000\111\000\111\000\111\000\
    \111\000\111\000\111\000\111\000\111\000\111\000\094\000\099\000\
    \097\000\098\000\111\000\101\000\111\000\111\000\111\000\111\000\
    \111\000\111\000\111\000\111\000\111\000\111\000\111\000\111\000\
    \111\000\111\000\111\000\111\000\111\000\111\000\111\000\111\000\
    \111\000\111\000\111\000\111\000\111\000\111\000\108\000\090\000\
    \107\000\041\000\102\000\103\000\116\000\117\000\118\000\119\000\
    \124\000\089\000\120\000\040\000\121\000\122\000\108\000\108\000\
    \108\000\108\000\108\000\108\000\108\000\108\000\108\000\108\000\
    \109\000\123\000\125\000\127\000\128\000\129\000\131\000\108\000\
    \108\000\108\000\108\000\108\000\108\000\108\000\108\000\108\000\
    \108\000\108\000\108\000\108\000\108\000\108\000\108\000\108\000\
    \108\000\108\000\108\000\108\000\108\000\108\000\108\000\108\000\
    \108\000\132\000\133\000\134\000\136\000\108\000\135\000\108\000\
    \108\000\108\000\108\000\108\000\108\000\108\000\108\000\108\000\
    \108\000\108\000\108\000\108\000\108\000\108\000\108\000\108\000\
    \108\000\108\000\108\000\108\000\108\000\108\000\108\000\108\000\
    \108\000\105\000\148\000\146\000\139\000\140\000\141\000\142\000\
    \143\000\144\000\145\000\104\000\104\000\104\000\104\000\104\000\
    \104\000\104\000\104\000\104\000\104\000\147\000\149\000\150\000\
    \151\000\152\000\153\000\155\000\104\000\104\000\104\000\104\000\
    \104\000\104\000\104\000\104\000\104\000\104\000\104\000\104\000\
    \104\000\104\000\104\000\104\000\104\000\104\000\104\000\104\000\
    \104\000\104\000\104\000\104\000\104\000\104\000\156\000\157\000\
    \159\000\160\000\104\000\161\000\104\000\104\000\104\000\104\000\
    \104\000\104\000\104\000\104\000\104\000\104\000\104\000\104\000\
    \104\000\104\000\104\000\104\000\104\000\104\000\104\000\104\000\
    \104\000\104\000\104\000\104\000\104\000\104\000\054\000\138\000\
    \000\000\050\000\000\000\000\000\048\000\000\000\051\000\137\000\
    \000\000\049\000\000\000\000\000\000\000\000\000\000\000\053\000\
    \000\000\000\000\052\000\104\000\104\000\104\000\104\000\104\000\
    \104\000\104\000\104\000\104\000\104\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\104\000\104\000\104\000\104\000\
    \104\000\104\000\104\000\104\000\104\000\104\000\104\000\104\000\
    \104\000\104\000\104\000\104\000\104\000\104\000\104\000\104\000\
    \104\000\104\000\104\000\104\000\104\000\104\000\000\000\000\000\
    \000\000\000\000\104\000\000\000\104\000\104\000\104\000\104\000\
    \104\000\104\000\104\000\104\000\104\000\104\000\104\000\104\000\
    \104\000\104\000\104\000\104\000\104\000\104\000\104\000\104\000\
    \104\000\104\000\104\000\104\000\104\000\104\000\108\000\000\000\
    \107\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\108\000\108\000\
    \108\000\108\000\108\000\108\000\108\000\108\000\108\000\108\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\108\000\
    \108\000\108\000\108\000\108\000\108\000\108\000\108\000\108\000\
    \108\000\108\000\108\000\108\000\108\000\108\000\108\000\108\000\
    \108\000\108\000\108\000\108\000\108\000\108\000\108\000\108\000\
    \108\000\000\000\000\000\000\000\000\000\108\000\000\000\108\000\
    \108\000\108\000\108\000\108\000\108\000\108\000\108\000\108\000\
    \108\000\108\000\108\000\108\000\108\000\108\000\108\000\108\000\
    \108\000\108\000\108\000\108\000\108\000\108\000\108\000\108\000\
    \108\000\111\000\111\000\111\000\111\000\111\000\111\000\111\000\
    \111\000\111\000\111\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\111\000\111\000\111\000\111\000\111\000\111\000\
    \111\000\111\000\111\000\111\000\111\000\111\000\111\000\111\000\
    \111\000\111\000\111\000\111\000\111\000\111\000\111\000\111\000\
    \111\000\111\000\111\000\111\000\000\000\000\000\000\000\000\000\
    \111\000\000\000\111\000\111\000\111\000\111\000\111\000\111\000\
    \111\000\111\000\111\000\111\000\111\000\111\000\111\000\111\000\
    \111\000\111\000\111\000\111\000\111\000\111\000\111\000\111\000\
    \111\000\111\000\111\000\111\000\112\000\112\000\112\000\112\000\
    \112\000\112\000\112\000\112\000\112\000\112\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\112\000\112\000\112\000\
    \112\000\112\000\112\000\112\000\112\000\112\000\112\000\112\000\
    \112\000\112\000\112\000\112\000\112\000\112\000\112\000\112\000\
    \112\000\112\000\112\000\112\000\112\000\112\000\112\000\000\000\
    \000\000\000\000\000\000\112\000\000\000\112\000\112\000\112\000\
    \112\000\112\000\112\000\112\000\112\000\112\000\112\000\112\000\
    \112\000\112\000\112\000\112\000\112\000\112\000\112\000\112\000\
    \112\000\112\000\112\000\112\000\112\000\112\000\112\000\113\000\
    \113\000\113\000\113\000\113\000\113\000\113\000\113\000\113\000\
    \113\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \113\000\113\000\113\000\113\000\113\000\113\000\113\000\113\000\
    \113\000\113\000\113\000\113\000\113\000\113\000\113\000\113\000\
    \113\000\113\000\113\000\113\000\113\000\113\000\113\000\113\000\
    \113\000\113\000\000\000\000\000\000\000\000\000\113\000\000\000\
    \113\000\113\000\113\000\113\000\113\000\113\000\113\000\113\000\
    \113\000\113\000\113\000\113\000\113\000\113\000\113\000\113\000\
    \113\000\113\000\113\000\113\000\113\000\113\000\113\000\113\000\
    \113\000\113\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    ";
  Lexing.lex_check = 
   "\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\000\000\000\000\255\255\255\255\000\000\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\109\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\035\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\038\000\000\000\000\000\000\000\000\000\000\000\
    \009\000\034\000\034\000\034\000\034\000\034\000\034\000\034\000\
    \034\000\034\000\034\000\255\255\255\255\255\255\255\255\037\000\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\000\000\046\000\
    \081\000\027\000\000\000\031\000\000\000\000\000\000\000\006\000\
    \003\000\000\000\030\000\041\000\000\000\028\000\005\000\028\000\
    \000\000\031\000\000\000\002\000\000\000\000\000\004\000\000\000\
    \043\000\044\000\045\000\000\000\000\000\000\000\000\000\019\000\
    \019\000\019\000\019\000\019\000\019\000\019\000\019\000\019\000\
    \019\000\024\000\048\000\049\000\050\000\051\000\052\000\053\000\
    \019\000\019\000\019\000\019\000\019\000\019\000\019\000\019\000\
    \019\000\019\000\019\000\019\000\019\000\019\000\019\000\019\000\
    \019\000\019\000\019\000\019\000\019\000\019\000\019\000\019\000\
    \019\000\019\000\054\000\055\000\057\000\058\000\019\000\059\000\
    \019\000\019\000\019\000\019\000\019\000\019\000\019\000\019\000\
    \019\000\019\000\019\000\019\000\019\000\019\000\019\000\019\000\
    \019\000\019\000\019\000\019\000\019\000\019\000\019\000\019\000\
    \019\000\019\000\060\000\062\000\063\000\064\000\066\000\067\000\
    \020\000\020\000\020\000\020\000\020\000\020\000\020\000\020\000\
    \020\000\020\000\068\000\070\000\071\000\073\000\074\000\075\000\
    \076\000\020\000\020\000\020\000\020\000\020\000\020\000\020\000\
    \020\000\020\000\020\000\020\000\020\000\020\000\020\000\020\000\
    \020\000\020\000\020\000\020\000\020\000\020\000\020\000\020\000\
    \020\000\020\000\020\000\078\000\080\000\082\000\083\000\020\000\
    \000\000\020\000\020\000\020\000\020\000\020\000\020\000\020\000\
    \020\000\020\000\020\000\020\000\020\000\020\000\020\000\020\000\
    \020\000\020\000\020\000\020\000\020\000\020\000\020\000\020\000\
    \020\000\020\000\020\000\021\000\021\000\021\000\021\000\021\000\
    \021\000\021\000\021\000\021\000\021\000\037\000\084\000\085\000\
    \086\000\089\000\090\000\091\000\021\000\021\000\021\000\021\000\
    \021\000\021\000\021\000\021\000\021\000\021\000\021\000\021\000\
    \021\000\021\000\021\000\021\000\021\000\021\000\021\000\021\000\
    \021\000\021\000\021\000\021\000\021\000\021\000\093\000\095\000\
    \096\000\097\000\021\000\100\000\021\000\021\000\021\000\021\000\
    \021\000\021\000\021\000\021\000\021\000\021\000\021\000\021\000\
    \021\000\021\000\021\000\021\000\021\000\021\000\021\000\021\000\
    \021\000\021\000\021\000\021\000\021\000\021\000\023\000\029\000\
    \023\000\032\000\101\000\102\000\115\000\116\000\117\000\118\000\
    \119\000\029\000\118\000\032\000\120\000\121\000\023\000\023\000\
    \023\000\023\000\023\000\023\000\023\000\023\000\023\000\023\000\
    \023\000\122\000\124\000\126\000\127\000\128\000\130\000\023\000\
    \023\000\023\000\023\000\023\000\023\000\023\000\023\000\023\000\
    \023\000\023\000\023\000\023\000\023\000\023\000\023\000\023\000\
    \023\000\023\000\023\000\023\000\023\000\023\000\023\000\023\000\
    \023\000\131\000\132\000\133\000\134\000\023\000\134\000\023\000\
    \023\000\023\000\023\000\023\000\023\000\023\000\023\000\023\000\
    \023\000\023\000\023\000\023\000\023\000\023\000\023\000\023\000\
    \023\000\023\000\023\000\023\000\023\000\023\000\023\000\023\000\
    \023\000\025\000\135\000\137\000\138\000\139\000\140\000\141\000\
    \142\000\143\000\144\000\025\000\025\000\025\000\025\000\025\000\
    \025\000\025\000\025\000\025\000\025\000\146\000\148\000\149\000\
    \150\000\151\000\152\000\154\000\025\000\025\000\025\000\025\000\
    \025\000\025\000\025\000\025\000\025\000\025\000\025\000\025\000\
    \025\000\025\000\025\000\025\000\025\000\025\000\025\000\025\000\
    \025\000\025\000\025\000\025\000\025\000\025\000\155\000\156\000\
    \158\000\159\000\025\000\160\000\025\000\025\000\025\000\025\000\
    \025\000\025\000\025\000\025\000\025\000\025\000\025\000\025\000\
    \025\000\025\000\025\000\025\000\025\000\025\000\025\000\025\000\
    \025\000\025\000\025\000\025\000\025\000\025\000\047\000\136\000\
    \255\255\047\000\255\255\255\255\047\000\255\255\047\000\136\000\
    \255\255\047\000\255\255\255\255\255\255\255\255\255\255\047\000\
    \255\255\255\255\047\000\104\000\104\000\104\000\104\000\104\000\
    \104\000\104\000\104\000\104\000\104\000\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\104\000\104\000\104\000\104\000\
    \104\000\104\000\104\000\104\000\104\000\104\000\104\000\104\000\
    \104\000\104\000\104\000\104\000\104\000\104\000\104\000\104\000\
    \104\000\104\000\104\000\104\000\104\000\104\000\255\255\255\255\
    \255\255\255\255\104\000\255\255\104\000\104\000\104\000\104\000\
    \104\000\104\000\104\000\104\000\104\000\104\000\104\000\104\000\
    \104\000\104\000\104\000\104\000\104\000\104\000\104\000\104\000\
    \104\000\104\000\104\000\104\000\104\000\104\000\108\000\255\255\
    \108\000\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\108\000\108\000\
    \108\000\108\000\108\000\108\000\108\000\108\000\108\000\108\000\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\108\000\
    \108\000\108\000\108\000\108\000\108\000\108\000\108\000\108\000\
    \108\000\108\000\108\000\108\000\108\000\108\000\108\000\108\000\
    \108\000\108\000\108\000\108\000\108\000\108\000\108\000\108\000\
    \108\000\255\255\255\255\255\255\255\255\108\000\255\255\108\000\
    \108\000\108\000\108\000\108\000\108\000\108\000\108\000\108\000\
    \108\000\108\000\108\000\108\000\108\000\108\000\108\000\108\000\
    \108\000\108\000\108\000\108\000\108\000\108\000\108\000\108\000\
    \108\000\111\000\111\000\111\000\111\000\111\000\111\000\111\000\
    \111\000\111\000\111\000\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\111\000\111\000\111\000\111\000\111\000\111\000\
    \111\000\111\000\111\000\111\000\111\000\111\000\111\000\111\000\
    \111\000\111\000\111\000\111\000\111\000\111\000\111\000\111\000\
    \111\000\111\000\111\000\111\000\255\255\255\255\255\255\255\255\
    \111\000\255\255\111\000\111\000\111\000\111\000\111\000\111\000\
    \111\000\111\000\111\000\111\000\111\000\111\000\111\000\111\000\
    \111\000\111\000\111\000\111\000\111\000\111\000\111\000\111\000\
    \111\000\111\000\111\000\111\000\112\000\112\000\112\000\112\000\
    \112\000\112\000\112\000\112\000\112\000\112\000\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\112\000\112\000\112\000\
    \112\000\112\000\112\000\112\000\112\000\112\000\112\000\112\000\
    \112\000\112\000\112\000\112\000\112\000\112\000\112\000\112\000\
    \112\000\112\000\112\000\112\000\112\000\112\000\112\000\255\255\
    \255\255\255\255\255\255\112\000\255\255\112\000\112\000\112\000\
    \112\000\112\000\112\000\112\000\112\000\112\000\112\000\112\000\
    \112\000\112\000\112\000\112\000\112\000\112\000\112\000\112\000\
    \112\000\112\000\112\000\112\000\112\000\112\000\112\000\113\000\
    \113\000\113\000\113\000\113\000\113\000\113\000\113\000\113\000\
    \113\000\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \113\000\113\000\113\000\113\000\113\000\113\000\113\000\113\000\
    \113\000\113\000\113\000\113\000\113\000\113\000\113\000\113\000\
    \113\000\113\000\113\000\113\000\113\000\113\000\113\000\113\000\
    \113\000\113\000\255\255\255\255\255\255\255\255\113\000\255\255\
    \113\000\113\000\113\000\113\000\113\000\113\000\113\000\113\000\
    \113\000\113\000\113\000\113\000\113\000\113\000\113\000\113\000\
    \113\000\113\000\113\000\113\000\113\000\113\000\113\000\113\000\
    \113\000\113\000\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    ";
  Lexing.lex_base_code = 
   "";
  Lexing.lex_backtrk_code = 
   "";
  Lexing.lex_default_code = 
   "";
  Lexing.lex_trans_code = 
   "";
  Lexing.lex_check_code = 
   "";
  Lexing.lex_code = 
   "";
}

let rec lexer_main lexbuf =
    __ocaml_lex_lexer_main_rec lexbuf 0
and __ocaml_lex_lexer_main_rec lexbuf __ocaml_lex_state =
  match Lexing.engine __ocaml_lex_tables __ocaml_lex_state lexbuf with
      | 0 ->
# 11 "lexer.mll"
                            ( lexer_main lexbuf )
# 369 "lexer.ml"

  | 1 ->
# 12 "lexer.mll"
                       ( lexer_main lexbuf )
# 374 "lexer.ml"

  | 2 ->
let
# 13 "lexer.mll"
                    lxm
# 380 "lexer.ml"
= Lexing.sub_lexeme lexbuf lexbuf.Lexing.lex_start_pos lexbuf.Lexing.lex_curr_pos in
# 13 "lexer.mll"
                         ( INT(int_of_string lxm) )
# 384 "lexer.ml"

  | 3 ->
# 14 "lexer.mll"
                ( SEQ )
# 389 "lexer.ml"

  | 4 ->
# 15 "lexer.mll"
             ( DEFINE )
# 394 "lexer.ml"

  | 5 ->
# 16 "lexer.mll"
                ( ADD )
# 399 "lexer.ml"

  | 6 ->
# 17 "lexer.mll"
                   ( REMOVE )
# 404 "lexer.ml"

  | 7 ->
# 18 "lexer.mll"
                  ( UNION )
# 409 "lexer.ml"

  | 8 ->
# 19 "lexer.mll"
                  ( INTER )
# 414 "lexer.ml"

  | 9 ->
# 20 "lexer.mll"
                 ( DIFF )
# 419 "lexer.ml"

  | 10 ->
# 21 "lexer.mll"
                   ( LENGTH )
# 424 "lexer.ml"

  | 11 ->
# 22 "lexer.mll"
                ( GET )
# 429 "lexer.ml"

  | 12 ->
# 23 "lexer.mll"
                ( IF )
# 434 "lexer.ml"

  | 13 ->
# 24 "lexer.mll"
                   ( THEN )
# 439 "lexer.ml"

  | 14 ->
# 25 "lexer.mll"
                   ( ELSE )
# 444 "lexer.ml"

  | 15 ->
# 26 "lexer.mll"
                   ( TRUE )
# 449 "lexer.ml"

  | 16 ->
# 27 "lexer.mll"
                   ( FALSE )
# 454 "lexer.ml"

  | 17 ->
# 28 "lexer.mll"
           ( NOT )
# 459 "lexer.ml"

  | 18 ->
# 29 "lexer.mll"
               ( AND )
# 464 "lexer.ml"

  | 19 ->
# 30 "lexer.mll"
                ( OR )
# 469 "lexer.ml"

  | 20 ->
# 31 "lexer.mll"
                ( STRING ("") )
# 474 "lexer.ml"

  | 21 ->
# 32 "lexer.mll"
           ( CONCAT )
# 479 "lexer.ml"

  | 22 ->
let
# 33 "lexer.mll"
                lxm
# 485 "lexer.ml"
= Lexing.sub_lexeme lexbuf lexbuf.Lexing.lex_start_pos lexbuf.Lexing.lex_curr_pos in
# 33 "lexer.mll"
                      ( STRING (String.sub lxm 1 ((String.length lxm) - 2)) )
# 489 "lexer.ml"

  | 23 ->
let
# 34 "lexer.mll"
               lxm
# 495 "lexer.ml"
= Lexing.sub_lexeme lexbuf lexbuf.Lexing.lex_start_pos lexbuf.Lexing.lex_curr_pos in
# 34 "lexer.mll"
                     ( BOOLVAR (lxm) )
# 499 "lexer.ml"

  | 24 ->
let
# 35 "lexer.mll"
               lxm
# 505 "lexer.ml"
= Lexing.sub_lexeme lexbuf lexbuf.Lexing.lex_start_pos lexbuf.Lexing.lex_curr_pos in
# 35 "lexer.mll"
                    ( INTVAR (lxm) )
# 509 "lexer.ml"

  | 25 ->
let
# 36 "lexer.mll"
               lxm
# 515 "lexer.ml"
= Lexing.sub_lexeme lexbuf lexbuf.Lexing.lex_start_pos lexbuf.Lexing.lex_curr_pos in
# 36 "lexer.mll"
                    ( STRVAR (lxm) )
# 519 "lexer.ml"

  | 26 ->
let
# 37 "lexer.mll"
               lxm
# 525 "lexer.ml"
= Lexing.sub_lexeme lexbuf lexbuf.Lexing.lex_start_pos lexbuf.Lexing.lex_curr_pos in
# 37 "lexer.mll"
                    ( LANGVAR (lxm) )
# 529 "lexer.ml"

  | 27 ->
# 38 "lexer.mll"
           ( LCURLY )
# 534 "lexer.ml"

  | 28 ->
# 39 "lexer.mll"
           ( RCURLY )
# 539 "lexer.ml"

  | 29 ->
# 40 "lexer.mll"
           ( SEP )
# 544 "lexer.ml"

  | 30 ->
# 41 "lexer.mll"
                   ( PLUS )
# 549 "lexer.ml"

  | 31 ->
# 42 "lexer.mll"
                ( MINUS )
# 554 "lexer.ml"

  | 32 ->
# 43 "lexer.mll"
                ( MULT )
# 559 "lexer.ml"

  | 33 ->
# 44 "lexer.mll"
                ( DIVIDE )
# 564 "lexer.ml"

  | 34 ->
# 45 "lexer.mll"
           ( MOD )
# 569 "lexer.ml"

  | 35 ->
# 46 "lexer.mll"
                   ( LESSTHAN )
# 574 "lexer.ml"

  | 36 ->
# 47 "lexer.mll"
              ( GREATERTHAN )
# 579 "lexer.ml"

  | 37 ->
# 48 "lexer.mll"
               ( EQUALS )
# 584 "lexer.ml"

  | 38 ->
# 49 "lexer.mll"
                ( LPAREN )
# 589 "lexer.ml"

  | 39 ->
# 50 "lexer.mll"
                ( RPAREN )
# 594 "lexer.ml"

  | 40 ->
# 51 "lexer.mll"
                   ( ASSIGN )
# 599 "lexer.ml"

  | 41 ->
# 52 "lexer.mll"
                  ( LOAD )
# 604 "lexer.ml"

  | 42 ->
# 53 "lexer.mll"
                 ( READLANG )
# 609 "lexer.ml"

  | 43 ->
# 54 "lexer.mll"
                ( READINT )
# 614 "lexer.ml"

  | 44 ->
# 55 "lexer.mll"
              ( UNTIL )
# 619 "lexer.ml"

  | 45 ->
# 56 "lexer.mll"
              ( PRINT )
# 624 "lexer.ml"

  | 46 ->
# 57 "lexer.mll"
                  ( PRINTLANG )
# 629 "lexer.ml"

  | 47 ->
# 58 "lexer.mll"
                     ( PRINTLINELANG )
# 634 "lexer.ml"

  | 48 ->
# 59 "lexer.mll"
                         ( PRINTNEWLINE )
# 639 "lexer.ml"

  | 49 ->
# 60 "lexer.mll"
                  ( PRINTLINE )
# 644 "lexer.ml"

  | 50 ->
# 61 "lexer.mll"
              ( WHILE )
# 649 "lexer.ml"

  | 51 ->
# 62 "lexer.mll"
              ( BREAK )
# 654 "lexer.ml"

  | 52 ->
# 63 "lexer.mll"
            ( DO )
# 659 "lexer.ml"

  | 53 ->
# 64 "lexer.mll"
             ( END )
# 664 "lexer.ml"

  | 54 ->
# 65 "lexer.mll"
                      ( EOF )
# 669 "lexer.ml"

  | __ocaml_lex_state -> lexbuf.Lexing.refill_buff lexbuf; 
      __ocaml_lex_lexer_main_rec lexbuf __ocaml_lex_state

;;
