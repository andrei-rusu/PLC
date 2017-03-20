open Evaluator;;
open Printf;;

let failwith mes = ksprintf failwith mes ;;

let parseProgram c = 
    let lexbuf = Lexing.from_channel c in  
	try
      Parser.parser_main Lexer.lexer_main lexbuf
    with 
		| Parsing.Parse_error ->
		  begin
			let curr = lexbuf.Lexing.lex_curr_p in
			let line = curr.Lexing.pos_lnum in
			let cnum = curr.Lexing.pos_cnum - curr.Lexing.pos_bol in
			let tok = Lexing.lexeme lexbuf in
			failwith "Parsing failed at line %d, column %d, while processing token '%s'." line cnum tok
		  end
		| Failure e ->
		  begin
			let curr = lexbuf.Lexing.lex_curr_p in
			let line = curr.Lexing.pos_lnum in
			let cnum = curr.Lexing.pos_cnum - curr.Lexing.pos_bol in
			let tok = Lexing.lexeme lexbuf in
			failwith "Input-processing failed at line %d, column %d, while processing token '%s'. Casue of failure: '%s'." line cnum tok e
		  end
;;


let arg = ref stdin in
let setProg p = arg := open_in p in
let usage = "./mysplinterpreter PROGRAM_FILE" in
Arg.parse [] setProg usage ; let parsedProg = parseProgram !arg in
let () = evalMainRoot parsedProg in
flush stdout
;;