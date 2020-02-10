# -------------- VARIABLES ----------------------
$path_install_local = "C:\programdata\DesktopInfo"
$path_source_remote = "\\dc3-installs-01\installscripts$\DesktopInfo\workstation version\"
$path_startup_folder = "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp"
# -----------------------------------------------
if (-NOT (Test-Path $path_install_local)){
    #---Create the install directory under ProgramData
    New-Item -ItemType Directory $path_install_local

    #---Copy the exe & config files from the server to the computer
    Copy-Item -Path ($path_source_remote + "\*") -Destination $path_install_local -Recurse -Force

    #---Copy the shortcut from the install location to the startup directory
    Copy-Item -Path ($path_install_local + "\*.lnk") -Destination $path_startup_folder -Recurse
}
# -----------------------------------------------
# Created 17-04-2019 | Peter Milne | created just to run from the desktop.
# Updated 09-05-2019 | Noel Fairclough | for SCCM.
# Updated 09-02-2020 | Peter Milne | Converted from a Batch File to a PowerShell script.
