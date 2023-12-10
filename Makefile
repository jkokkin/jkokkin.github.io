# Makefile for the basis site

RDIR=ttic.uchicago.edu:~gpapan/public_html/basis14

DOCS=index program

HDOCS=$(addsuffix .html, $(DOCS))
PHDOCS=$(HDOCS)
#PHDOCS=$(addprefix html/, $(HDOCS))

all : $(PHDOCS)

# Implicit make rule
%.html : %.jemdoc MENU refs.html
	jemdoc -o $@ $<

.PHONY : docs update clean

docs : $(PHDOCS)

update : $(PHDOCS)
	@echo 'Copying to server...'
	rm -f *~
	rsync -av * ${RDIR}
	@echo ' done.'

clean :	
	rm $(PHDOCS)
	rm -f *~
