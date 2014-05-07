GENFILES=qrpc.proto

all: $(GENFILES) QRPC.pdf

%.pdf: %.tex
	rubber --pdf $<
%.tex: %.nw
	noweave -x -latex -delay <$< >$@

$(GENFILES): %: QRPC.nw
	notangle -R$* -L"//line %F:%L%N" $< |cpif $@
