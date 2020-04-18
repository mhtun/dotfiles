param(
    # Full path and name to visual studio installer
    [Parameter(Mandatory=$true)]
    [String]$VSCodeInstaller
)

$ErrorActionPreference = 'Stop'

# Shamelessly stolen from powershellgallery.com
Function Install-Font {
    <#
        .Synopsis
        Installs one or more fonts.
        .Parameter FontPath
        The path to the font to be installed or a directory containing fonts to install.
        .Parameter Recurse
        Searches for fonts to install recursively when a path to a directory is provided.
        .Notes
        There's no checking if a given font is already installed. This is problematic as an existing
        installation will trigger a GUI dialogue requesting confirmation to overwrite the installed
        font, breaking unattended and CLI-only scenarios.
    #>
    Param(
        [Parameter(Mandatory=$true)]
        [String]$FontPath,

        [Switch]$Recurse
    )

    $ErrorActionPreference = 'Stop'
    $ShellAppFontNamespace = 0x14

    if (Test-Path -Path $FontPath) {
        $FontItem = Get-Item -Path $FontPath
        if ($FontItem -is [IO.DirectoryInfo]) {
            if ($Recurse) {
                $Fonts = Get-ChildItem -Path $FontItem -Include ('*.fon','*.otf','*.ttc','*.ttf') -Recurse
            } else {
                $Fonts = Get-ChildItem -Path "$FontItem\*" -Include ('*.fon','*.otf','*.ttc','*.ttf')
            }

            if (!$Fonts) {
                throw ('Unable to locate any fonts in provided directory: {0}' -f $FontItem.FullName)
            }
        } elseif ($FontItem -is [IO.FileInfo]) {
            if ($FontItem.Extension -notin ('.fon','.otf','.ttc','.ttf')) {
                throw ('Provided file does not appear to be a valid font: {0}' -f $FontItem.FullName)
            }

            $Fonts = $FontItem
        } else {
            throw ('Expected directory or file but received: {0}' -f $FontItem.GetType().Name)
        }
    } else {
        throw ('Provided font path does not appear to be valid: {0}' -f $FontPath)
    }

    $ShellApp = New-Object -ComObject Shell.Application
    $FontsFolder = $ShellApp.NameSpace($ShellAppFontNamespace)
    foreach ($Font in $Fonts) {
        Write-Verbose -Message ('Installing font: {0}' -f $Font.BaseName)
        $FontsFolder.CopyHere($Font.FullName)
    }
}

Function Install-Powerline {
    # install git posh and oh-my-posh for powerline
    Write-Host "Installing posh-git"
    #Install-Module posh-git -Scope CurrentUser

    Write-Host "Installing oh-my-posh"
    #Install-Module oh-my-posh -Scope CurrentUser

    # install required fonts for programming / powerline
    Write-Host "Installing powerline_fonts"
    Install-Font powerline_fonts
}

Function Install-PowershellProfile {
    Write-Host "Installing Powershell Profile"
    $destination_path = $HOME + '\Documents\WindowsPowerShell\'

    # copy profile file to my user
    Copy-Item -Path "powershell\Microsoft.PowerShell_profile.ps1" -Destination $destination_path -Force
}

Function Install-WindowsTerminalProfile{
    Write-Host "Installing Windows Terminal (Preview) profile"
    $app_data = [Environment]::GetFolderPath([Environment+SpecialFolder]::LocalApplicationData)
    $destination_path = "$app_data\packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\"
    # copy windows terminal profile
    Copy-Item "windows_terminal\profiles.json" -Destination $destination_path  -Force
}

Function Install-VSCode{
    param(
        [String] $VSCodeInstaller
    )

    Invoke-Installer $VSCodeInstaller

    Write-Host "Applying Visual Studio Code settings"
    $app_data = [Environment]::GetFolderPath([Environment+SpecialFolder]::ApplicationData)
    # copy windows terminal profile
    Copy-Item -Path "vscode\settings.json" -Destination "$app_data\Code\User\settings.json" -Force
}

Function Invoke-Installer {
    param(
        [String] $VSCodeInstaller
    )
    Write-Host $VSCodeInstaller
    if (Test-Path $VSCodeInstaller) {
        Write-Host "Installing Visual Studio Code"
        $installProcess = Start-Process -FilePath $VSCodeInstaller -ArgumentList "/VERYSILENT","/MERGETASKS=!runcode" -PassThru

        # TODO: Figure out how to get actual progress
        for ($i = 0; $i -le 100; $i = ($i + 1) % 100){
            Write-Progress -Activity "VSCode Installer" -PercentComplete $i -Status "Installing"
            Start-Sleep -Milliseconds 200
            if ($installProcess.HasExited) {
                Write-Progress -Activity "VSCode Installer" -Completed
                break
            }
        }
    }
    else {
        Write-Host "Visual Studio Code installer not found. Skipping Install."
    }

}

# Setup Editors and shells
Install-Powerline
Install-PowershellProfile
Install-WindowsTerminalProfile
Install-VSCode $VSCodeInstaller

# Enable Windows features
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux -NoRestart

# Restart computer
Restart-Computer