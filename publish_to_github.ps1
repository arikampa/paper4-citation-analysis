# Run from PowerShell after reviewing this private-repository draft.
# Usage: powershell -ExecutionPolicy Bypass -File .\publish_to_github.ps1
$ErrorActionPreference = 'Stop'
$remote = 'https://github.com/arikampa/paper4-citation-analysis.git'
$root = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location -LiteralPath $root

if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
    throw 'Git for Windows is required. Install Git, reopen PowerShell, and try again.'
}
if (Test-Path -LiteralPath '.git') {
    throw 'This directory already has a .git folder. Review the existing repository before attempting another initial push.'
}
if (-not ((Test-Path -LiteralPath 'README.md') -and (Test-Path -LiteralPath '.gitignore'))) {
    throw 'Missing required repository files. Please extract the ZIP fully first.'
}
if (Get-Command python -ErrorAction SilentlyContinue) {
    python .\scripts\check_repository.py
    if ($LASTEXITCODE -ne 0) { throw 'Repository checks failed. No push attempted.' }
} else {
    Write-Warning 'Python was not found; automated local repository checks were not run.'
}
$name = git config user.name
$email = git config user.email
if ((-not $name) -or (-not $email)) {
    throw 'Set your Git identity first: git config --global user.name "Your Name" and git config --global user.email "your-email@example.com"'
}
Write-Host "Destination: $remote" -ForegroundColor Cyan
Write-Host 'The draft will be committed and pushed to the private repository.'
$answer = Read-Host 'Type YES to continue'
if ($answer -cne 'YES') { Write-Host 'Cancelled, no changes were made.'; exit 0 }

git init -b main
if ($LASTEXITCODE -ne 0) { throw 'git init failed' }
git add .
if ($LASTEXITCODE -ne 0) { throw 'git add failed' }
git commit -m 'Initial Paper 4 research code and selected outputs'
if ($LASTEXITCODE -ne 0) { throw 'git commit failed' }
git remote add origin $remote
if ($LASTEXITCODE -ne 0) { throw 'git remote add failed' }
git push -u origin main
if ($LASTEXITCODE -ne 0) { throw 'git push failed. Your local commit is preserved; retry after resolving the reported error.' }
Write-Host "Published to $remote" -ForegroundColor Green
