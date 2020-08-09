#MI Profile Setup for PowerShell
# global variables for customization
$global:forePromptColor = 15   #ansi color sequence https://en.wikipedia.org/wiki/ANSI_escape_code#Colors
$global:leftArrow = [char]0xe0b2
$global:rightArrow = [char]0xe0b0
$global:smallArrow = [char]187
$global:leftFire = [char]0xe0c2
$global:rightFire = [char]0xe0c0
$global:esc = "$([char]27)"
$global:fore = "$esc[38;5"
$global:back = "$esc[48;5"
$global:prompt = ''

#CUSTOM PROMPT
Import-Module posh-git
Import-Module oh-my-posh
Set-Theme Agnoster
Import-Module Get-ChildItemColor
# Change color for executables to Green
ForEach ($Exe in $GetChildItemColorExtensions.ExecutableList) {
    $GetChildItemColorTable.File[".h"] = "Green"
}
#spacing of files(default=2)
$Global:GetChildItemColorVerticalSpace = 1
#Presentation commands
Write-Output "Welcome back Krosis!"

#My paths
$nvimconfig_path = "C:\Users\xavie\Appdata\Local\nvim"
$dev_path = "D:\Dev"
$visual_proyects_path = "D:\Dev\Proyects\VisualProyects"
#My aliases
function psprofile { nvim $PROFILE.CurrentUserAllHosts}
function nvimconfig { nvim "C:\Users\xavie\Appdata\Local\nvim\init.vim"}
function windevhome { cd $dev_path}
function windvisual { cd $visual_proyects_path}
function dot{ cd ..}

