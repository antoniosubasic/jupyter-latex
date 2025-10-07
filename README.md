# Jupyter LaTeX PDF Converter

A simple Docker container for converting Jupyter notebooks to PDF using LaTeX, with all the complexity pre-configured.

Simply run the Docker container with your notebook file:

```bash
docker run --rm -v $(pwd):/workspace ghcr.io/antoniosubasic/jupyter-latex my_notebook.ipynb
```
