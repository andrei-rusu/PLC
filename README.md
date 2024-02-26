
# Paragon Language - Interpreter
---------- Version 1.01 ----------

The Paragon Interpreter was implemented using OCaml 4.02.3.
It allows the interpretation of programs written in Paragon, a domain-specific programming language specialized in language problems.

==================================

In this distribution you can find:

	* lexer.mll -> the lexing component of the interpreter
	* parser.mly -> the parsing component of the interpreter
	+ abstractSyntaxTree.ml -> used to define the Abstract Syntax Tree of the language
	+ evaluator.ml -> the component which evaluates the syntax tree if it was correctly produced
			  by the parsing component
	+ paragon.ml -> the "main" of the interpreter; it uses all the other components to "interpret"
			a program writen in Paragon.
	+ Makefile -> allows the compiltation of all the modules in the package; 
		      the executable for the Paragon interpreter "mysplinterpreter" will be produced
		      after invoking the "make" command in this folder

=================================

To run the interpreter simply invoke the "make" command in a linux terminal and then run the executable
produced after the compilation step: "./mysplinterpreter"
To let the interpreter "run" a specific program written in Paragon, simply give it as a parameter to the
command mentioned above: "./mysplinterpreter program.spl"


Authors:
- Andrei Rusu
- Eugen Robert Patrascu