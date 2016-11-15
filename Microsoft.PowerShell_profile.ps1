function mad{
start 'http://compass.freescale.net/livelink/livelink?func=ll&objId=194994268&objAction=browse&sort=name'
}

function baceshome{
start 'https://nxp1.sharepoint.com/sites/MCUops/baces/SitePages/Home.aspx'
}

function compassultra{
 start 'http://compass.freescale.net/livelink/livelink?func=ll&objId=234218038&objAction=browse&sort=name'
}
function timesheet{
start 'https://nxp.sciforma.net/sciforma/?ACSREQUESTID=_ecb55570-1049-4b5d-af18-03434f742b42#95403'
}

# using autohotkey to speed up
C:\Users\b41395\Documents\WindowsPowerShell\autohotkey.ahk

function get-trans($transid){
C:\Users\b41395\Downloads\WindowsTrans\trans.exe -g $transid
}

function birthday{
[datetime]'06/03/2017' - (Get-Date)
}

function google($search) {
start "https://www.google.com/#q=$search"
}

function youtube($search) {
start "https://www.youtube.com/results?search_query=$search"
}


function stackoverflow($search) {
start "http://stackoverflow.com/search?q=$search"
}

function pwdcp(){
(pwd).Path | clip
}

function baidu($search){
start "https://www.baidu.com/s?ie=utf-8&f=8&rsv_bp=0&rsv_idx=1&tn=baidu&wd=$search&rsv_pq=dd3d27a9005ae8b1&rsv_t=b3c43wiJzwoT02u%2Fo%2FB0RgW7Yn0nGHXqzcW35zirhzf6dYUH8e6tTwFQ4JY&rsv_enter=1&rsv_sug3=7&rsv_sug1=4&rsv_sug7=100"
}
function bing($search){
"http://cn.bing.com/search?q=$search&go=Submit&qs=n&form=QBLH&pq=svn&sc=8-3&sp=-1&sk=&cvid=6241CF63D8FE4E5B96CFC198F441AC4E"
}

$credentials = Get-Credential -Credential b41395
$Session = New-SFTPSession -ComputerName "lvd5192.ap.freescale.net" -Credential $credentials
function update-elf{
$localpath = "Y:\proj\imx6ull\design\workarea\b41395\test\validation\vectors\osc\stimulus"
Get-SFTPFile -SFTPSession $Session -RemoteFile "/proj/imx6ull/design/workarea/b41395/test/validation/vectors/osc/stimulus/osc.map" -LocalPath $localpath -Overwrite
Get-SFTPFile -SFTPSession $Session -RemoteFile "/proj/imx6ull/design/workarea/b41395/test/validation/vectors/osc/stimulus/osc.lst_lnk" -LocalPath $localpath -Overwrite
Get-SFTPFile -SFTPSession $Session -RemoteFile "/proj/imx6ull/design/workarea/b41395/test/validation/vectors/osc/stimulus/osc.elf.hex" -LocalPath $localpath -Overwrite
Get-SFTPFile -SFTPSession $Session -RemoteFile "/proj/imx6ull/design/workarea/b41395/test/validation/vectors/osc/stimulus/osc.elf" -LocalPath $localpath -Overwrite
Get-SFTPFile -SFTPSession $Session -RemoteFile "/proj/imx6ull/design/workarea/b41395/test/validation/vectors/osc/stimulus/osc.c" -LocalPath $localpath -Overwrite
}

function get-exe{
Push-Location
cd C:\TEMP
$localpath = pwd
Get-SFTPFile -SFTPSession $Session -RemoteFile "/proj/imx6ull/design/workarea/b41395/test/validation/vectors/osc/stimulus/imx6ull_osc_osc.exe" -LocalPath $localpath -Overwrite
.\imx6ull_osc_osc.exe -new_console:s
Pop-Location
}
function write-bin{
Push-Location
cd C:\TEMP
$localpath = pwd
Get-SFTPFile -SFTPSession $Session -RemoteFile "/proj/imx6ull/design/workarea/b41395/test/validation/vectors/osc/stimulus/imx6ull_osc_osc.bin" -LocalPath $localpath -Overwrite
C:\Users\b41395\Downloads\WindowsTrans\CFImager.exe -raw -offset 0x400 -f .\imx6ull_osc_osc.bin -d D -n
Pop-Location
}

