function get-trans($transid){
C:\Users\b41395\Downloads\WindowsTrans\trans.exe -g $transid
}

#function birthday{
#[datetime]'06/03/2017' - (Get-Date)
#}


$host.PrivateData.Errorforegroundcolor = 'green'


function open-com {
    #C:\Users\b41395\Downloads\putty.exe -load "COM9" -new_console:s40H
    C:\Users\b41395\Downloads\putty.exe  -new_console:s40H
}

function 18th {
    C:\Users\b41395\Downloads\putty.exe -load "18th" -new_console
}
function com {
    [System.IO.Ports.SerialPort]::GetPortNames()
}

function Hex($decimal, $base=16) {
    [convert]::ToString($decimal, $base)
}

Add-Type -AssemblyName System.Windows.Forms

Set-Alias -Name zip -Value Compress-Archive
Set-Alias -Name unzip -Value Expand-Archive
Set-Alias -Name g -Value git
#Set-Alias -Name ls -Value PowerLS -Option AllScope
#Export-ModuleMember -Function *-* -Alias *

$env:Path += ";C:\Program Files\MongoDB\Server\3.4\bin"
$env:Path += ";C:\Users\b41395\myexe\ctags58"
$env:Path += ";C:\Users\b41395\myexe"
$env:Path += ";C:\Program Files\R\R-3.2.3\bin\x64"
$env:Path += "C:\Users\b41395\Downloads\WindowsTrans"
$env:Path += ";C:\Program Files (x86)\SEGGER\JLink_V502d"
$env:Path += ";C:\Users\b41395\myexe\phantomjs-2.1.1-windows\bin"
$env:Path += ";C:\Program Files (x86)\IAR Systems\Embedded Workbench 8.0\common\bin"
$env:Path += ";C:\Program Files\ImageMagick-7.0.6-Q16"
$env:Path += ";C:\Program Files\PuTTY"
#Enable-HistoryPersistence
New-autovariable GLOBAL:WindowTitle -Getter { $host.UI.RawUI.WindowTitle} -Setter {$host.ui.RawUI.WindowTitle = $args[0]}
# Load posh-git example profile
. 'C:\Users\b41395\Documents\WindowsPowerShell\Modules\posh-git\profile.example.ps1'


#Load Jump-Location profile
# Import-Module 'C:\Users\b41395\Documents\WindowsPowerShell\Modules\Jump.Location\Jump.Location.psd1'
Import-Module PowerTab
Import-Module PSReadLine

Set-PSReadlineOption -EditMode vi
#
# Ctrl+Shift+j then type a key to mark the current directory.
# Ctrj+j then the same key will change back to that directory without
# needing to type cd and won't change the command line.

#

push-location .
cd C:\nxp\SDK_2.0.0_K32H844P_ER3\boards\evk_k32h844p\usb_examples
$usb = $pwd
Pop-location

$clk = "C:\Users\b41395\learning\ps\code\misc\clockWidget.ps1"

$global:PSReadlineMarks = @{}


Set-PSReadlineKeyHandler -Key Ctrl+Shift+j `
                         -BriefDescription MarkDirectory `
                         -LongDescription "Mark the current directory" `
                         -ScriptBlock {
    param($key, $arg)

    $key = [Console]::ReadKey($true)
    $global:PSReadlineMarks[$key.KeyChar] = $pwd
}

Set-PSReadlineKeyHandler -Key Ctrl+j `
                         -BriefDescription JumpDirectory `
                         -LongDescription "Goto the marked directory" `
                         -ScriptBlock {
    param($key, $arg)

    $key = [Console]::ReadKey()
    $dir = $global:PSReadlineMarks[$key.KeyChar]
    if ($dir)
    {
        cd $dir
        [Microsoft.PowerShell.PSConsoleReadLine]::InvokePrompt()
    }
}

Set-PSReadlineKeyHandler -Key Alt+j `
                         -BriefDescription ShowDirectoryMarks `
                         -LongDescription "Show the currently marked directories" `
                         -ScriptBlock {
    param($key, $arg)

    $global:PSReadlineMarks.GetEnumerator() | % {
        [PSCustomObject]@{Key = $_.Key; Dir = $_.Value} } |
        Format-Table -AutoSize | Out-Host

    [Microsoft.PowerShell.PSConsoleReadLine]::InvokePrompt()
}

Set-PSReadlineKeyHandler -Chord 'Oem7','Shift+Oem7' `
                         -BriefDescription SmartInsertQuote `
                         -LongDescription "Insert paired quotes if not already on a quote" `
                         -ScriptBlock {
    param($key, $arg)

    $line = $null
    $cursor = $null
    [Microsoft.PowerShell.PSConsoleReadline]::GetBufferState([ref]$line, [ref]$cursor)

    if ($line[$cursor] -eq $key.KeyChar) {
        # Just move the cursor
        [Microsoft.PowerShell.PSConsoleReadline]::SetCursorPosition($cursor + 1)
    }
    else {
        # Insert matching quotes, move cursor to be in between the quotes
        [Microsoft.PowerShell.PSConsoleReadline]::Insert("$($key.KeyChar)" * 2)
        [Microsoft.PowerShell.PSConsoleReadline]::GetBufferState([ref]$line, [ref]$cursor)
        [Microsoft.PowerShell.PSConsoleReadline]::SetCursorPosition($cursor - 1)
    }
}

