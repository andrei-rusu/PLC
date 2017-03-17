SOURCES = parser.mly lexer.mll abstractSyntaxTree.ml evaluator.ml paragon.ml
EXEC = mysplinterpreter

CAMLC = ocamlc
CAMLOPT = ocamlopt
CAMLDEP = ocamldep
CAMLLEX = ocamllex
CAMLYACC = ocamlyacc

LIBS = str.cma

all:: .depend.input .depend $(EXEC)

opt : $(EXEC).opt

SMLIY = $(SOURCES:.mly=.ml)
SMLIYL = $(SMLIY:.mll=.ml)
SMLYL = $(filter %.ml,$(SMLIYL))
OBJS = $(SMLYL:.ml=.cmo)
OPTOBJS = $(OBJS:.cmx=.cmx)


$(EXEC): $(OBJS) 
	$(CAMLC) $(CUSTOM) -o $(EXEC) $(LIBS) $(OBJS)

.SUFFIXES: .ml .mli .cmo .cmi .cmx .mll .mly 

.ml.cmo:
	$(CAMLC) -c $<

.mli.cmi:
	$(CAMLC) -c $<

.ml.cmx:
	$(CAMLOPT) -c $<

.mll.cmo:
	$(CAMLLEX) $<
	$(CAMLC) -c $*.ml

.mll.cmx:
	$(CAMLLEX) $<
	$(CAMLOPT) -c $*.ml

.mly.cmo:
	$(CAMLYACC) $<
	$(CAMLC) -c $*.mli
	$(CAMLC) -c $*.ml

.mly.cmx:
	$(CAMLYACC) $<
	$(CAMLOPT) -c $*.mli
	$(CAMLOPT) -c $*.ml

.mly.cmi:
	$(CAMLYACC) $<
	$(CAMLC) -c $*.mli

.mll.ml:
	$(CAMLLEX) $<

.mly.ml:
	$(CAMLYACC) $<

clean::
	rm -f *.cm[iox] *~ .*~ #*#
	rm -rf lexer.ml parser.ml parser.mli *.o
	rm -rf .depend .depend.input
	rm -f $(EXEC)
	rm -f $(EXEC).opt

.depend.input: Makefile
	@echo -n '--Checking Ocaml input files: '
	@(ls $(SMLIY) $(SMLIY:.ml=.mli) 2>/dev/null || true) \
	     >  .depend.new
	@diff .depend.new .depend.input 2>/dev/null 1>/dev/null && \
	    (echo 'unchanged'; rm -f .depend.new) || \
	    (echo 'changed'; mv .depend.new .depend.input)

depend: .depend

.depend:: $(SMLIY) .depend.input
	@echo '--Re-building dependencies'
	$(CAMLDEP) $(SMLIY) $(SMLIY:.ml=.mli) > .depend

include .depend

