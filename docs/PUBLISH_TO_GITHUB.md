# Publish as a new private GitHub repository

The proposed repository is `arikampa/paper4-citation-analysis`. **Create it as PRIVATE**, and do not initialize it with an extra README, license or `.gitignore`, as those files already exist in this package.

## 1. Create the repository

1. Visit https://github.com/new after signing in to the `arikampa` GitHub account.
2. Under Owner, choose `arikampa`.
3. Set Repository name to `paper4-citation-analysis`.
4. Select **Private**.
5. Leave the optional README, .gitignore, and license initialization boxes unchecked.
6. Click **Create repository**.

## 2. Automated upload option (Windows PowerShell)

After extracting the ZIP and reviewing the contents, open PowerShell inside the `paper4_github_public_draft` folder and run:

```powershell
powershell -ExecutionPolicy Bypass -File .\publish_to_github.ps1
```

The script performs the basic repository checks, verifies Git identity, displays the fixed private GitHub destination, requires you to type `YES`, creates the initial commit, and pushes it. A GitHub sign-in prompt may appear. If you prefer to run each command manually, use the steps below.

## 2. Upload the draft with Git (Windows PowerShell)

Ensure Git for Windows is installed and configured. Download the `paper4_github_public_draft.zip` produced for this project, then use a PowerShell window in the directory containing the ZIP:

```powershell
Expand-Archive -LiteralPath '.\paper4_github_public_draft.zip' -DestinationPath '.'
Set-Location '.\paper4_github_public_draft'
python .\scripts\check_repository.py
git init
git add .
git commit -m "Initial research code and selected analyses for Paper 4"
git branch -M main
git remote add origin https://github.com/arikampa/paper4-citation-analysis.git
git push -u origin main
```

If prompted for authentication, use the standard browser/Git Credential Manager sign-in flow. Never paste passwords or tokens into notebook files or commit messages.

**Note:** If the proposed GitHub repository name is changed, update the remote URL in the `git remote add origin` command accordingly. If you already created a repository containing a README or another initial commit, do not force-push; reconcile the histories or create a fresh empty private repo.

## 3. Before making public

Review `docs/RELEASE_CHECKLIST.md`, rotate the original embedded API credentials, select an appropriate license, verify dataset/figure rights and run the critical experiments on a clean environment. This package is a curated draft, **not a validated one-click reproduction**.
