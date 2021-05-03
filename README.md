# latex

[![gokhlayeh/latex](https://img.shields.io/badge/Docker%20Hub-gokhlayeh%2Flatex-blue)](https://hub.docker.com/r/gokhlayeh/latex)

[![Code Quality](https://github.com/ChiefGokhlayeh/latex/actions/workflows/quality-check.yml/badge.svg)](https://github.com/ChiefGokhlayeh/latex/actions/workflows/quality-check.yml)
[![Build and Test](https://github.com/ChiefGokhlayeh/latex/actions/workflows/build-and-test.yml/badge.svg)](https://github.com/ChiefGokhlayeh/latex/actions/workflows/build-and-test.yml)
[![Push Image](https://github.com/ChiefGokhlayeh/latex/actions/workflows/push-image.yml/badge.svg)](https://github.com/ChiefGokhlayeh/latex/actions/workflows/push-image.yml)

A Docker-based LaTeX distribution with support for BibLaTeX and PythonTeX.

## Usage

This image is designed to be used with the [LaTeX Workshop](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop) extension for Visual Studio Code. To use it, change the `"latex-workshop.docker.image.latex"` setting to `"gokhlayeh/latex"`. You can do so via the `vscode` _Settings_ menu or simply by copy&pasting the following lines to your `.vscode/settings.json`:

```jsonc
{
  /* more settings go here */
  "latex-workshop.docker.enabled": true,
  "latex-workshop.docker.image.latex": "gokhlayeh/latex"
}
```

### PythonTeX

The Docker image ships with a basic install of Python 3.x to support [PythonTeX](https://www.ctan.org/pkg/pythontex). If you want to use additional Python libraries you will need to either add them to the image manually, or create your own image based on this one. Your `Dockerfile` may look like this:

```Dockerfile
FROM gokhlayeh/latex:latest

RUN dnf install -y --setopt=install_weak_deps=False \
    python3-numpy
```

For examples on how to use the included PythonTeX in your LaTeX document and other features of this image, refer to the contents of [`test/`](test) directory.

If you're using LaTeX Workshop, don't forget to tag your image and update `"latex-workshop.docker.image.latex": "..."` accordingly.

## Pull the Image Manually

Check out the [Docker Hub](https://hub.docker.com/r/gokhlayeh/latex) page or pull it directly via:

```sh
docker pull gokhlayeh/latex
```
