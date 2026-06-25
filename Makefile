# Build the CV with XeLaTeX through build.ps1.

TARGET = cv
OUTDIR = build

.PHONY: all clean no-hexacode preview

all:
	powershell -NoProfile -ExecutionPolicy Bypass -File ./build.ps1 -IncludeHexacode 1

no-hexacode:
	powershell -NoProfile -ExecutionPolicy Bypass -File ./build.ps1 -IncludeHexacode 0

clean:
	powershell -NoProfile -Command "if (Test-Path '$(OUTDIR)') { Remove-Item -Recurse -Force '$(OUTDIR)' }"

preview: all
	powershell -NoProfile -Command "Start-Process '$(OUTDIR)/$(TARGET).pdf'"
