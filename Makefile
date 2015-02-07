#!/usr/bin/make -f
CCO       = -interaction nonstopmode
CCS       = > /dev/null
CC        = pdflatex ${CCO} $< ${CCS}
SOURCE    = $(wildcard *.tex)
CIBLE     = $(patsubst %.tex,%.pdf,${SOURCE})

.PHONY:all force clean mrpropre
all: force ${SOURCE} clean

%.pdf:%.tex
	@${CC} ; ${CC}
	@echo -e "\n\n\n\n\n\n==============================="
	@texloganalyser -ewr $(patsubst %.pdf, %.log, $@)
	@echo "Compilation de $@ terminée"

force:
	@echo "Force la compilation des cibles : ${SOURCE}"
	@touch ${SOURCE}

clean:
	find . -iregex ".*\.\(aux\|log\|toc\|dvi\|ps\|out\)" -delete
	@echo "Fichiers temporaires supprimés"

mrpropre: clean
	@rm -vf ${CIBLE}
	@echo "Fichiers cibles supprimés"

