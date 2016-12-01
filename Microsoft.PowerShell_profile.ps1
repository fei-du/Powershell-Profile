function get-trans($transid){
C:\Users\b41395\Downloads\WindowsTrans\trans.exe -g $transid
}

#function birthday{
#[datetime]'06/03/2017' - (Get-Date)
#}


function dp(){
(pwd).Path | clip
}

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

Add-Type -AssemblyName System.Windows.Forms

Set-Alias -Name zip -Value Compress-Archive
Set-Alias -Name unzip -Value Expand-Archive
Set-Alias -Name oc -Value open-com
Set-Alias -Name g -Value git
#Set-Alias -Name ls -Value PowerLS -Option AllScope
#Export-ModuleMember -Function *-* -Alias *

$env:Path += ";C:\Users\b41395\myexe\ctags58"
$env:Path += ";C:\Users\b41395\myexe"
$env:Path += ";C:\Program Files\R\R-3.2.3\bin\x64"
$env:Path += "C:\Users\b41395\Downloads\WindowsTrans"
$env:Path += "C:\Program Files (x86)\IAR Systems\Embedded Workbench 7.5\arm\bin"
$env:Path += ";C:\Program Files (x86)\SEGGER\JLink_V502d"
$env:Path += ";C:\Program Files (x86)\IAR Systems\Embedded Workbench 7.5\common\bin"
#Enable-HistoryPersistence
#New-DynamicVariable GLOBAL:WindowTitle -Getter { $host.UI.RawUI.WindowTitle} -Setter {$host.ui.RawUI.WindowTitle = $args[0]}
# Load posh-git example profile
. 'C:\Users\b41395\Documents\WindowsPowerShell\Modules\posh-git\profile.example.ps1'


#Load Jump-Location profile
Import-Module 'C:\Users\b41395\Documents\WindowsPowerShell\Modules\Jump.Location\Jump.Location.psd1'
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

$r ='C:\Program Files\R\R-3.3.1\bin\R.exe'

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
