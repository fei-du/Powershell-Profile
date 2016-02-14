#Set-Alias gh Get-Help
function set-profile {
    ise $profile
}

function ip {
	ipconfig | select-string "Address"	
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


$env:Path += ";C:\Program Files (x86)\Google\Chrome\Application"
$env:Path += ";C:\Program Files\Internet Explorer"
$env:Path += ";C:\Program Files\R\R-3.2.3\bin\x64\"
#$env:Path += ";C:\Program Files\LeostreamConnect\"
#$env:Path += ";C:\Program Files (x86)\Tencent\WeChat\"
#$env:Path += ";C:\Program Files (x86)\Vim\vim74\"
Enable-HistoryPersistence

# Load posh-git example profile
. 'C:\Users\b41395\Documents\WindowsPowerShell\Modules\posh-git\profile.example.ps1'


# Load Jump-Location profile
Import-Module 'C:\Users\b41395\Documents\WindowsPowerShell\Modules\Jump.Location\Jump.Location.psd1'
Import-Module PSColors

