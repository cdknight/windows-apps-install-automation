# Windows App Installer

## How to use
* Download PsTools's `PsExec64.exe` and put it in the same directory as this script
* Download all your installers and put them int he same directory as this script
* Modify `install.ps1` to silent-install your installers (there are a few pre-added scripts and since some installs depend on others [eg. Node on Python and the Arduino drivers on Arduino], you may have to comment out each one and do installs in batches, which is suboptimal but I'm lazy)
* Populate `install.ps1` with the appropriate credientials.
* Run `.\install.ps1`
