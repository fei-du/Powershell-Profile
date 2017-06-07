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
Set-Alias -Name oc -Value open-com
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
(pwd).Path | clip
}

Set-PSReadlineKeyHandler -key Ctrl+o -briefDescription "open putty" -ScriptBlock {
C:\Users\b41395\Downloads\putty.exe  -new_console:s40H
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

Set-PSReadlineKeyHandler -key Ctrl+i -briefDescription "file explorer pwd" -ScriptBlock {
    ii .
}

function jr
{
    jlink.exe "C:\Users\b41395\r.jlk"
}