function write-ubt{
Push-Location
cd C:\TEMP
$localpath = pwd
Get-SFTPFile -SFTPSession $Session -RemoteFile "/home/b41395/6ull/uboot-imx-testbuild/u-boot.imx" -LocalPath $localpath -Overwrite
C:\Users\b41395\Downloads\WindowsTrans\CFImager.exe -raw -offset 0x400 -f .\u-boot.imx -d D -n
Pop-Location
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
#Start-Transcript .\console.txt -Append

function sdhc-write($transid){
    Set-Location C:\Users\b41395\Downloads\WindowsTrans\repo
    if ([string]$transid.length -eq 9){
        mv .\u-boot.imx ([string](Get-Date).Ticks + "u-boot.imx")
        ..\trans.exe -g $transid
        }
    if ((Get-PSDrive d -ErrorAction Stop).free -lt 0) {
    ..\CFImager.exe -raw -offset 0x400 -f .\u-boot.imx -d D -n
    }
}

function write-app{
Push-Location
Set-Location C:\Users\b41395\Downloads\WindowsTrans\repo
    if ((Get-PSDrive e -ErrorAction Stop).free -lt 0) {
    Write-Host (Get-ChildItem *bin | sort -Descending | Select-Object -First 1).name
    ..\CFImager.exe -raw -offset 0x400 -f (Get-ChildItem *bin | sort -Descending | Select-Object -First 1).fullname -d E -n
    }
Pop-Location
}

function start-app{
Push-Location
Set-Location C:\Users\b41395\Downloads\WindowsTrans\repo
    C:\Users\b41395\Downloads\WindowsTrans\repo\i.MX6UL_Validation.exe
Pop-Location
}

function stop-app{
    Get-Process i.MX6UL_Validation -ErrorAction SilentlyContinue| Stop-Process
}

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
#Set-Alias -Name ls -Value PowerLS -Option AllScope
#Export-ModuleMember -Function *-* -Alias *


New-Alias wheres Compare-Property

$env:Path += ";C:\Users\b41395\myexe\ctags58"
$env:Path += ";C:\Program Files\R\R-3.2.3\bin\x64"
$env:Path += "C:\Program Files\7-Zip"
$env:Path += "C:\Users\b41395\Downloads\WindowsTrans"
$env:Path += "C:\Program Files\Far Manager"
$env:Path += "C:\Program Files (x86)\IAR Systems\Embedded Workbench 7.5\arm\bin"
$env:Path += ";C:\Program Files (x86)\SEGGER\JLink_V502d"
$env:Path += ";C:\Program Files (x86)\IAR Systems\Embedded Workbench 7.5\common\bin"
Enable-HistoryPersistence
New-DynamicVariable GLOBAL:WindowTitle -Getter { $host.UI.RawUI.WindowTitle} -Setter {$host.ui.RawUI.WindowTitle = $args[0]}
# Load posh-git example profile
. 'C:\Users\b41395\Documents\WindowsPowerShell\Modules\posh-git\profile.example.ps1'


Load Jump-Location profile
Import-Module 'C:\Users\b41395\Documents\WindowsPowerShell\Modules\Jump.Location\Jump.Location.psd1'
#Import-Module PSColors
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

Remove-Module powershellcookbook

$r ='C:\Program Files\R\R-3.3.1\bin\R.exe'

function slexe{
gci -Path C:\Users\b41395\proj\ssl\try_env\build\B41395\imx6sll *exe -Recurse | sort lastwritetime -Descending | select -First 1 | ii 
}

function Set-profile{
	vim C:\Users\b41395\my_profile.ps1
}

set-alias gh get-help

function Connect-Wifi{
netsh wlan connect name=Freescale
}
set-alias wifi Connect-Wifi
