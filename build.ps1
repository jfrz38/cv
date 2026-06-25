param(
    [ValidateSet("es", "en")]
    [string]$Language = "es",
    [int]$IncludeHexacode = 1
)

$ErrorActionPreference = "Stop"

$projectRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
$outDir = Join-Path $projectRoot "build"
$texFile = Join-Path $projectRoot "cv.tex"
$buildConfigFile = Join-Path $projectRoot "cv/build-config.tex"

New-Item -ItemType Directory -Force -Path $outDir | Out-Null

if ($IncludeHexacode -eq 1) {
    "\def\cvlang{$Language}`n\includehexacodetrue" | Set-Content -LiteralPath $buildConfigFile -Encoding UTF8
} else {
    "\def\cvlang{$Language}`n\includehexacodefalse" | Set-Content -LiteralPath $buildConfigFile -Encoding UTF8
}

$xelatexCommand = Get-Command xelatex -ErrorAction SilentlyContinue
if (-not $xelatexCommand) {
    throw "XeLaTeX is not available. Install MiKTeX or TeX Live and try again."
}

Push-Location $projectRoot
try {
    $outputArg = "-output-directory=$outDir"
    & $xelatexCommand.Source -interaction=nonstopmode -halt-on-error $outputArg $texFile
    if ($LASTEXITCODE -ne 0) {
        throw "XeLaTeX failed with exit code $LASTEXITCODE."
    }

    & $xelatexCommand.Source -interaction=nonstopmode -halt-on-error $outputArg $texFile
    if ($LASTEXITCODE -ne 0) {
        throw "XeLaTeX failed with exit code $LASTEXITCODE."
    }

    Move-Item -Force -LiteralPath (Join-Path $outDir "cv.pdf") -Destination (Join-Path $outDir "cv-$Language.pdf")
}
finally {
    Pop-Location
}
