exception LookupError ;;
exception TypeError ;;
exception UnboundVariableError;;
exception Terminated ;;
exception StuckTerm ;;
exception NonBaseTypeResult;;

exception BreakLoop;;
exception IllegalArg;;
exception BindingNotFound;;

open AbstractSyntaxTree;;
open Printf;;
open Str;;

(* Defining the string set constructor module *)
module SetConstructor = Set.Make(String);;
module MapConstructor = Map.Make(String);;

(* Results types *)
type result = BooleanResult of bool | IntegerResult of int | StringResult of string | LanguageResult of SetConstructor.t


(* ----------------- Useful Functions ---------------------*)

let replaceColonWithEmpty (element:string) =
	if (element = ":") then ""
	else element
;;

let replaceEmptyWithColon (element:string) =
	if (element = "") then ":"
	else element
;;

(* Types converters from string -> string list -> SetConstructor.t *)
let rec list_of_string (str:string) = 
let noBracketsAndSpace = (Str.global_replace (Str.regexp "[ '{' | '}' | ' ' ]") "" str) in
let initialList = (Str.split_delim (Str.regexp ",") noBracketsAndSpace) in
List.map replaceColonWithEmpty initialList;;
		
let lang_of_list (lst:string list) =
List.fold_right SetConstructor.add lst SetConstructor.empty;;
		
let lang_of_string (str:string) =
lang_of_list (list_of_string str);;


let lstOfLines = ref [];;

let processInput () = 
	try
		while true do
		let line = input_line stdin in
			lstOfLines := !lstOfLines @[line]
		done;
		with End_of_file -> print_string ""
;;



(* Maps holding variable bindings *)

let boolMap = ref MapConstructor.empty;;
let intMap = ref MapConstructor.empty;;
let strMap = ref MapConstructor.empty;;
let langMap = ref MapConstructor.empty;;


(* Function to look up the type of a string name variable in a map of bindings *)
let lookupBool (var:string) =  
	try MapConstructor.find var !boolMap
	with Not_found -> failwith ("Variable " ^ var ^ " not found!")
;;

let lookupInt (var:string) =
	try MapConstructor.find var !intMap
	with Not_found -> failwith ("Variable " ^ var ^ " not found!")
;;

let lookupStr (var:string) = 
	try MapConstructor.find var !strMap
	with Not_found -> failwith ("Variable " ^ var ^ " not found!")
;;

let lookupLang (var:string) = 
	try MapConstructor.find var !langMap
	with Not_found -> failwith ("Variable " ^ var ^ " not found!")
;;

let existingBinding map (var:string) = 
	MapConstructor.mem var !map
;;


(* Function to add an extra entry in to a map of bindings *)
let addBinding map (var: string) value =
	map := MapConstructor.add var value !map
;;

(* Function to set an already existing entry in the map of bindings to a new value *)
let replaceBinding map (var: string) value =
	let exists = existingBinding map var in
		if (exists) then map := MapConstructor.add var value !map
		else (prerr_string "Binding not found" ; raise BindingNotFound)
;;



(* ----------------- Useful Functions --------------------- *)


(* ----------------- Reading Functions --------------------- *)


let readInt (x: int) =
	int_of_string (String.trim (List.nth !lstOfLines x))
;;

let readLang (x: int) =
	lang_of_string (List.nth !lstOfLines x)
;;
	

(* ----------------- End Reading Functions --------------------- *)


(* ----------------- Printing Functions --------------------- *)

let print_language (s:SetConstructor.t) (lim:int) = 
	let length = SetConstructor.cardinal s in
	let x = ref 1 in
	let finishPrint = ref false in
	let print_set_element (element:string) =
		let elementColon = replaceEmptyWithColon element in
		if (not !finishPrint) then
		if (!x<lim && !x<length) then (print_string (elementColon^", ") ; x := !x+1 )
		else if (!x==lim || !x==length) then (print_string elementColon ; finishPrint := true ) in
	print_string "{" ; SetConstructor.iter print_set_element s ; print_string "}" ; flush stdout
;;

let print_type_op e = (match e with
	| BooleanResult b -> printf "%B" b
	| IntegerResult i -> print_int i
	| StringResult s -> print_string s
	| LanguageResult l -> print_language l (SetConstructor.cardinal l));
	flush stdout
;;



(* ----------------- End Printing Functions --------------------- *)

