# CV

CV en LaTeX con la plantilla Awesome-CV para exportar a PDF.

Requiere MiKTeX o TeX Live con XeLaTeX.

## Compilar

En Windows:

```bat
setup_and_build.bat
```

O, si tienes `make`:

```sh
make
```

`make` genera `build/cv-es.pdf` y `build/cv-en.pdf`.

Para generar un idioma concreto:

```powershell
.\build.ps1 -Language es
.\build.ps1 -Language en
```

El contenido traducible vive en `cv/es` y `cv/en`; `cv.tex` mantiene el formato común.
