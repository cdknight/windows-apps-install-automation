$User     = ""
$Password = ""

# NOTE install node and the Arduino drivers after installing everything else
$InstallerItems = @{
	"VSCodeSetup-x64-1.63.0.exe"    = "/verysilent /mergetasks=!runcode";
	"UnityHubSetup.exe"             = "/S"; 
	"arduino-1.8.16-windows.exe"    = "/S";
	#"arduino-drivers.bat"           = "";
	"blender-3.0.0-windows-x64.msi" = "";
	#"node-v16.13.1-x64.msi"          = "NATIVETOOLSCHECKBOX=1"; # o we really want to enable native tools? This installs chocolatey.
	"python-3.10.1-amd64.exe"       = "/passive InstallAllUsers=1 PrependPath=1";
};

$LaunchCommands = New-Object System.Collections.Generic.List[string]

foreach ($Item in $InstallerItems.GetEnumerator()) {
	Write-Host Copy $Item.Name to C:\

	$ItemName = $Item.Name
	$ItemValue = $Item.Value

	Copy-Item $ItemName -Destination C:\$ItemName

	if ([System.IO.Path]::GetExtension($Item.Name) -eq ".msi") {
		$LaunchCommands.add("msiexec /i C:\$ItemName ALLUSERS=1 /passive $ItemValue")
        }
	else {
		$LaunchCommands.add("C:\$ItemName $ItemValue")
	}
	
}

$ArgList = '{' + '"{0}"' -f ($LaunchCommands -join '";"') + '}'
$ExecCmd = 'powershell -Command "Start-Process powershell -Verb RunAs -ArgumentList ' + $ArgList + '"'

Start-Process PsExec64 -ArgumentList '/accepteula', '-u', $User, '-p', $Password, $ExecCmd -RedirectStandardError err -RedirectStandardOutput out