(* ----------------- End Evaluating expressions --------------------- *)

let evalBool e = match e with
	| Boolean b -> b
	| BoolVariable boolVar -> (lookupBool boolVar)
;;


let evalInt e = match e with
	| Integer i -> i
	| IntVariable intVar -> (lookupInt intVar)
	| ReadInt lineNo -> (readInt lineNo)
;;


let evalString e = match e with
	| StringType s -> s
	| StrVariable strVar -> (lookupStr strVar)
;;


let evalLang e = match e with
	| Language l  -> l
	| LangVariable langVar -> (lookupLang langVar)
	| ReadLang lineNo -> (readLang lineNo)
;;


let evalLangOp e = match e with
	| LanguageVal langValue -> evalLang langValue
	| LangAdd (lang, str) -> let langOpValue = evalLang lang in
						     let strOpValue = evalString str in
							 SetConstructor.add strOpValue langOpValue
	| LangRemove (lang, str) -> let langOpValue = evalLang lang in
								let strValue = evalString str in
								SetConstructor.remove strValue langOpValue 
	| LangUnion (lang1, lang2) -> let langOpValue1 = evalLang lang1 in
								  let langOpValue2 = evalLang lang2 in
								SetConstructor.union langOpValue1 langOpValue2
	| LangInter (lang1, lang2) -> let langOpValue1 = evalLang lang1 in
								  let langOpValue2 = evalLang lang2 in
								  SetConstructor.inter langOpValue1 langOpValue2 
	| LangDiff (lang1, lang2) -> let langOpValue1 = evalLang lang1 in
								 let langOpValue2 = evalLang lang2 in
								 SetConstructor.diff langOpValue1 langOpValue2
;;


let rec evalIntOp e = match e with
	| IntVal intVal -> evalInt intVal
	| Plus (intOp1, intOp2) -> let intOpVal1 = evalIntOp intOp1 in
							   let intOpVal2 = evalIntOp intOp2 in
							   intOpVal1 + intOpVal2
	| Minus (intOp1, intOp2) -> let intOpVal1 = evalIntOp intOp1 in
							    let intOpVal2 = evalIntOp intOp2 in
							    intOpVal1 - intOpVal2
	| Mult (intOp1, intOp2) ->  let intOpVal1 = evalIntOp intOp1 in
							    let intOpVal2 = evalIntOp intOp2 in
							    intOpVal1 * intOpVal2
	| Div (intOp1, intOp2) ->  let intOpVal1 = evalIntOp intOp1 in
							   let intOpVal2 = evalIntOp intOp2 in
							   intOpVal1 / intOpVal2
	| Mod (intOp1, intOp2) ->  let intOpVal1 = evalIntOp intOp1 in
							   let intOpVal2 = evalIntOp intOp2 in
							   intOpVal1 mod intOpVal2
	| Uminus intOp -> let intOpVal = evalIntOp intOp in (-intOpVal)
	| LangLength langOp -> let langOpVal = evalLangOp langOp in SetConstructor.cardinal langOpVal
;;


let rec evalBoolOp e = match e with
	| BooleanVal booleanValue -> evalBool booleanValue
	| Not boolOp -> let boolOpVal = evalBoolOp boolOp in (not boolOpVal)
	| And (boolOp1, boolOp2) -> let boolOpVal1 = evalBoolOp boolOp1 in
								let boolOpVal2 = evalBoolOp boolOp2 in
								boolOpVal1 && boolOpVal2
	| Or (boolOp1, boolOp2) -> let boolOpVal1 = evalBoolOp boolOp1 in
							   let boolOpVal2 = evalBoolOp boolOp2 in
							   boolOpVal1 || boolOpVal2
	| Equals (intOp1, intOp2) -> let intOpVal1 = evalIntOp intOp1 in
								 let intOpVal2 = evalIntOp intOp2 in
								 intOpVal1 == intOpVal2
	| LessThan (intOp1, intOp2) -> let intOpVal1 = evalIntOp intOp1 in
								   let intOpVal2 = evalIntOp intOp2 in
								   intOpVal1 < intOpVal2
	| GreaterThan (intOp1, intOp2) -> let intOpVal1 = evalIntOp intOp1 in
									  let intOpVal2 = evalIntOp intOp2 in
									  intOpVal1 > intOpVal2
;;


