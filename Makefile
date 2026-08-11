DECK := quantum-fair-exchange-slides-v9
NOTES := $(DECK)-notes
BUILD_DIR := build
LATEXMK := latexmk
LATEXMK_FLAGS := -pdf -interaction=nonstopmode -halt-on-error -file-line-error -outdir=$(BUILD_DIR)
ASSETS := $(wildcard assets/affiliations/*.png)

.DEFAULT_GOAL := all

.PHONY: all notes watch clean

all: $(BUILD_DIR)/$(DECK).pdf

notes: $(BUILD_DIR)/$(NOTES).pdf

$(BUILD_DIR)/$(DECK).pdf: $(DECK).tex Quantum-Fair-Exchange/references.bib $(ASSETS) | $(BUILD_DIR)
	$(LATEXMK) $(LATEXMK_FLAGS) $(DECK).tex

$(BUILD_DIR)/$(NOTES).pdf: $(NOTES).tex $(DECK).tex Quantum-Fair-Exchange/references.bib $(ASSETS) | $(BUILD_DIR)
	$(LATEXMK) $(LATEXMK_FLAGS) $(NOTES).tex

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

watch: | $(BUILD_DIR)
	$(LATEXMK) $(LATEXMK_FLAGS) -pvc $(DECK).tex

clean:
	$(LATEXMK) -C -outdir=$(BUILD_DIR) $(DECK).tex
	$(LATEXMK) -C -outdir=$(BUILD_DIR) $(NOTES).tex
