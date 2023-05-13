# Variabili
$USER = $env:USERPROFILE
$CONFIG = "$USER\.config"
$POWERSHELL = "$CONFIG\powershell"
$CURRENTPROFILE = "$POWERSHELL\user_profile.ps1"
$VAULTS = "$USER\Documenti\Vaults"

# Profilo
. $CURRENTPROFILE