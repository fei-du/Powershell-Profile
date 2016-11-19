# using autohotkey to speed up
C:\Users\b41395\Documents\WindowsPowerShell\autohotkey.ahk

function get-trans($transid){
C:\Users\b41395\Downloads\WindowsTrans\trans.exe -g $transid
}

#function birthday{
#[datetime]'06/03/2017' - (Get-Date)
#}


function dp(){
(pwd).Path | clip
}

function Out-Default
{
    [CmdletBinding(confirmimpact="medium")]
    param(
        [parameter(ValueFromPipeline=$true)]
        [System.Management.Automation.PSObject] $inputobject
    )

    begin
    {
        $wrappedcmdlet = $ExecutionContext.InvokeCommand.GetCmdlet("Out-Default")
        $sb = {& $wrappedcmdlet @PSBoundParameters}
        $__sp = $sb.GetSteppablePipeline()
        $__sp.Begin($PSCmdlet)
    }

    process
    {
        $do_process = $true
        if ($_ -is [System.Management.Automation.ErrorRecord])
        {
            if ($_.exception -is [System.Management.Automation.CommandNotFoundException])
            {
                $__command = $_.exception.commandname
                if (test-path -Path $__command -PathType Container)
                {
                    Set-Location $__command
                    $do_process = $false
                }
                elseif ( $__command -match '^http://|\.(com|org|net|edu)$')
                {
                 if ($Matches[0] -ne "http://")
                    {
                        $__command = "HTTP://" + $__command
                    }
                [System.Diagnostics.Process]::Start($__command)
                $do_process = $false
                }
            }
        }
        
        if ($do_process)
        {
            $Global:last = $_;
            $__sp.Process($_)
        }

    }
    end
    {
        $__sp.end()
    }
}

$host.PrivateData.Errorforegroundcolor = 'green'


function open-com {
    #C:\Users\b41395\Downloads\putty.exe -load "COM9" -new_console:s40H
    C:\Users\b41395\Downloads\putty.exe  -new_console:s40H
}
function close-com {
    ps putty | spps
}

function 18th {
    C:\Users\b41395\Downloads\putty.exe -load "18th" -new_console
}
function get-com {
    [System.IO.Ports.SerialPort]::GetPortNames()
}

Add-Type -AssemblyName System.Windows.Forms

Set-Alias -Name zip -Value Compress-Archive
Set-Alias -Name unzip -Value Expand-Archive
Set-Alias -Name ocom -Value open-com
Set-Alias -Name g -Value git
#Set-Alias -Name ls -Value PowerLS -Option AllScope
#Export-ModuleMember -Function *-* -Alias *

$env:Path += ";C:\Users\b41395\myexe\ctags58"
$env:Path += ";C:\Program Files\R\R-3.2.3\bin\x64"
$env:Path += "C:\Users\b41395\Downloads\WindowsTrans"
$env:Path += "C:\Program Files (x86)\IAR Systems\Embedded Workbench 7.5\arm\bin"
$env:Path += ";C:\Program Files (x86)\SEGGER\JLink_V502d"
$env:Path += ";C:\Program Files (x86)\IAR Systems\Embedded Workbench 7.5\common\bin"
Enable-HistoryPersistence
New-DynamicVariable GLOBAL:WindowTitle -Getter { $host.UI.RawUI.WindowTitle} -Setter {$host.ui.RawUI.WindowTitle = $args[0]}
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
