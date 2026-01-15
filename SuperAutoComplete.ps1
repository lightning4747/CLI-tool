# ==========================================
#  REAL POWERSHELL AUTOCOMPLETE CONFIGURATION
# ==========================================

using namespace System.Management.Automation
using namespace System.Management.Automation.Language

# 1. DEFINE YOUR "DATABASE" OF COMMANDS
# The engine will predict these based on what you type.
 $global:CommandDatabase = @(
    'git checkout main',
    'git checkout develop',
    'git commit -m "update"',
    'git push origin master',
    'git pull origin main',
    'npm install',
    'npm run build',
    'npm run dev',
    'npm run test',
    'docker-compose up -d',
    'docker-compose down',
    'kubectl get pods',
    'kubectl get services'
)

# 2. INJECT COMMANDS INTO HISTORY
# PSReadLine learns from your history. We fake the history by adding our commands.
function Initialize-SmartHistory {
    foreach ($cmd in $global:CommandDatabase) {
        # Add each command to the in-memory history
        [Microsoft.PowerShell.PSConsoleReadLine]::AddToHistory($cmd)
    }
}

# 3. CONFIGURE THE UI (The Visuals)
# We want "Inline" view (the ghost text), not the list view.
Set-PSReadLineOption -PredictionSource History -PredictionViewStyle Inline

# Configure Colors: Make the suggestion look transparent (Dark Gray)
Set-PSReadLineOption -Colors @{
    InlinePrediction = '#888888'  # Hex for Gray
    Command          = '#EEEEEE'  # Standard command text
    Parameter        = '#81A1C1'  # Nice Blue for params
}

# 4. CONFIGURE KEYS (Tab vs Right Arrow)
# By default:
# Right Arrow accepts the Inline (Ghost) prediction.
# Tab performs standard completion (files, parameters).

# OPTIONAL: If you strictly want TAB to accept the ghost text like your Node script:
# Uncomment the line below. (Warning: This disables normal file tab completion)
# Set-PSReadLineKeyHandler -Key Tab -Function AcceptSuggestion

# BETTER ALTERNATIVE: Keep Tab for normal stuff, use Right Arrow for Ghost text.
# But let's bind Ctrl+Space to show the full list (Menu) just in case.
Set-PSReadLineKeyHandler -Key Ctrl+Space -Function MenuComplete

# 5. INITIALIZE
Write-Host "Initializing Smart Autocomplete..." -ForegroundColor Cyan
Initialize-SmartHistory
Write-Host "Ready! Try typing 'git' or 'npm'." -ForegroundColor Green
Write-Host "(Press Right Arrow to accept the gray suggestion)" -ForegroundColor DarkGray