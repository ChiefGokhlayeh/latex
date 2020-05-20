# latex [![Docker Hub Project](https://img.shields.io/docker/automated/gokhlayeh/latex?label=type)](https://hub.docker.com/repository/docker/gokhlayeh/latex) [![Docker Hub Build](https://img.shields.io/docker/cloud/build/gokhlayeh/latex?label=build)](https://hub.docker.com/repository/docker/gokhlayeh/latex/builds)

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

# Using Alpine's own package manager 'apk':
RUN apk add --no-cache \
    py3-numpy

# Or alternatively, fist install 'pip' and use that.
# NOTE: build-base and python3-dev are needed in this example to install and
# compile numpy. Other packages may not require such an elaborate setup.
RUN apk add --no-cache \
    build-base \
    py3-pip \
    python3-dev \
    && \
    python3 -m pip install --no-cache-dir \
    numpy

```

If you're using LaTeX Workshop, don't forget to tag your image and update `"latex-workshop.docker.image.latex": "..."` accordingly.

Note that the base-image currently symlinks `/usr/bin/python` to `python3`, so that PythonTeX may use Python 3.x by default. This could cause issues when installing Python 2.x packages.

## Pull the Image Manually

Check out the [Docker Hub](https://hub.docker.com/r/gokhlayeh/latex) page or pull it directly via:

```sh
docker pull gokhlayeh/latex
```
