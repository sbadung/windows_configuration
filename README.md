# Configurazione Windows 10

# Installazione software
```ps1
# Desktop Applications
winget install -e --id Microsoft.WindowsTerminal;
winget install -e --id Microsoft.PowerShell.Preview;
winget install -e --id Microsoft.VisualStudioCode;
winget install -e --id Docker.DockerDesktop;
winget install -e --id JesseDuffield.Lazydocker;
winget install -e --id Obsidian.Obsidian;
winget install -e --id Google.Chrome;
winget install -e --id Brave.Brave;
winget install -e --id Discord.Discord;
winget install -e --id Microsoft.PowerToys;
winget install -e --id ShareX.ShareX;
winget install -e --id OBSProject.OBSStudio;

# Dependencies
winget install -e --id Microsoft.DotNet.SDK.7;
winget install -e --id Git.Git;

# Scoop Package Manager
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
irm get.scoop.sh | iex

# Packages
scoop bucket add main
scoop bucker add extras

# Powershell CLI Application
scoop install main/oh-my-posh
scoop install main/zoxide
scoop install main/bat
scoop install main/fzf
scoop install extras/psfzf
scoop install main/curl
scoop install main/wget
scoop install main/jq
scoop install main/curlie
scoop install main/neovim
scoop install extras/lazygit
scoop install main/lazydocker
scoop install main/tar
scoop install main/gpg

# Fonts
scoop install Iosevka-NF JetBrainsMono-NF FantasqueSansMono-NF Hack-NF Cascadia-Code
```

# Configurazione Powershell
```ps1
# Variabili
$USER = $env:USERPROFILE
$CONFIG = "$USER\.config"
$POWERSHELL = "$CONFIG\powershell"
$CURRENTPROFILE = "$POWERSHELL\user_profile.ps1"
$VAULTS = "$USER\Vaults"

. $CURRENTPROFILE
```

# Profilo Powershell
```ps1
# Moduli
Import-Module posh-git
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
function which { Get-Command -Name $args -ErrorAction SilentlyContinue | Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue }

# Symbolic Links
function filemklink { cmd /c mklink $args[0] $args[1] }
function dirmklink { cmd /c mklink /d $args[0] $args[1] }

# Themes
$ThemesPath = "$POWERSHELL\themes\"
$Themes = Get-ChildItem $ThemesPath -Name
$ThemeName = 'adamnorwood.omp.json'
$ThemePath = -join($ThemesPath,  $ThemeName)
function Theme { $ThemePath = -join($ThemesPath, $args[0]); oh-my-posh init pwsh --config $ThemePath | Invoke-Expression }
Theme $ThemeName

clear
```

# Installazione WSL
```ps1
wsl --install
winget install -e --id Canonical.Ubuntu.2204
```

## Installazione software Ubuntu LTS 2204
```sh
sudo apt-get update
sudo apt-get upgrade

sudo apt-get install -y git
sudo apt-get install -y tmux
sudo apt-get install -y neovim
sudo apt-get install -y fzf
sudo apt-get install -y bat
sudo apt-get install -y just
sudo apt-get install -y entr
sudo apt-get install -y jq
sudo apt-get install -y gnupg
sudo apt-get install -y tig
sudo apt-get install -y httpie
sudo apt-get install -y ranger
sudo apt-get install -y tree
sudo apt-get install -y tldr
sudo apt-get install -y ripgrep
sudo apt-get install -y libimage-exiftool-perl
sudo apt-get install -y fd-find
```

## Installazione Shell
```sh
sudo apt-get install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

## Configurazioen Shell
```sh
export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

HYPHEN_INSENSITIVE="true"

zstyle ':omz:update' mode disabled

DISABLE_LS_COLORS="true"
ENABLE_CORRECTION="true"

plugins=(git z fzf tmux vi-mode vim-interaction zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

alias zshrc="v ~/.zshrc"
alias sl='ls'
alias l='ls -l'
alias la='ls -la'
alias c='code'
alias cc="code ."
alias v='nvim'
alias g='git'
alias b='batcat --number'
alias cat='batcat'
alias p='sudo apt'
alias clip='xclip -selection clipboard'
alias paste='xclip -o'
```

# Browser extensions:
Dark Reader: https://chrome.google.com/webstore/detail/dark-reader/eimadpbcbfnmbkopoojfekhnkhdbieeh

I don't care about cookies: https://chrome.google.com/webstore/detail/i-dont-care-about-cookies/fihnjjcciajhdojfnbdddfaoknhalnja

Vimium: https://chrome.google.com/webstore/detail/vimium/dbepggeogbaibhgnhhndojpepiihcmeb

Material Icons for GitHub: https://chrome.google.com/webstore/detail/material-icons-for-github/bggfcpfjbdkhfhfmkjpbhnkhnpjjeomc

Enhanced GitHub: https://chrome.google.com/webstore/detail/enhanced-github/anlikcnbgdeidpacdbdljnabclhahhmd

GitZip for github: https://chrome.google.com/webstore/detail/gitzip-for-github/ffabmkklhbepgcgfonabamgnfafbdlkn

JSON Formatter: https://chrome.google.com/webstore/detail/json-formatter/bcjindcccaagfpapjjmafapmmgkkhgoa

XML Tree: https://chrome.google.com/webstore/detail/xml-tree/gbammbheopgpmaagmckhpjbfgdfkpadb
