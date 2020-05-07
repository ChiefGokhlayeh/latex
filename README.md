# latex

A Docker-based LaTeX distribution with support for BibLaTeX.

## Usage

This image is designed to be used with the [LaTeX Workshop](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop) extension for Visual Studio Code. To use it, change the `"latex-workshop.docker.image.latex"` setting to `"gokhlayeh/latex"`. You can do so via the `vscode` _Settings_ menu or simply by copy&pasting the following lines to your `.vscode/settings.json`:

```json
{
    /* more settings go here */
    "latex-workshop.docker.enabled": true,
    "latex-workshop.docker.image.latex": "gokhlayeh/latex"
}
```

## Pull the Image Manually

Check out the [Docker Hub](https://hub.docker.com/r/gokhlayeh/latex) page or pull it directly via:

```sh
docker pull gokhlayeh/latex
```