let rec evalStrOp e = match e with
	| StringVal strValue -> evalString strValue
	| Concat (strTypeOp1, stringTypeOp2) -> let strValue = evalStrOp strTypeOp1 in
											let strOpValue = evalStrOp stringTypeOp2 in
											strValue ^ strOpValue
	| LangGet (langTypeOp, intTypeOp) -> let langOpVal = evalLangOp langTypeOp in
										 let intOpVal = evalIntOp intTypeOp in
										 List.nth (SetConstructor.elements langOpVal) intOpVal
;;



let evalTypesOp e = match e with
	| BooleanTypeOp booleanTypeOp -> BooleanResult (evalBoolOp booleanTypeOp)
	| IntTypeOp intTypeOp -> IntegerResult (evalIntOp intTypeOp)
	| StringTypeOp stringTypeOp -> StringResult (evalStrOp stringTypeOp)
	| LanguageTypeOp languageTypeOp -> LanguageResult (evalLangOp languageTypeOp)
;;


let evalPrintOp e = match e with
	| Print operationOnTypes -> let opOnTypesResult = (evalTypesOp operationOnTypes) in print_type_op opOnTypesResult
	| PrintLang (lang, limit) -> let opOnTypesResult = (evalLangOp lang) in
								 let intLimitPrint = (evalIntOp limit) in
								 print_language opOnTypesResult intLimitPrint
	| PrintLineLang (lang, limit) -> let opOnTypesResult = (evalLangOp lang) in
									 let intLimitPrint = (evalIntOp limit) in
									 print_language opOnTypesResult intLimitPrint ; print_string "\n"
	| PrintLine operationOnTypes -> let opOnTypesResult = (evalTypesOp operationOnTypes) in print_type_op opOnTypesResult; print_string "\n"
	| PrintNewLine -> print_string "\n"
;;


let evalDefineOp e = match e with
	| DefineBool (str, booleanTypeOp) -> let boolVal = (evalBoolOp booleanTypeOp) in
		(addBinding boolMap str boolVal)
	| DefineInt (str, intTypeOp) -> let intVal = (evalIntOp intTypeOp) in
		(addBinding intMap str intVal)
	| DefineStr (str, stringTypeOp) -> let strVal = (evalStrOp stringTypeOp) in
		(addBinding strMap str strVal)
	| DefineLang (str, languageTypeOp) -> let langVal = (evalLangOp languageTypeOp) in
		(addBinding langMap str langVal)
;;


let evalAssignOp e = match e with
	| SetBool (str, booleanTypeOp) -> let boolVal = (evalBoolOp booleanTypeOp) in
		(replaceBinding boolMap str boolVal)
	| SetInt (str, intTypeOp) -> let intVal = (evalIntOp intTypeOp) in
		(replaceBinding intMap str intVal)
	| SetStr (str, stringTypeOp) -> let strVal = (evalStrOp stringTypeOp) in
		(replaceBinding strMap str strVal)
	| SetLang (str, languageTypeOp) -> let langVal = (evalLangOp languageTypeOp) in
		(replaceBinding langMap str langVal)
;;


let rec evalOperation e = match e with
	| Load -> processInput ()  (* TODO: needs to be implemented *)
	| Break -> raise BreakLoop
	| OperationPrint operationPrint -> evalPrintOp operationPrint
	| OperationDefine operationDefine -> evalDefineOp operationDefine
	| OperationAssign operationAssign -> evalAssignOp operationAssign
	| OperationOnTypes operationOnTypes -> ignore (evalTypesOp operationOnTypes)
;;


let rec evalStatement e = match e with
	| Operation o -> evalOperation o
	| IfStatement (boolOp, expression) -> let boolVal = (evalBoolOp boolOp) in
		if (boolVal) then (evalExpr expression)
	| IfElseStatement (boolOp, expressionTr, expressionFl) -> let boolVal = (evalBoolOp boolOp) in
		if (boolVal) then (evalExpr expressionTr) else (evalExpr expressionFl)
	| WhileStatement(boolOp, expression) -> 
		try while (evalBoolOp boolOp) do (evalExpr expression) done
		with BreakLoop ->  ()
and evalExpr e = match e with
	| Statement st -> evalStatement st
	| Sequence (expr, st) -> evalExpr expr ; evalStatement st
;;

let evalMainRoot e = match e with
	| Main expr -> evalExpr expr
;;


(* ----------------- End Evaluating expressions --------------------- *)

let print_res e =
	print_string "DA";;
