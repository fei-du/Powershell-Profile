#Persistent
#SingleInstance force
^m::Send, Wxdf201611{Enter}
#n::Run, powershell.exe -command "& {google}" -windowstyle Hidden

#t::Run, C:\Users\b41395\Documents\ConEmuPack.160111\ConEmu64.exe
RControl & RShift::AltTab  ; Hold down right-control then press right-shift repeatedly to move forward.
RControl & Enter::ShiftAltTab  ; Without even having to release right-control, press Enter to reverse direction.

:*:/ip::
	Send, %A_IPAddress1%
return
::6ul::/proj/imx6ul/design/workarea/b41395/
::wapp::write-app
::wubt::sdhc-write
::@wy::wanyuan.yu@nxp.com
::@df::fei.du@nxp.com
::tjnpe::TJN PE Weekly ww1016 DF JJ
::@team::Jianguang Cao <jianguang.cao@nxp.com>; Le Chang <le.chang@nxp.com>; Xin Cui <xin.cui@nxp.com>; Haifeng Hu <haifeng.hu@nxp.com>; Pengyan Li <pengyan.li@nxp.com>; Wen Li <winnie.li@nxp.com>; Zheyuan Liu <zheyuan.liu@nxp.com>; Bin Lu <bin.lu@nxp.com>; Kan Liu <kan.liu@nxp.com>; Ken Song <ken.song@nxp.com>; Siliang Wang <siliang.wang@nxp.com>; Zhicheng Wang <zhicheng.wang@nxp.com>; Li Jiang Wu <lijiang.wu@nxp.com>; Yunpeng Xu <yunpeng.xu@nxp.com>; Wanyuan Yu <wanyuan.yu@nxp.com>; Hongxu Zhang <hongxu.zhang@nxp.com>; Rixing Zhao <rixing.zhao@nxp.com>; Bin Wang <bin.wang@nxp.com>
OnClipboardChange:
ToolTip Clipboard data type: %A_EventInfo%
a = %A_eventinfo%
if (a = 2)
{
	send {lcontrol down}c{lcontrol up}
	Sleep 1000
	Send {LControl down}``{LControl up}
	send gps SnippingTool -ErrorAction SilentlyContinue | spps {Enter}
	Send {LControl down}``{LControl up}
}
Sleep 1000
ToolTip  ; Turn off the tip.
return
