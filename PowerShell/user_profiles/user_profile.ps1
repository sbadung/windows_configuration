# Posh
Import-Module posh-git

# Icone
Import-Module Terminal-Icons

# Auto Completition
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle List
Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineOption -BellStyle None
Set-PSReadLineKeyHandler -Chord 'Ctrl+d' -Function DeleteChar
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

# Fuzzy Finder
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChordReverseHistory 'Ctrl+r'

# Shell
oh-my-posh get shell

# Alias
Set-Alias alias Set-Alias
Set-Alias s scoop
Set-Alias v nvim
Set-Alias c code
Set-Alias g git
Set-Alias n node
Set-Alias x explorer
Set-Alias l ls
Set-Alias ll ls
Set-Alias touch New-Item
Set-Alias unzip Expand-Archive
Set-Alias grep findstr
Set-Alias less 'C:\Program Files\Git\usr\bin\less.exe'

# Utilities
function cl { cat $args | less }
function which { Get-Command -Name $args -ErrorAction SilentlyContinue | Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue }

# Symbolic Links
function filemklink { cmd /c mklink $args[0] $args[1] }
function dirmklink { cmd /c mklink /d $args[0] $args[1] }

# Themes
$ThemesPath = "$POWERSHELL\themes\"
$Themes = Get-ChildItem $ThemesPath -Name

$ThemeName = 'adamnorwood.omp.json'
# $ThemeName = 'capr4n.omp.json'
# $ThemeName = 'angularic.omp.json'
# $ThemeName = 'atomic.omp.json'
# $ThemeName = 'blueish.omp.json'
# $ThemeName = 'catppuccin_latte.omp.json'
# $ThemeName = 'craver.omp.json'
# $ThemeName = 'hul10.omp.json'
# $ThemeName = 'tiwahu.omp.json'

$ThemePath = -join($ThemesPath,  $ThemeName)

function Theme { $ThemePath = -join($ThemesPath, $args[0]); oh-my-posh init pwsh --config $ThemePath | Invoke-Expression }
Theme $ThemeName

function lamp-start {
    docker start lamp-redis
    docker start lamp-mysql8
    docker start lamp-phpmyadmin
    docker start lamp-php8
}

function lamp-stop {
    docker stop lamp-redis
    docker stop lamp-mysql8
    docker stop lamp-phpmyadmin
    docker stop lamp-php8
}

clear