Set-PSReadlineKeyHandler -Key Ctrl+H `
			    -BriefDescription GoToParentDirectory `
			    -Description "Go To Parent Directory" -ScriptBlock {

    param($key, $arg)
    $parentDir = (Get-Item $pwd).Parent
    cd $parentDir.FullName
    [Microsoft.PowerShell.PSConsoleReadline]::InvokePrompt()
}

Set-PSReadlineKeyHandler -Key "Alt+l" `
                         -BriefDescription ListDirectory `
                         -LongDescription "List the current directory" `
                         -ScriptBlock {
    [Microsoft.PowerShell.PSConsoleReadline]::RevertLine()
    [Microsoft.PowerShell.PSConsoleReadline]::Insert("ls")
    [Microsoft.PowerShell.PSConsoleReadline]::AcceptLine()
}

Set-PSReadLineOption -HistorySearchCursorMovesToEnd 
Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward
Set-PSReadlineKeyHandler -Key PageUp -Function ScrollDisplayUp
Set-PSReadlineKeyHandler -Key PageDown -Function ScrollDisplayDown
Set-PSReadlineKeyHandler -Key Ctrl+[ -Function ViCommandMode

function slexe{
gci -Path C:\Users\b41395\proj\ssl\try_env\build\B41395\imx6sll *exe -Recurse | sort lastwritetime -Descending | select -First 1 | ii 
}

set-alias gh get-help

function Connect-Wifi{
netsh wlan connect name=Freescale
}
set-alias wifi Connect-Wifi

function jl{
    JLink.exe -new_console:s
}
import-Module PSFzf -ArgumentList 'Ctrl+T','Ctrl+R'
function Set-LocationTo {            
    param(  [parameter(Mandatory = $true)]            
         [ValidateNotNullOrEmpty()]            
            [string] $targetDir)            
            
    $dirs = (pwd).Path.Split('\')            
    for($i = $dirs.Length - 1; $i -ge 0; $i--) {            
        if ($dirs[$i].ToLower().StartsWith($targetDir.ToLower())) {            
            $targetIndex = $i            
            break            
        }            
    }            
    if($targetIndex -eq 0) {             
        Write-Host "Unable to resolve $targetDir"             
        return            
    }            
            
    $targetPath = ''            
    for($i = 0; $i -le $targetIndex; $i++) {            
       $targetPath += $dirs[$i] + '\'             
    }            
            
    Set-Location $targetPath            
}            
            
Set-Alias -Name jj -Value Set-LocationTo
Set-Alias -Name v -Value vim
Set-Alias -Name n -Value node
$GitPromptSettings.RepositoriesInWhichToDisableFileStatus += 'C:\Users\b41395\code\code_ultra'
$GitPromptSettings.RepositoriesInWhichToDisableFileStatus += 'C:\Users\b41395\learning\js\node\express\practicalnode'
$GitPromptSettings.RepositoriesInWhichToDisableFileStatus += 'C:\Users\b41395\learning\uboot\u-boot'
$GitPromptSettings.RepositoriesInWhichToDisableFileStatus += 'C:\Users\b41395\learning\uboot\imx6ull'
Function vf ()
{
    $filepaths = $input | Get-Item | % { $_.fullname }
    vim $filepaths
}

function Get-ResetHandler()
{
#search for a .map file, get the content, and print the reset_handler
gci *map -re | cat | sls "Reset_Handler"
}
set-alias gr Get-ResetHandler
import-module oh-my-posh
set-theme avit

function dm()
{
    #open device manager
    mmc devmgmt.msc
}

function desk()
{
    #desktop configuration
    control desk.cpl
}

function app()
{
    #open programming remove panel
    control appwiz.cpl
}

$Host.UI.RawUI.CursorSize =100

    # example of how to run the R script.
    # & $rscript .\wideTolong.R
$rscript = 'C:\Program Files\R\R-3.3.1\bin\Rscript.exe'

Set-PSReadlineKeyHandler -key Ctrl+p -briefDescription "copy pwd to system clipboard" -ScriptBlock {
(pwd).providerpath | clip
}

Set-PSReadlineKeyHandler -key Ctrl+o -briefDescription "open putty" -ScriptBlock {
putty.exe  -new_console:s40H
}

Set-PSReadlineKeyHandler -key Ctrl+b -briefDescription "git bash vertical slipt conemu" -ScriptBlock {
 & 'C:\Program Files\Git\bin\sh.exe' -new_console:s10V
}

Set-PSReadlineKeyHandler -key Ctrl+Shift+b -briefDescription "git bash Horizontal slipt conemu" -ScriptBlock {
 & 'C:\Program Files\Git\bin\sh.exe' -new_console:sH
}

Set-PSReadlineKeyHandler -key Ctrl+s -briefDescription "vertical slipt conemu" -ScriptBlock {
    powershell -new_console:sV
}

Set-PSReadlineKeyHandler -key Ctrl+Shift+s -briefDescription "Horizontal slipt conemu" -ScriptBlock {
    powershell -new_console:sH
}
# ssh eighteen-street -p 22 -l b09129

Set-PSReadlineKeyHandler -key Ctrl+g -briefDescription "generate ctags file in current directory" -ScriptBlock {
    ctags -R .
    write-host "tags generated"
}

Set-PSReadlineKeyHandler -key Ctrl+k -briefDescription "fzf kill process" -ScriptBlock {
    fkill
}

Set-PSReadlineKeyHandler -key Ctrl+i -briefDescription "file explorer pwd" -ScriptBlock {
    ii .
}

Set-PSReadlineOption -AddToHistoryHandler {
    param([string]$line)
    # Do not save any command line unless it has more than 3 characters.  Prevents storing gci, gps, etc.
    return $line.Length -gt 4
}

function jr
{
    jlink.exe "C:\Users\b41395\r.jlk"
}

set-executionpolicy -executionpolicy remotesigned

# thefuck app is currently not working
# iex "$(thefuck --alias)"

$PSDefaultParameterValues += @{'Get-Help:ShowWindow' = $true}
$PSDefaultParameterValues += @{'Get-History:Count'   = 10}
$PSDefaultParameterValues += @{'invoke-command:computername'   = "b18258-05"}

New-Variable -Name MyDocuments -Value ([environment]::GetFolderPath("mydocuments"))

function get-rss{
    ([xml](New-Object net.webclient).DownloadString(
						    "http://blogs.msdn.com/powershell/rss.aspx"
						   )).rss.channel.item | Format-Table title,link
}

function set-title{
    $Host.UI.RawUI.WindowTitle = "$args"
    }

Set-Alias -Name st -Value set-title

new-psdrive -Name dc -PSProvider FileSystem -Root (resolve-path ~/*documents) | out-null
new-psdrive -Name dl -PSProvider FileSystem -Root (resolve-path ~/downloads) | out-null
new-psdrive -Name T -PSProvider FileSystem -Root (resolve-path c:/TEMP) | out-null

function nm($file, [switch]$v){
	$ex = gci $file | select -ExpandProperty extension
	if($v){
	    $split = '-new_console:s40V'
	} else{
	    $split = '-new_console:s40H'
	}
	switch($ex){
		".ps1" {
		    nodemon $split --exec 'C:\windows\System32\WindowsPowerShell\v1.0\powershell.exe -noprofile' $file   --ext ps1
		    break
		    }
		".R"{
		    # somehow not working when updating node from v6 to v8

		    $env:Path += ";C:\Program Files\R\R-3.4.0\bin\"
		    nodemon $split --exec 'Rscript.exe' $file   --ext R
		    break
		    }
		".py"{
		    nodemon $split --exec 'python' $file   --ext py
		    break
		}
		".jlk"{
		    nodemon $split --exec 'jlink' $file   --ext jlk
		    break
		    }
		".js"{
			nodemon $split $file
		    }
		default {"not supported yet"}
	    }
}


function c2h($file){
    C:\Users\b41395\learning\ps\code\html\csv2html.ps1 $file
    }

# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

function save-jumps ( $file)
{
    pushd C:\Users\b41395\j
    $global:PSReadlineMarks | Export-Clixml $file
    popd
}

function load-jumps( $file)
{
    pushd C:\Users\b41395\j
    if ($file -eq $null) {
        # if not provided, load data of last time
        $global:PSReadlineMarks = Import-Clixml (Get-ChildItem | Sort-Object lastaccesstime -Descending | Select-Object -First 1)
    } elseif (Test-Path $file){
        $global:PSReadlineMarks = Import-Clixml $file
        # make current data the lastest
        touch $file
    } else{
    "file does not exit!"
    }
    popd
}

Set-Alias -Name sj -Value save-jumps
Set-Alias -Name lj -Value load-jumps
Set-Alias -Name np -Value notepad
$h = "-new_console:sH"
$v = "-new_console:sV"

function Get-weather {
    param(
    # the city name for the weather
    [Parameter(ValueFromPipeline=$true)]
    [string]
    $City = "tianjin"
    )
    process{
    (Invoke-WebRequest "http://wttr.in/$City" -UserAgent curl).content -split "`n" | Select-Object -First 7
    }
}
