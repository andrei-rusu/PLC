/* File parser.mly */

%{
    open AbstractSyntaxTree;;
	module SetConstructor = Set.Make(String);;
%}

%token <int> INT
%token <string> BOOLVAR INTVAR STRVAR LANGVAR
%token <string> STRING
%token TRUE FALSE
%token LOAD
%token SEQ
%token LAMBDA
%token PLUS MINUS MULT DIVIDE MOD
%token UMINUS
%token AND OR NOT
%token LPAREN RPAREN
%token APPLY
%token LCURLY RCURLY SEP
%token DEFINE LET SCOPE ASSIGN 
%token IF THEN ELSE
%token LOWER_THAN_ELSE
%token WHILE DO END
%token BREAK
%token ADD REMOVE
%token UNION INTER DIFF LENGTH GET
%token CONCAT
%token LESSTHAN GREATERTHAN EQUALS
%token READLANG READINT
%token PRINT PRINTLINE PRINTNEWLINE
%token PRINTLANG PRINTLINELANG
%token UNTIL
%token EOF

%left SEQ
%left OR
%left AND
%nonassoc LESSTHAN GREATERTHAN EQUALS
%nonassoc LOWER_THAN_ELSE
%nonassoc IF THEN ELSE
%nonassoc WHILE DO END
%left CONCAT
%left PLUS MINUS
%left MULT DIVIDE MOD
%nonassoc NOT UMINUS


%start parser_main             /* the entry point */

%type <AbstractSyntaxTree.mainRoot> parser_main
%type <AbstractSyntaxTree.expression> expression
%type <AbstractSyntaxTree.statement> statement
%type <AbstractSyntaxTree.operation> operation
%type <AbstractSyntaxTree.operationPrint> print_op
%type <AbstractSyntaxTree.operationDefine> def_op
%type <AbstractSyntaxTree.operationAssign> assign_op
%type <AbstractSyntaxTree.operationOnTypes> ops_on_types
%type <AbstractSyntaxTree.booleanVal> boolean_val
%type <AbstractSyntaxTree.booleanTypeOp> boolean_op
%type <AbstractSyntaxTree.intVal> int_val
%type <AbstractSyntaxTree.intTypeOp> int_op
%type <AbstractSyntaxTree.stringVal> string_val
%type <AbstractSyntaxTree.stringTypeOp> string_op
%type <AbstractSyntaxTree.languageVal> language_val
%type <AbstractSyntaxTree.languageTypeOp> language_op


%%

parser_main: expression SEQ EOF 						{ Main $1 }

;

expression: statement									{ Statement $1 }
 | expression SEQ statement		   						{ Sequence ($1, $3) }

;

statement: operation														{ Operation $1 }
 | IF LPAREN boolean_op RPAREN THEN expression %prec LOWER_THAN_ELSE END	{ IfStatement ($3, $6) }
 | IF LPAREN boolean_op RPAREN THEN expression ELSE expression END			{ IfElseStatement ($3, $6, $8) }
 | WHILE LPAREN boolean_op RPAREN DO expression END 						{ WhileStatement ($3, $6) }
 
;

operation: LOAD										    { Load }
 | BREAK												{ Break }
 | print_op												{ OperationPrint $1 }
 | def_op												{ OperationDefine $1 }
 | assign_op											{ OperationAssign $1 }
 | ops_on_types											{ OperationOnTypes $1 }

;

print_op:  PRINT ops_on_types			   				{ Print $2 }
 | PRINTLANG language_op UNTIL int_op					{ PrintLang ($2, $4)}
 | PRINTLINE ops_on_types			   					{ PrintLine $2 }
 | PRINTLINELANG language_op UNTIL int_op				{ PrintLineLang ($2, $4)}
 | PRINTNEWLINE		   		   							{ PrintNewLine }

;

def_op: DEFINE BOOLVAR ASSIGN boolean_op				{ DefineBool ($2, $4) }
 | DEFINE INTVAR ASSIGN int_op							{ DefineInt ($2, $4) }
 | DEFINE STRVAR ASSIGN string_op						{ DefineStr ($2, $4) }
 | DEFINE LANGVAR ASSIGN language_op					{ DefineLang ($2, $4) }
 
;

assign_op: BOOLVAR ASSIGN boolean_op					{ SetBool ($1, $3) }
 | INTVAR ASSIGN int_op									{ SetInt ($1, $3) }
 | STRVAR ASSIGN string_op								{ SetStr ($1, $3) }
 | LANGVAR ASSIGN language_op							{ SetLang ($1, $3) }
 
;

ops_on_types: boolean_op								{ BooleanTypeOp $1 }
 | int_op												{ IntTypeOp $1 }
 | string_op											{ StringTypeOp $1 }
 | language_op											{ LanguageTypeOp $1 }

 
;

boolean_val: FALSE										{ Boolean false }
 | TRUE													{ Boolean true }
 | BOOLVAR												{ BoolVariable $1}

;

boolean_op: boolean_val									{ BooleanVal $1 }
 | NOT boolean_op										{ Not $2 }
 | boolean_op AND boolean_op							{ And ($1, $3) }
 | boolean_op OR boolean_op								{ Or ($1, $3) }
 | int_op EQUALS int_op									{ Equals($1, $3) }
 | int_op LESSTHAN int_op								{ LessThan($1, $3) }
 | int_op GREATERTHAN int_op							{ GreaterThan($1, $3) }
 | LPAREN boolean_op RPAREN								{ $2 }
;
 
int_val: INT											{ Integer $1 }
 | INTVAR												{ IntVariable $1 }
 | READINT INT											{ ReadInt $2 }
 
;

int_op:  int_val										{ IntVal $1 }
 | int_op PLUS int_op              						{ Plus ($1, $3) }
 | int_op MINUS int_op			   						{ Minus ($1, $3) }
 | int_op MULT int_op			   						{ Mult ($1, $3) }
 | int_op DIVIDE int_op			   						{ Div ($1, $3) }
 | int_op MOD int_op			   						{ Mod ($1, $3) }
 | MINUS int_op %prec UMINUS    						{ Uminus $2 }
 | LENGTH language_op									{ LangLength $2 }
 | LPAREN int_op RPAREN									{ $2 }
 
;
 
string_val: STRING										{ StringType $1 }
 | STRVAR												{ StrVariable $1 }
 
;

string_op: string_val									{ StringVal $1 }
 | string_op CONCAT string_op							{ Concat ($1, $3) }
 | GET language_op int_op								{ LangGet ($2, $3) }
 | LPAREN string_op RPAREN								{ $2 }
 
;
 
language_val: LCURLY language RCURLY					{ Language $2 }
 | LANGVAR												{ LangVariable $1 }
 | READLANG INT											{ ReadLang $2 }
 
;

language:												{ SetConstructor.empty }
 | language STRING										{ SetConstructor.add $2 $1 }
 | language SEP STRING									{ SetConstructor.add $3 $1 }
 
;
 
language_op: language_val								{ LanguageVal $1 }
 | ADD language_val string_val 							{ LangAdd ($2, $3) }
 | REMOVE language_val string_val						{ LangRemove ($2, $3) }
 | UNION language_val language_val						{ LangUnion ($2, $3) }
 | INTER language_val language_val						{ LangInter ($2, $3) }
 | DIFF language_val language_val						{ LangDiff ($2, $3) }
 | LPAREN language_op RPAREN							{ $2 }
 
;