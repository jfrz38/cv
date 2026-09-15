# José Francisco Ruiz Zamora | Backend Software Engineer

[Ver el CV online](https://jfrz38.github.io/cv/)

Currículum bilingüe en LaTeX, generado con la plantilla Awesome-CV y publicado
como una web estática con PDFs en español e inglés.

## Estructura

- `cv/es` y `cv/en`: contenido específico de cada idioma.
- `cv.tex`: formato y composición compartidos.
- `site`: web estática y visor de los PDFs generados.
- `.github/workflows/pages.yml`: compilación y publicación en GitHub Pages.

## Requisitos

- Bash, Make y XeLaTeX mediante MiKTeX o TeX Live.
- En Windows, se puede usar Git Bash si `xelatex` está disponible en `PATH`.

## Uso

Ejecuta `make` para consultar los comandos disponibles.

| Comando | Descripción |
| --- | --- |
| `make all` | Genera los CV en español e inglés en `build/`. |
| `make es` | Genera solo el CV en español. |
| `make en` | Genera solo el CV en inglés. |
| `make no-hexacode` | Genera el CV en español sin la experiencia de Hexacode. |
| `make site` | Genera ambos PDFs y prepara la web estática. |
| `make serve` | Prepara la web y la sirve en `http://localhost:8000`. |
| `make clean` | Elimina los archivos generados. |

Los PDFs de `build/` y los copiados a `site/` son generados y no se versionan.
El idioma del visor se puede seleccionar desde la barra superior o con
`?lang=es` y `?lang=en`.

## Publicación

Cada push a `main` ejecuta el workflow de GitHub Actions: compila el CV con
`make site` y publica el directorio `site/` en GitHub Pages. Antes del primer
despliegue hay que habilitar GitHub Pages con GitHub Actions como fuente.
