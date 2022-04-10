# Symbolink linking of dotfiles for nvim in powershell 7 enviroments
$nvimItems = Get-ChildItem -Name ./.config/nvim/

# Link Every element inside nvim/ folder
ForEach ($item in $nvimItems) {
    New-Item -ItemType Symbolink -Path "~\AppData\Local\nvim\"+$item -Target ".\.config\nvim\"+$item
}
