# PowerShell Smart Autocomplete

A simple PowerShell script that gives you inline command suggestions while you type. It works with your session history and a set of predefined commands for Git, NPM, Docker, and Kubernetes. Makes typing repetitive commands faster and cleaner.

## Features

* Inline “ghost text” suggestions as you type.
* Press **Right Arrow** to accept a suggestion.
* Comes with a preloaded set of common dev commands.

## Getting Started

### 1. Clone or Download

Grab the script from this repo:

```powershell
https://github.com/lightning4747/CLI-tool.git
```

Or just download the `autocomplete.ps1` file.

### 2. Check Your PSReadLine Version

Open PowerShell and run:

```powershell
Get-Module -ListAvailable PSReadLine | Select Name, Version
```

You want **version 2.4 or higher**.

### 3. Update PSReadLine (if needed)

If your version is older, update it with:

```powershell
Install-Module PSReadLine -Scope CurrentUser -Force -SkipPublisherCheck
```

### 4. Load the Script

To have it ready every time you open PowerShell, add it to your profile:

```powershell
notepad $PROFILE
```

Then add:

```powershell
Import-Module "C:\path\to\autocomplete.ps1"
```

Or just run it manually for the current session:

```powershell
Import-Module "C:\path\to\autocomplete.ps1"
```

### 5. Verify

If everything is working, you’ll see:

```
Initializing Smart Autocomplete...
Ready! Try typing 'git' or 'npm'.
(Press Right Arrow to accept the gray suggestion)
```

## How to Use

* Start typing commands like `git checkout` or `npm run`.
* Suggestions will appear in gray inline.
* Press **Right Arrow** to accept a suggestion 

## Customizing

* Add or remove commands by editing `$global:CommandDatabase`.
* Change colors using `Set-PSReadLineOption -Colors`.
* You can also make Tab accept inline suggestions instead of file completions, if you prefer.

