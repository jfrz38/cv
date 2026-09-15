SHELL := bash
.SHELLFLAGS := -eu -o pipefail -c
.DEFAULT_GOAL := help

TARGET := cv
OUTDIR := build
SITE_DIR := site
LATEX := xelatex
LATEX_FLAGS := -interaction=nonstopmode -halt-on-error -file-line-error -output-directory="$(OUTDIR)"

.PHONY: help
help: ## Show available targets
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {sub("\\\\n",sprintf("\n%22c"," "), $$2);printf " \033[36m%-20s\033[0m  %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.PHONY: all es en no-hexacode

all: es en ## Build the Spanish and English CVs

es: ## Build the Spanish CV
	mkdir -p "$(OUTDIR)"
	$(LATEX) $(LATEX_FLAGS) -jobname="$(TARGET)-es" '\def\cvlang{es}\def\cvincludehexacode{1}\input{$(TARGET).tex}'
	$(LATEX) $(LATEX_FLAGS) -jobname="$(TARGET)-es" '\def\cvlang{es}\def\cvincludehexacode{1}\input{$(TARGET).tex}'

en: ## Build the English CV
	mkdir -p "$(OUTDIR)"
	$(LATEX) $(LATEX_FLAGS) -jobname="$(TARGET)-en" '\def\cvlang{en}\def\cvincludehexacode{1}\input{$(TARGET).tex}'
	$(LATEX) $(LATEX_FLAGS) -jobname="$(TARGET)-en" '\def\cvlang{en}\def\cvincludehexacode{1}\input{$(TARGET).tex}'

no-hexacode: ## Build the Spanish CV without Hexacode experience
	mkdir -p "$(OUTDIR)"
	$(LATEX) $(LATEX_FLAGS) -jobname="$(TARGET)-es" '\def\cvlang{es}\def\cvincludehexacode{0}\input{$(TARGET).tex}'
	$(LATEX) $(LATEX_FLAGS) -jobname="$(TARGET)-es" '\def\cvlang{es}\def\cvincludehexacode{0}\input{$(TARGET).tex}'

.PHONY: site serve
site: all ## Prepare the static website with the latest PDFs
	cp "$(OUTDIR)/$(TARGET)-es.pdf" "$(SITE_DIR)/$(TARGET)-es.pdf"
	cp "$(OUTDIR)/$(TARGET)-en.pdf" "$(SITE_DIR)/$(TARGET)-en.pdf"

serve: site ## Serve the website at http://localhost:8000
	python -m http.server 8000 --directory "$(SITE_DIR)"

.PHONY: clean
clean: ## Remove generated files
	rm -rf "$(OUTDIR)"
	rm -f "$(SITE_DIR)/$(TARGET)-es.pdf" "$(SITE_DIR)/$(TARGET)-en.pdf"
