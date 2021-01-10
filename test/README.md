# Tests and Examples

The included files in this directory serve as test input and usage example for users of [`gokhlayeh/latex`](https://hub.docker.com/r/gokhlayeh/latex).

## Contents

- `eps/`
  - [`main.tex`](eps/main.tex) Very simple LaTeX document showcasing the use of PostScript graphics using the `graphicx` package.
  - [`signal.eps`](eps/signal.eps) Demo graphic in PostScript to be rendered in finished document.
- `plantuml/`
  - [`.latexmkrc`](plantuml/.latexmkrc) Configuration for `latexmk` users, which ensures that `lualatex` is invoked with `-shell-escape`. Unlike the other documents this one **must** be compiled with source/build directory being the same (limitation of [plantuml LaTeX package](https://github.com/koppor/plantuml))!
  - [`main.tex`](plantuml/main.tex) Very simple LaTeX document showcasing the use of inline PlantUML code.
- `pythontex/`
  - [`.latexmkrc`](pythontex/.latexmkrc) Configuration for `latexmk` users, which ensures that PythonTeX is ran on any `pytxcode` in the build directory.
  - [`main.tex`](pythontex/main.tex) Very simple document showcasing the use of PythonTeX in a LaTeX document.

**Note: This setup (except `plantuml/...`) expects to run with separate source/build directories. See `latexmk`'s [`-outdir=...`](https://helpmanual.io/man1/latexmk-L/) option.**

The resulting PDF document should contain the expanded Python output.

## Usage

### In Visual Studio Code

When using Visual Studio Code and LaTeX Workshop ensure your `.vscode/settings.json` contains the following:

```jsonc
{
  // requires LaTeX Workshop extension (james-yu.latex-workshop)
  "latex-workshop.docker.enabled": true,
  "latex-workshop.docker.image.latex": "gokhlayeh/latex", // >= v2
  "latex-workshop.latex.outDir": "%DIR%/build" // separate build artifacts from LaTeX source
}
```

Afterwards, simply open the `main.tex` document in vscode and build it using LaTeX Workshop `latexmk 🔃` recipe.

### In Terminal

Compiling the example document _by hand_ using `gokhlayeh/latex` is simple:

```sh
git clone https://github.com/ChiefGokhlayeh/latex.git
cd latex/test
docker pull gokhlayeh/latex
docker run \
  -t \
  --rm \
  -v "$(pwd):/workspace" \
  -w '/workspace/pythontex' \
  gokhlayeh/latex \
  latexmk \
  -outdir=build \
  -pdf \
  main.tex
```
