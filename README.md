# quantum-fair-exchange-talk

Slides for the Quantum Fair Exchange theory-group presentation.

## Build

The default target builds the presentation with `latexmk` and pdfLaTeX:

```sh
make
```

Generated files are written to `build/`. Other useful targets are:

```sh
make notes  # slides with speaker notes on the right
make watch  # rebuild the presentation when a source file changes
make clean
```
