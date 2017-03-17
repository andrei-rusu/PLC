module SetConstructor = Set.Make(String)

type booleanVal = 
	| Boolean of bool
	| BoolVariable of string
;;

type intVal = 
	| Integer of int
	| IntVariable of string
	| ReadInt of int
;;

type stringVal = 
	| StringType of string
	| StrVariable of string
;;

type languageVal = 
	| Language of SetConstructor.t
	| LangVariable of string
	| ReadLang of int
;;

type languageTypeOp =
	| LanguageVal of languageVal
	| LangAdd of languageVal * stringVal
	| LangRemove of languageVal * stringVal
	| LangUnion of languageVal * languageVal
	| LangInter of languageVal * languageVal
	| LangDiff of languageVal * languageVal
;;

type intTypeOp =
	| IntVal of intVal
	| Plus of intTypeOp * intTypeOp
	| Minus of intTypeOp * intTypeOp
	| Mult of intTypeOp * intTypeOp
	| Div of intTypeOp * intTypeOp
	| Mod of intTypeOp * intTypeOp
	| Uminus of intTypeOp
	| LangLength of languageTypeOp
;;

type booleanTypeOp =
	| BooleanVal of booleanVal
	| Not of booleanTypeOp
	| And of booleanTypeOp * booleanTypeOp
	| Or of booleanTypeOp * booleanTypeOp
	| Equals of intTypeOp * intTypeOp
	| LessThan of intTypeOp * intTypeOp
	| GreaterThan of intTypeOp * intTypeOp
;;

type stringTypeOp =
	| StringVal of stringVal
	| Concat of stringTypeOp * stringTypeOp
	| LangGet of languageTypeOp * intTypeOp
;;


type operationOnTypes =
	| BooleanTypeOp of booleanTypeOp
	| IntTypeOp of intTypeOp
	| StringTypeOp of stringTypeOp
	| LanguageTypeOp of languageTypeOp
;;

type operationPrint =
	| Print of operationOnTypes
	| PrintLang of languageTypeOp * intTypeOp
	| PrintLine of operationOnTypes
	| PrintLineLang of languageTypeOp * intTypeOp
	| PrintNewLine
;;

type operationDefine =
	| DefineBool of string * booleanTypeOp
	| DefineInt of string * intTypeOp
	| DefineStr of string * stringTypeOp
	| DefineLang of string * languageTypeOp
;;

type operationAssign =
	| SetBool of string * booleanTypeOp
	| SetInt of string * intTypeOp
	| SetStr of string * stringTypeOp
	| SetLang of string * languageTypeOp
;;

type operation = 
	| Load
	| Break
	| OperationPrint of operationPrint
	| OperationDefine of operationDefine
	| OperationAssign of operationAssign
	| OperationOnTypes of operationOnTypes
;;

type statement =
	| Operation of operation
	| IfStatement of booleanTypeOp * expression
	| IfElseStatement of booleanTypeOp * expression * expression
	| WhileStatement of booleanTypeOp * expression
and expression =
	| Statement of statement
	| Sequence of expression * statement
;;
	
type mainRoot =
	| Main of expression
;;
