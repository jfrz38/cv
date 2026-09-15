# CV

CV en LaTeX con la plantilla Awesome-CV para exportar a PDF.

Requiere Bash, Make y XeLaTeX mediante MiKTeX o TeX Live. En Windows se puede
ejecutar desde Git Bash siempre que `xelatex` esté disponible en `PATH`.

## Compilar

```sh
make all
```

`make all` genera `build/cv-es.pdf` y `build/cv-en.pdf`. Ejecuta `make` sin
argumentos para ver los targets disponibles.

Para generar un idioma concreto o limpiar los archivos generados:

```sh
make es
make en
make clean
```

El contenido traducible vive en `cv/es` y `cv/en`; `cv.tex` mantiene el formato
común.

## Web local

Para compilar los dos idiomas, preparar la web y servirla en
`http://localhost:8000`:

```sh
make serve
```

El idioma se puede seleccionar desde la barra superior o mediante `?lang=es` y
`?lang=en`. Los PDF copiados a `site/` son archivos generados y no se versionan.

## Publicación

El workflow `.github/workflows/pages.yml` compila la misma web con `make site` y
la publica en GitHub Pages en cada push a `main`. Antes del primer despliegue hay
que habilitar GitHub Pages con GitHub Actions como fuente del sitio.
