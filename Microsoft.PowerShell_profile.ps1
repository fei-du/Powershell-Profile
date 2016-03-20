#Set-Alias gh Get-Help
function set-profile {
    ise $profile
}

function cpass6ull{
start 'http://compass.freescale.net/livelink/livelink?func=ll&objId=234616371&objAction=browse&viewType=1'
}

function compassultra{
 start 'http://compass.freescale.net/livelink/livelink?func=ll&objId=234218038&objAction=browse&sort=name'
}
function ip {
	ipconfig | select-string "Address"	
}

function get-trans($transid){
C:\Users\b41395\Downloads\WindowsTrans\trans.exe -g $transid
}
function mt256 {
    Set-Location C:\Users\b41395\D\Denny\BACES\Project\MT256
}

function ma512 {
    Set-Location C:\Users\b41395\D\Denny\BACES\Project\MA512
}
function ie{
&"C:\Program Files\Internet Explorer\iexplore.exe" "www.google.com"
}
function ..{
    cd ..
}
function birthday{
[datetime]'06/03/2016' - (Get-Date)
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

function baidu($search){
start "https://www.baidu.com/s?ie=utf-8&f=8&rsv_bp=0&rsv_idx=1&tn=baidu&wd=$search&rsv_pq=dd3d27a9005ae8b1&rsv_t=b3c43wiJzwoT02u%2Fo%2FB0RgW7Yn0nGHXqzcW35zirhzf6dYUH8e6tTwFQ4JY&rsv_enter=1&rsv_sug3=7&rsv_sug1=4&rsv_sug7=100"
}
function bing($search){
"http://cn.bing.com/search?q=$search&go=Submit&qs=n&form=QBLH&pq=svn&sc=8-3&sp=-1&sk=&cvid=6241CF63D8FE4E5B96CFC198F441AC4E"
}

function sdhc-write($transid){
    Set-Location C:\Users\b41395\Downloads\WindowsTrans\repo
    if ([string]$transid.length -eq 9){
        mv .\u-boot.imx ([string](Get-Date).Ticks + "u-boot.imx")
        ..\trans.exe -g $transid
        }
    if ((Get-PSDrive e -ErrorAction Stop).free -lt 0) {
    ..\CFImager.exe -raw -offset 0x400 -f .\u-boot.imx -d E -n
    }
}

function app-write{
Push-Location
Set-Location C:\Users\b41395\Downloads\WindowsTrans\repo
    if ((Get-PSDrive e -ErrorAction Stop).free -lt 0) {
    ..\CFImager.exe -raw -offset 0x400 -f (Get-ChildItem *bin | sort -Descending | Select-Object -First 1).fullname -d E -n
    }
Pop-Location
}

function get-com5{
C:\Users\b41395\Downloads\putty.exe -new_console:s -load "COM5"
}
# using autohotkey to speed up
C:\Users\b41395\Documents\WindowsPowerShell\autohotkey.ahk

function cv {
 convert-path . | cb	
}
function ll{
$size = @{Expression={ [int]($_.Length/1KB) }; Label="KB" }
$lastAccessed = @{Expression={(New-TimeSpan $_.Lastaccesstime (Get-Date)).Days}; Label="Accessed(days)" }
$lastcreated = @{Expression={(New-TimeSpan $_.creationtime (Get-Date)).Days}; Label="Created(days)" }
dir | Format-Table mode,$size,$lastAccessed,$lastcreated, name  -AutoSize
}
function ex {
    explorer.exe .
}

Add-Type -AssemblyName System.Windows.Forms

Function Get-Clipboard {
	    param([switch]$SplitLines)

	        $text = [Windows.Forms.Clipboard]::GetText();

		    if ($SplitLines) {
			            $xs = $text -split [Environment]::NewLine
				            if ($xs.Length -gt 1 -and -not($xs[-1])) {
						                $xs[0..($xs.Length - 2)]
								        } else {
										            $xs
											            }
												        } else {
														        $text
															    }
}

function Set-Clipboard {
	    $in = @($input)

	        $out = 
		        if ($in.Length -eq 1 -and $in[0] -is [string]) { $in[0] }
			        else { $in | Out-String }

				    [Windows.Forms.Clipboard]::SetText($out);
}

function GetSet-Clipboard {
	    param([switch]$SplitLines, [Parameter(ValueFromPipeLine=$true)]$ObjectSet)

	        if ($input) {
			        $ObjectSet = $input;
				    }

				        if ($ObjectSet) {
						        $ObjectSet | Set-Clipboard
							    } else {
								            Get-Clipboard -SplitLines:$SplitLines
									        }
}

Set-Alias cb GetSet-Clipboard
Set-Alias -Name ls -Value PowerLS -Option AllScope
#Export-ModuleMember -Function *-* -Alias *
set-alias sz "$env:ProgramFiles\7-Zip\7z.exe"


#New-PSDrive -Name kl80 -PSProvider FileSystem -Root "C:\Users\b41395\D\Denny\BACES\Project\K80_256\IDD\KL80" | Out-Null
#New-PSDrive -Name kl80repo -PSProvider FileSystem -Root "Z:\KL80\IDD" | Out-Null
#New-PSDrive -Name pss -PSProvider FileSystem -Root "C:\Users\b41395\learning\powershell\scripting" | Out-Null
#New-PSDrive -Name xml -PSProvider FileSystem -Root "C:\Users\b41395\learning\xml" | Out-Null
#New-PSDrive -Name pi -PSProvider FileSystem -Root "C:\Users\b41395\learning\pi" | Out-Null
#New-PSDrive -Name ma512 -PSProvider FileSystem -Root "C:\Users\b41395\D\Denny\BACES\Project\MA512" | Out-Null
#New-PSDrive -Name mt256 -PSProvider FileSystem -Root "C:\Users\b41395\D\Denny\BACES\Project\MT256" | Out-Null
#New-PSDrive -Name vim -PSProvider FileSystem -Root "C:\Users\b41395\learning\vim" | Out-Null

#New-PSDrive -Name git -PSProvider FileSystem -Root "C:\Users\b41395\learning\git" | Out-Null
#New-PSDrive -Name ks22 -PSProvider FileSystem -Root "C:\Users\b41395\OneDrive - Freescale Semiconductor\Projects\KS256" | Out-Null

#New-PSDrive -Name ruby -PSProvider FileSystem -Root "C:\Users\b41395\D\Denny\BACES\learning\Ruby" | Out-Null

#New-PSDrive -Name ks22i2cdut -PSProvider FileSystem -Root "C:\Users\b41395\D\Denny\BACES\Project\KS22\lpi2c\examples\mapsks22f256\demo_apps\lpi2c_slave_vlps\src" | Out-Null

#New-PSDrive -Name imx -PSProvider FileSystem -Root "C:\Users\b41395\D\Denny\BACES\Project\I.MX" | Out-Null
#New-PSDrive -Name arm -PSProvider FileSystem -Root "C:\Users\b41395\learning\arm" | Out-Null
#New-PSDrive -Name r -PSProvider FileSystem -Root "C:\Users\b41395\D\Denny\BACES\learning\Ruby\r" | Out-Null
#New-PSDrive -Name linux FileSystem -Root "C:\Users\b41395\D\Denny\BACES\learning\Linux" | Out-Null


#$pdf='C:\Program Files (x86)\Adobe\Reader 11.0\Reader\AcroRd32.exe'
# function Prompt {"Chulk. >"}
new-alias gh get-help
new-alias psd pushd
new-alias ppd popd
New-Alias wheres Compare-Property

$env:Path += ";C:\Program Files (x86)\Google\Chrome\Application"
$env:Path += ";C:\Program Files\Internet Explorer"
$env:Path += ";C:\Program Files\R\R-3.2.3\bin\x64\"
$env:Path += "C:\Program Files\7-Zip"
#$env:Path += ";C:\Program Files\LeostreamConnect\"
#$env:Path += ";C:\Program Files (x86)\Tencent\WeChat\"
#$env:Path += ";C:\Program Files (x86)\Vim\vim74\"
Enable-HistoryPersistence
New-DynamicVariable GLOBAL:WindowTitle -Getter { $host.UI.RawUI.WindowTitle} -Setter {$host.ui.RawUI.WindowTitle = $args[0]}
# Load posh-git example profile
. 'C:\Users\b41395\Documents\WindowsPowerShell\Modules\posh-git\profile.example.ps1'


# Load Jump-Location profile
Import-Module 'C:\Users\b41395\Documents\WindowsPowerShell\Modules\Jump.Location\Jump.Location.psd1'
Import-Module PSColors

