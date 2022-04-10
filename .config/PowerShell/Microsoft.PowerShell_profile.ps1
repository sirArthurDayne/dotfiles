# ██╗  ██╗██████╗  ██████╗ ███████╗██╗███████╗██████╗  ██████╗ ██╗    ██╗███████╗██████╗ ███████╗██╗  ██╗███████╗██╗     ██╗
# ██║ ██╔╝██╔══██╗██╔═══██╗██╔════╝██║██╔════╝██╔══██╗██╔═══██╗██║    ██║██╔════╝██╔══██╗██╔════╝██║  ██║██╔════╝██║     ██║
# █████╔╝ ██████╔╝██║   ██║███████╗██║███████╗██████╔╝██║   ██║██║ █╗ ██║█████╗  ██████╔╝███████╗███████║█████╗  ██║     ██║
# ██╔═██╗ ██╔══██╗██║   ██║╚════██║██║╚════██║██╔═══╝ ██║   ██║██║███╗██║██╔══╝  ██╔══██╗╚════██║██╔══██║██╔══╝  ██║     ██║
# ██║  ██╗██║  ██║╚██████╔╝███████║██║███████║██║     ╚██████╔╝╚███╔███╔╝███████╗██║  ██║███████║██║  ██║███████╗███████╗███████╗
# ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝ ╚══════╝╚═╝╚══════╝╚═╝      ╚═════╝  ╚══╝╚══╝ ╚══════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝

#Import zoxide (For zoxide v0.8.0+)
Invoke-Expression (& {
    $hook = if ($PSVersionTable.PSVersion.Major -lt 6) { 'prompt' } else { 'pwd' }
    (zoxide init --hook $hook powershell | Out-String)
})

#Import-Module oh-my-posh
function Get-ScriptDirectory { Split-Path $MyInvocation.ScriptName }
$PROMPT_CONFIG= Join-Path (Get-ScriptDirectory) 'Themes\krosis.omp.json'
oh-my-posh --init --shell pwsh --config $PROMPT_CONFIG | Invoke-Expression

Import-Module Terminal-Icons

#Import-Module PSReadLine

#Set-PSReadLineOption -BellStyle None
# Set-PSReadLineOption -PredictionViewStyle ListView
#Set-PSReadLineOption -PredictionSource History

#Presentation commands
Write-Output "Welcome back Krosis!"

#My paths
$nvimconfig_path = "C:\Users\xavie\Appdata\Local\nvim\init.vim"
$dev_path = "D:\Dev"
$visual_proyects_path = "D:\Dev\Proyects\VisualProyects"
$web_proyects_path = "D:\Dev\Proyects\webProyects"
$dotfiles_path = "D:\Dev\Proyects\githubDownloads\dotfiles"
$windowsTerminalConfig_path = "C:\Users\xavie\AppData\Local\Packages\Microsoft.WindowsTerminalPreview_8wekyb3d8bbwe\LocalState\settings.json"
#My functions
function folderUp { Set-Location .. }
function Set-psprofile { nvim $PROFILE }
function Get-Dotfiles { Set-Location $dotfiles_path }
function Set-TerminalSettings { nvim $windowsTerminalConfig_path }
function Set-Nvimconfig { nvim $nvimconfig_path}
function Get-Windevhome { Set-Location $dev_path}
function Get-windvisual { Set-Location $visual_proyects_path }
function Get-Webpath() { Set-Location $web_proyects_path }
function Get-Windu() { Set-Location 'D:\vainas de la U\' }
function Get-Glog() { git log --oneline --decorate --graph }
function Get-Gstatus() { git status -s }
function Get-NvimPath() { Set-Location "C:\Users\xavie\Appdata\Local\nvim"}
Function Set-WallPaper($Image) {
<#

    .SYNOPSIS
    Applies a specified wallpaper to the current user's desktop

    .PARAMETER Image
    Provide the exact path to the image

    .EXAMPLE
    Set-WallPaper -Image "C:\Wallpaper\Default.jpg"

#>

Add-Type -TypeDefinition @"
using System;
using System.Runtime.InteropServices;

public class Params
{
    [DllImport("User32.dll",CharSet=CharSet.Unicode)]
    public static extern int SystemParametersInfo (Int32 uAction,
                                                   Int32 uParam,
                                                   String lpvParam,
                                                   Int32 fuWinIni);
}
"@

    $SPI_SETDESKWALLPAPER = 0x0014
    $UpdateIniFile = 0x01
    $SendChangeEvent = 0x02

    $fWinIni = $UpdateIniFile -bor $SendChangeEvent

    $ret = [Params]::SystemParametersInfo($SPI_SETDESKWALLPAPER, 0, $Image, $fWinIni)

}
#My aliases
Set-Alias -Name touch -Value New-Item
Set-Alias -Name .. -Value folderUp
Set-Alias -Name cl -Value Clear-Host
Set-Alias -Name vi -Value nvim
Set-Alias -Name ll -Value ls
Set-Alias -Name glog -Value Get-Glog
Set-Alias -Name gs -Value Get-Gstatus
Set-Alias -Name dev -Value Get-Windevhome
Set-Alias -Name wdev -Value Get-Webpath
Set-Alias -Name uni -Value Get-Windu
Set-Alias -Name viconf -Value Set-Nvimconfig
Set-Alias -Name dotfiles -Value Get-Dotfiles
Set-Alias -Name termconf -Value Set-TerminalSettings
Set-Alias -Name pconf -Value Set-psprofile
Set-Alias -Name vipath -Value Get-NvimPath
