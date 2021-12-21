# ██╗  ██╗██████╗  ██████╗ ███████╗██╗███████╗██████╗  ██████╗ ██╗    ██╗███████╗██████╗ ███████╗██╗  ██╗███████╗██╗     ██╗
# ██║ ██╔╝██╔══██╗██╔═══██╗██╔════╝██║██╔════╝██╔══██╗██╔═══██╗██║    ██║██╔════╝██╔══██╗██╔════╝██║  ██║██╔════╝██║     ██║
# █████╔╝ ██████╔╝██║   ██║███████╗██║███████╗██████╔╝██║   ██║██║ █╗ ██║█████╗  ██████╔╝███████╗███████║█████╗  ██║     ██║
# ██╔═██╗ ██╔══██╗██║   ██║╚════██║██║╚════██║██╔═══╝ ██║   ██║██║███╗██║██╔══╝  ██╔══██╗╚════██║██╔══██║██╔══╝  ██║     ██║
# ██║  ██╗██║  ██║╚██████╔╝███████║██║███████║██║     ╚██████╔╝╚███╔███╔╝███████╗██║  ██║███████║██║  ██║███████╗███████╗███████╗
# ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝ ╚══════╝╚═╝╚══════╝╚═╝      ╚═════╝  ╚══╝╚══╝ ╚══════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝



Import-Module oh-my-posh
function Get-ScriptDirectory { Split-Path $MyInvocation.ScriptName }
$PROMPT_CONFIG= Join-Path (Get-ScriptDirectory) 'Themes\krosis.omp.json'
oh-my-posh --init --shell pwsh --config $PROMPT_CONFIG | Invoke-Expression

Import-Module Terminal-Icons

Import-Module PSReadLine

Set-PSReadLineOption -BellStyle None
# Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -PredictionSource History

#Presentation commands
Write-Output "Welcome back Krosis!"

#My paths
$nvimconfig_path = "C:\Users\xavie\Appdata\Local\nvim\init.vim"
$dev_path = "D:\Dev"
$visual_proyects_path = "D:\Dev\Proyects\VisualProyects"
$web_proyects_path = "D:\Dev\Proyects\webProyects"
$dotfiles_path = "D:\Dev\Proyects\githubDownloads\dotfiles"
$windowsTerminalConfig_path = "C:\Users\xavie\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"
#My functions
function psprofile { nvim $PROFILE }
function Get-Dotfiles { Set-Location $dotfiles_path }
function Set-TerminalSettings { nvim $windowsTerminalConfig_path }
function Nvimconfig { nvim $nvimconfig_path}
function Windevhome { Set-Location $dev_path}
function windvisual { Set-Location $visual_proyects_path }
function Webpath() { Set-Location $web_proyects_path }
function Windu() { Set-Location 'D:\vainas de la U\' }
function Get-Glog() { git log --oneline --decorate --graph }
function Gstatus() { git status -s }
#My aliases
Set-Alias -Name touch -Value New-Item
Set-Alias -Name cl -Value Clear-Host
Set-Alias -Name vi -Value nvim
Set-Alias -Name ll -Value ls
Set-Alias -Name glog -Value Get-Glog
Set-Alias -Name gs -Value Gstatus
Set-Alias -Name dev -Value Windevhome
Set-Alias -Name uni -Value Windu
Set-Alias -Name viconf -Value Nvimconfig
Set-Alias -Name webdev -Value Webpath
Set-Alias -Name dotfiles -Value Get-Dotfiles
Set-Alias -Name termconf -Value Set-TerminalSettings
