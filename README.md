# José Francisco Ruiz Zamora | Backend Software Engineer

[View the CV online](https://jfrz38.github.io/cv/)

Bilingual CV written in LaTeX, generated with the Awesome-CV template and
published as a static website with PDFs in Spanish and English.

## Structure

- `cv/es` and `cv/en`: language-specific content.
- `cv.tex`: shared formatting and layout.
- `site`: static website and viewer for the generated PDFs.
- `.github/workflows/pages.yml`: build and deployment to GitHub Pages.

## Requirements

- Bash, Make, and XeLaTeX through MiKTeX or TeX Live.
- On Windows, you can use Git Bash if `xelatex` is available in `PATH`.

## Usage

Run `make` to view the available commands.

| Command | Description |
| --- | --- |
| `make all` | Builds the Spanish and English CVs in `build/`. |
| `make es` | Builds only the Spanish CV. |
| `make en` | Builds only the English CV. |
| `make no-hexacode` | Builds the Spanish CV without the Hexacode experience. |
| `make site` | Builds both PDFs and prepares the static website. |
| `make serve` | Prepares the website and serves it at `http://localhost:8000`. |
| `make clean` | Removes generated files. |

The PDFs in `build/` and those copied to `site/` are generated files and are not
tracked in version control. You can select the viewer language from the top bar
or with `?lang=es` and `?lang=en`.

## Deployment

Each push to `main` runs the GitHub Actions workflow, builds the CV with
`make site`, and deploys the `site/` directory to GitHub Pages. Before the first
deployment, GitHub Pages must be enabled with GitHub Actions as the source.
