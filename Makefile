# Build the CV with XeLaTeX through build.ps1.

TARGET = cv
OUTDIR = build

.PHONY: all es en clean no-hexacode preview

all: es en

es:
	powershell -NoProfile -ExecutionPolicy Bypass -File ./build.ps1 -Language es -IncludeHexacode 1

en:
	powershell -NoProfile -ExecutionPolicy Bypass -File ./build.ps1 -Language en -IncludeHexacode 1

no-hexacode:
	powershell -NoProfile -ExecutionPolicy Bypass -File ./build.ps1 -Language es -IncludeHexacode 0

clean:
	powershell -NoProfile -Command "if (Test-Path '$(OUTDIR)') { Remove-Item -Recurse -Force '$(OUTDIR)' }"

preview: es
	powershell -NoProfile -Command "Start-Process '$(OUTDIR)/$(TARGET)-es.pdf'"
