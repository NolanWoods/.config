$ErrorActionPreference = "Stop"

function Main() {

    RunAsAdmin
    $cwd = (Split-Path $script:MyInvocation.MyCommand.Path)

    #Setup-Chocolatey
    #Install-Chocolatey-Packages

    Setup-Symlink ".bashrc" "bash\bashrc"
    Setup-Symlink ".gitconfig" "git\gitconfig"
    Setup-Symlink ".vim" "vim" $true
    Setup-Symlink ".vimrc" "vim\vimrc"

    Setup-Shellscript
    
    Write-Host "All done. Press any key to exit..."
    $x = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
    Exit
}

function Setup-Chocolatey() {
    # to-do
}

function Install-Chocolatey-Packages() {
    choco install pscx
}

function Setup-Shellscript() {
    Write-Host
    Write-Host "Executing setup.sh..."

    #TO-DO: Ensure bash is installed first (via choco git or whatever)

    $env:Path = "c:\Program Files (x86)\Git\bin;${env:Path}"
    cmd /c "cd /d $cwd && `"c:\Program Files (x86)\Git\bin\sh.exe`" setup.sh"
}

function Setup-Symlink([string]$symlink, [string]$target, [bool]$makeDirectorySymlink = $false) {
    
    $symPath = "${env:USERPROFILE}\$symlink"
    $targetPath = (Join-Path $cwd $target)

    Write-Host
    Write-Host -ForegroundColor Cyan -NoNewline "${symlink}: "

    if ((Test-Path $symPath) -eq $true) {
        if ((Test-Symlink $symPath) -eq $true) { 
            Write-Host "Already exists, skipping."
            return
        }

        Write-Host -NoNewline "Non-symlink exists. Backing up... "
        Move-Item $symPath ($symPath + ".bak")
    }

    Write-Host "Symlinking... "
    if ($makeDirectorySymlink) {
        cmd /c "MKLINK /d `"$symPath`" `"$targetPath`""
    } else {
        cmd /c "MKLINK `"$symPath`" `"$targetPath`""
    }
}

function Test-Symlink([string]$path) {
    # http://stackoverflow.com/a/818054
    $file = Get-Item $path -Force -ea 0
    return [bool]($file.Attributes -band [IO.FileAttributes]::ReparsePoint)
}

function RunAsAdmin() {    
    # from http://blogs.msdn.com/b/virtual_pc_guy/archive/2010/09/23/a-self-elevating-powershell-script.aspx
    
    # Get the ID and security principal of the current user account
    $myWindowsID=[System.Security.Principal.WindowsIdentity]::GetCurrent()
    $myWindowsPrincipal=new-object System.Security.Principal.WindowsPrincipal($myWindowsID)
 
    # Get the security principal for the Administrator role
    $adminRole=[System.Security.Principal.WindowsBuiltInRole]::Administrator
 
    # Check to see if we are currently running "as Administrator"
    if (!$myWindowsPrincipal.IsInRole($adminRole))
    {
        # We are not running "as Administrator" - so relaunch as administrator
   
        # Create a new process object that starts PowerShell
        $psi = new-object System.Diagnostics.ProcessStartInfo "PowerShell";
   
        # Specify the current script path and name as a parameter
        $psi.Arguments = @("-ExecutionPolicy", "Bypass", $script:MyInvocation.MyCommand.Path);
   
        # Indicate that the process should be elevated
        $psi.Verb = "runas";

        $process = New-Object System.Diagnostics.Process
        $process.StartInfo = $psi
        $process.Start() | Out-Null
       

        # Exit from the current, unelevated, process
        exit
    }
}

Main;