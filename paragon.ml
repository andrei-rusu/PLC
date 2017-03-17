open Evaluator;;
open Printf;;

let parseProgram c = 
    try let lexbuf = Lexing.from_channel c in  
            Parser.parser_main Lexer.lexer_main lexbuf 
    with Parsing.Parse_error -> failwith "Parse failure!";;


let arg = ref stdin in
let setProg p = arg := open_in p in
let usage = "./mysplitinterpreter PROGRAM_FILE" in
Arg.parse [] setProg usage ; 
let parsedProg = parseProgram !arg in
let () = evalMainRoot parsedProg in
flush stdout
;;